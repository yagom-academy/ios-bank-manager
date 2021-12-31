# README

# STEP1

### 1. 테스트만을 위한 코드가 필요함

문제: Queue가 비었는지 테스트 하기 곤란했어요. head와 tail이 private 프로퍼티라서, isEmpty 프로퍼티를 테스트 코드에 사용했어요.

해결: 저희는 private 프로퍼티에 접근할 수 있는 모델을 테스트용으로 따로 만들어서 해결했습니다.

```swift
// 아래 코드를 Tests에 넣기
struct QueueTest<T> {
    var head: Node<T>?
    weak var tail: Node<T>?
    ...
}
```

### 2. 테스트에서 빌드 타겟이 낮다고 에러가 발생하는 경우

![146771281-9d04cf18-4f2e-40d6-a0c3-944f25bdfd69](146771281-9d04cf18-4f2e-40d6-a0c3-944f25bdfd69.png)Development Target을 10.15버전으로 설정 하고 프로젝트를 진행하였는데 아래와 같이 최소 macOS 11.0버전 이상을 사용해야한다는 에러가 발생하였습니다.

> :0: error: compiling for macOS 10.15, but module 
'BankManagerConsoleApp' has a minimum deployment target of macOS 11.0: 
/Users/bagbyeongho/Library/Developer/Xcode/DerivedData/BankManagerConsoleApp-dqypvgeqyvfercdoqawwhvgnrjaz/Build/Intermediates.noindex/BankManagerConsoleApp.build/Debug/BankManagerConsoleApp.build/Objects-normal/arm64/main~partial.swiftmodule
Command MergeSwiftModule failed with a nonzero exit code
> 

모두 Xcode 버전은 같은데 10.15버전에서도 빌드가 되는 캠퍼(M1, OS: 12.x버전)도 있고 
11.0버전 이상 되어야 빌드가 되는 캠퍼(M1, 인텔, OS: 11.x버전)가 있어 CPU나 버전으로는 해답을 찾을수가 
없었습니다.

해결 : 이를 해결하기 위해 이유를 구글링도 해보았지만 답을 찾을 수 없었습니다. 그래서 현재는 Development Target을 11.0버전으로 맞추었습니다.

### 3. [@testable](https://github.com/testable) import 오류

테스트 모듈과의 연결을 위해 [@testable](https://github.com/testable) import를 사용하려고 하였습니다. 그런데 모듈을 찾을 수 없다는 아래와 같은 에러가 발생하였습니다.

> Could not find module 'BankManagerConsoleApp' for target 
'x86_64-apple-macos'; found: arm64, arm64-apple-macos, at: 
/Users/bagbyeongho/Library/Developer/Xcode/DerivedData/BankManagerConsoleApp-dqypvgeqyvfercdoqawwhvgnrjaz/Index/Build/Products/Debug/BankManagerConsoleApp.swiftmodule
> 

해결: 파일마다 일일이 테스트 모듈을 Target Membership으로 체크해주었습니다.

### 4. 반환값을 버리는 코드

```swift
// BankManagerConsoleApp/Tests/Tests.swift
func test_큐에_1을_enqueue후_dequeue하면_큐가_비어있는지() {
    var queue = Queue<Int>()
    queue.enqueue(1)
    _ = queue.dequeue()
}
```

위 코드에서 `_ = queue.dequeue()` 를 사용한 이유입니다.

```swift
@discardableResult
mutating func dequeue() -> T? { return value }
```

위와 같은 방법도 있지만, 반환값을 사용하리라 예상되는 함수라서 이번에는 사용하지 않았습니다!

테스트 코드에서는 `dequeue()` 의 반환값을 사용하지 않지만, BankManagerConsoleApp에서는 `dequeue()` 의 반환값을 사용할 것이라 생각되어서 warning이 일부러 발생하도록 했습니다!

테스트코드가 조금 지저분해지더라도 Product 코드에 warning이 뜨도록 하여 실수를 방지하는데 더 중점을 두었습니다!

# STEP2

### 1. Queue를 class로 만든 이유

LinkedList의 구조상 '노드'라는 참조타입을 저장 프로퍼티로 가져야 하다보니 자신이 값타입이더라도 참조타입의 단점을 고스란히 가지는 것 같습니다. (LinkedList가 값타입이더라도 다른 변수에 할당할 때 완전한 copy가 일어나지 않음 + LinkedList를 메모리 해제하더라도 그 안의 노드가 해제될지는 알 수 없음 등)
이처럼 LinkedList만 struct로 해주면 일반적인 값타입과는 다르게 동작하기 때문에 헷갈릴 수 있을 것 같습니다. 차라리 LinkedList도 참조타입인 class로 해주는 편이 결과 파악에는 편할 것 같습니다.

```swift
var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)

var queue2 = queue
queue2.enqueue(3)
// dequeue 예상
queue.dequeue() // 1
queue.dequeue() // 2
queue.dequeue() // 3

// dequeue 예상
queue2.dequeue() // 1
queue2.dequeue() // 2
queue2.dequeue() // 3
```

`Queue`가 구조체라면 위 상황이 문제입니다.

`Queue`의 인스턴스는 다르지만 `Node`의 참조가 같아서, 다른 큐에 영향을 미치게 됩니다.

같은 이유로 `Bank`도 `class`여야 합니다.

### 2. 비동기작업 구현 방법

```swift
private let semaphore: DispatchSemaphore

let group = DispatchGroup()
while let client = clients.dequeue() {
	DispatchQueue.global().async(group: group) {
	  self.semaphore.wait()
	  self.respond(to: client)
	  self.semaphore.signal()
    }
}
group.wait()
```

은행 업무 로직을 `Dispatch Queue`를 사용하여 코드를 구현하였습니다.

`DispatchGroup`을 사용하여 비동기 작업들을 그룹화 해주고 모든 작업이 끝날 때 까지 프로그램이 종료되지 않고 기다리도록 하였습니다.`semaphore`를 활용하여 은행원 수(쓰레드 수)를 제어할 수 있도록 했고, `Bank` 타입의 이니셜라이저를 통해 초기화 할 수 있도록 했습니다.

### 3. Bank와 BankManager로 역할분리

콘솔앱을 구동하기 위해 필요한 역할들을 핵심적인 역할이라 할 수 있는 **`은행 업무 처리`**와 사용자 입력을 받고 임의의 고객 수를 생성하는 등 `앱 구동`과 관련한 역할로 나누어 보았습니다

두 역할이 구분된다고 판단되어 타입을 분리하였습니다. 은행 업무 처리는 `Bank`에서 앱구동과 관련한 동작들은 `BankManager`에서 수행하도록 구현하였습니다

### 4. Naming 관련 고민

구체적인 이름을 정하려고 고민했습니다.

`admit(numberOfClients: Int)`

→ `addClientsToQueue(by numberOfClients: Int)`

Bank 타입의 work라고 하면 다소 추상적인듯하여 조금 더 구체적인 고객을 응대한다는 의미로 respond로 수정해보았습니다

`work(for: Client)`

→ `respond(to client: Client)`

### 5. Thread explosion

`semaphore.wait()` 의 위치를 global 큐에 넣기 전으로 변경하였습니다. 기존 코드는 wait()을 Task 안에 정의해놔서 **스레드**가 세마포어를 기다리게 됩니다. 이렇게 되면 한번에 많은 Thread가 lock이 걸린 채 존재할 수 있어 Thread explosion이 우려됩니다.

```swift
// 변경전
let group = DispatchGroup()
    while let client = clients.dequeue() {
        DispatchQueue.global().async(group: group) {
            self.semaphore.wait()
```

```swift
// 변경후
let group = DispatchGroup()
    while let client = clients.dequeue() {
        semaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.respond(to: client)
            self.semaphore.signal()
        }
```

# STEP3

### 1. 동시성 구조

예금업무는 동시에 2명까지, 대출업무는 1명이 업무를 처리해야 합니다. 이를 위해  Concurrent 
Queue에 DispatchSemaphore를 설정하는 구조로 구현하였습니다. 이후 세마포어를 기다리는 작업을 Main 
Thread에게 시키면 App이 멈추므로 업무별 Serial Queue를 만들어주고 거기서 기다리도록 구현하였습니다.

![147523227-a157d8d0-ffa3-4b3c-a806-c36881c31550](147523227-a157d8d0-ffa3-4b3c-a806-c36881c31550.png)

### 2. 어떤 메서드가 내부에서 async를 호출하는지 밖에서 보이지 않는문제

코드가 길어 한 번에 봐야할 코드가 길고 구체적인 업무처리 로직을 별도의 메서드에서 관리하는 컨셉으로 `processAllServices` 는 ‘모든 업무’를 처리하는 기능, `processDeposit,LoanService` 는 ‘하나의 개별 업무’를 처리하는 기능으로 세분화하였습니다

#### 문제

함수를 세분화하다보니 async 작업이 숨겨져 밖에서는 어떤 함수가 비동기 작업을 하는지 파악하기 어려운 문제가 있었습니다.

#### 해결방안

이런 상황에서 메서드 안에 `async()` 메서드를 사용하고 있다는 것을 쉽기 알리기 위해서 저희가 생각한 방법은 메서드명으로 알리기, 주석으로 알려주기 아니면 애초에 이런 로직은 함수로 분리하지 않는다? 등 생각을 해보았습니다.

```swift
while let client = clients.dequeue() {
    switch client.business {
    case .deposit:
        depositDispatchQueue.async(group: group) {
            self.depositSemaphore.wait()
            self.processDepositService(to: client, group: group)
        }
    case .loan:
        loanDispatchQueue.async(group: group) {
            self.loanSemaphore.wait()
            self.processLoanService(to: client, group: group)
        }
    }
}

private func processDepositService(to client: Client, group: DispatchGroup) {
    DispatchQueue.global().async(group: group) {
        ...
        self.depositSemaphore.signal()
    }
}

private func processLoanService(to client: Client, group: DispatchGroup) {
    DispatchQueue.global().async(group: group) {
        ...
        self.loanSemaphore.signal()
    }
}
```

# STEP4

## 🤔 고민한 점

### 1. CustomView를 정의하여 뷰컨으로부터 view에 대한 설정을 분리

이번엔 스토리보드가 아닌 코드로만 UI를 구성해야 한다는 요구사항이 있었습니다. 그러다보니 기존 방식대로 view 설정을 뷰컨에서 해주면 뷰컨의 크기가 너무 커져서, **view에 대한 설정을 뷰컨으로부터 분리**할 방법을 생각해보았습니다

`UIView`를 상속받는 `BankMangerView`를 정의하고 인스턴스 생성 시점에 UI를 설정하게 구현하였습니다. 그리고 뷰컨에서는 `viewDidLoad()` 시점에 그 인스턴스를 생성하여 자신의 `view` 프로퍼티에 넣어주는 방식으로 구현하였습니다

### 2. 타이머 동작 방식

타이머 동작 방식은 `Timer` 와 `RunLoop`를 사용하여 특정 시간마다 코드를 반복하도록 하였습니다.
0.013초 마다 경과 시간에 0.013을 더하고 레이블을 업데이트 하도록 구현하였습니다.
업무가 끝나서 타이머를 중지해야 할 때는 `Timer.invalidate()`를 사용하여 중지하도록 했습니다.

하지만 0.013초 마다 0.013을 더하고 레이블을 업데이트 하도록 하는 연산에 걸리는 시간은 크게 고려하지 않아 약간의 오차가 발생할 수 있을 것 같습니다.

```swift
timer = Timer(timeInterval: 0.013, repeats: true) { _ in
    self.elapsedServiceTime += 0.013
    self.delegate?.updateServiceTimeLabel(serviceTime: self.elapsedServiceTime)
}
guard let timer = timer else {
    return
}
RunLoop.current.add(timer, forMode: .common)
```

### 3. 현재 작업을 끊지 않고 10명 추가하기

작업중에 startBankingService()를 호출하면 DispatchQueue에 작업을 추가하고 반환하도록 했습니다.

모든 작업이 끝나면 타이머를 끝내는 코드가 한번만 호출됩니다.

```swift
private var isProcessing = false

func startBankingService() {
    guard isProcessing == false else {
        processAllServices()
        return
    }
    isProcessing = true
    proessAllServices()

    group.notify(queue: DispatchQueue.global()) {
        self.isProcessing = false
    }
}
```

### 4. 초기화 버튼 동작 방식

초기화 버튼을 터치하게 되면 `타이머`와 `고객번호`, `DispatchQueue`에 있는 작업들을 초기화 해주어야합니다.

하지만 `DispatchQueue`에는 작업을 취소하는 기능이 없어 `OperationQueue`를 사용해야 하는데, 현재 `OprationQueue`를 공부하고 사용할 시간이 없다고 판단했습니다.
그래서 근본적인 해결 대신 우선 사용자가 보기에 초기화가 된 것 처럼 보일 수 있도록 구현하였습니다.

초기화 버튼을 터치하게 되면 `타이머`를 초기화 하고 `Bank` 타입과 커스텀 뷰로 만들어 놓은 `BankManagerView` 도 초기화 하도록 구현하였습니다. 델리게이트 또한 재할당을 함으로서 다시 연결을 할 수 있도록 했습니다.

### 5. delegate패턴 (BankDelegate)

Bank가 변경될 때, 뷰를 업데이트 하기위해 델리게이트 패턴을 사용했습니다.

```swift
weak var delegate: BankDelegate?

func addClientsToQueue(by numberOfClients: Int) {
    (1...numberOfClients).forEach {
        let client = Client(waitingNumber: self.numberOfClients + $0)
        clients.enqueue(client)
        delegate?.addWaitingClient(client: client)
    }
    self.numberOfClients += numberOfClients
}
```

## ❓ 조언을 듣고싶은 점

### 타이머 관련 타임 인터벌 적당한 수준이 있는지?

**문제상황**
프로젝트의 요구사항으로 타이머의 시간을 밀리초까지 UI에 표현해야 했습니다. 처음에는 정석대로 0.001초마다 UI를 
업데이트하도록 구현했는데 성능이 따라주지 못하는지 싱크가 밀려 시간을 제대로 세지 못하는 문제가 발생했습니다. (1000번의 
업데이트를 1초 안에 해내지 못하여, 현실에서 2초 정도가 지나야 비로소 타이머가 1초를 가리키는 문제). 일단은 어찌할 수 없는
 성능 문제로 보고 0.001초의 간격을 0.013초로 늘리는 방식을 택했습니다.

**질문**
질문드리고 싶은 점은, 이렇게 짧은 순간에 많은 UI 업데이트를 해야 하는 경우 문제가 발생할 수 있는데 그 시간 간격을 결정하는 기준이 있는지 궁금합니다. 저희는 실험적으로 조금씩 늘려가며 `느낌`으로 이정도면 제대로 동작하는 것 같다 싶어서 0.013초로 설정을 했는데 이런 느낌 기준은 너무 주관적이고 타이머가 해야 하는 작업 규모가 커지면 간격을 바꿔야 하는 경우도 생길 것 같습니다.

현업에서나 쿠마는 이런 경우에 UI 업데이트 간격을 몇 초로 설정해야 할지에 대한 기준을 어떻게 잡으시나요?