# 🏦 은행 창구 매니저 프로젝트

- 프로젝트 기간: [2주] 2021-12-20(월) ~ 2021-12-31(금)

- 캠퍼: 나무(@jsim27), 예거(@Jager-yoo)

- 리뷰어: 찌루루(@jae57)

<br>

# Step3 - 다중 처리 구현

## ❣️ Step3 추가 개선

### 1. ☑️ thread 개수가 고객의 수만큼 생성되는 게 아니라, 은행원의 수만큼만 생성되도록 수정

`while문`을 돌면서 `global().async`를 호출하게 되면, while문이 도는 횟수 만큼 `thread` 가 생성되고 `semaphore`의 wait() 앞에서 대기하는 것을 확인했습니다.
지금은 고객이 10~30명 수준이지만, 만약 고객이 10,000명으로 커진다면, thread 또한 10,000개가 생성되는 게 좋은 구조는 아니라고 생각했어요. 😅

먼저, 고객이 줄을 설 때, 하나의 큐가 아니라 업무에 따라서 별도에 큐에 들어가도록 `switch문`을 통해 구현했습니다.
그 후, 업무를 담당하는 은행원의 숫자 만큼 `for문`을 돌리고, 그 횟수 만큼만 `thread` 가 생성되도록 구현했습니다.

```swift
func start(with totalClients: Int) {
    ...
    for _ in 1...numberOfDepositBankers {
        serviceForClients(queue: depositQueue, in: dispatchGroup)
    }
    for _ in 1...numberOfLoanBankers {
        serviceForClients(queue: loanQueue, in: dispatchGroup)
    }
    dispatchGroup.wait()
    ...
}

private func serviceForClients(queue: Queue<Client>, in dispatchGroup: DispatchGroup) {
    DispatchQueue.global().async(group: dispatchGroup) {
        while let client = queue.dequeue() {
            self.service(for: client)
        }
    }
}
```

### 2. ☑️ Race Condition 발생하지 않도록 Thread-Safe한 모델 메서드 구현

기초가 되는 메서드 자체를 `Thread-Safe`하게 만듦으로써 불필요한 `semaphore` 생성을 줄이고, 상위 메서드에서 코드 로직도 심플하게 리팩토링했습니다.

📝 [관련 이슈 링크](https://github.com/Jager-yoo/ios-bank-manager/issues/4)

<br>

## 고민한 점

### ☑️ 1. 다중 처리 로직
여러 은행원이 동시에 `client`의 업무를 처리하되, 한 번에 일하는 은행원의 수를 제한하여 다중 처리하는 방식을 어떻게 구현할지 고민하였습니다.
커스텀 시리얼 큐를 3개 만드는 방법, 3개의 `global().async` 블록 내부에서 각각 while 반복문으로 `client`를 `dequeue`하는 방법 등등을 고민해 보았습니다.
결과적으로, 하나의 while문 내부에서 `dequeue`한 후, `global().async`로 작업을 보내되, 작업에 동시에 접근할 수 있는 thread 갯수를 `semaphore`로 제한하는 방법을 사용하여 구현했습니다.

<br>

### ☑️ 2. 여러 개의 세마포어로 업무별 담당 은행원 숫자를 관리하는 방법
다중 처리를 하되, 업무(예금, 대출)마다 담당하는 은행원을 고정하는 로직을 고민했습니다.
요구사항에서는 예금 업무를 담당하는 은행원 2명, 대출 업무를 담당하는 은행원 1명으로 제시되어 있는데요.
while문 내부에서 `client`를 `dequeue`한 후 조건문으로 `client.task`를 검사하여 각각 다른 블록으로 분기하되, 각 예금 블록에서는 value가 2인 semaphore, 대출 블록에서는 value가 1인 semaphore로 제어되도록 구현했습니다.
내부적으로는 thread가 `client` 수만큼 많이 만들어지겠지만, 실제로 동시에 일하는 thread는 예금 2, 대출 1명으로 총 3개가 되어, 현실 세계에서 은행원 3명이 담당업무를 처리하는 것처럼 동작합니다.


<br>

### ☑️ 3. 세마포어 숫자 하드코딩하지 않고 main.swift 에서 선언할 때 파라미터로 받을 수 있게 설계
`DispatchSemaphore`의 `value`를 통해 은행원 숫자를 제어하기에, 업무별 은행원 수를 타입 초기화 시 지정할 수 있게 되었습니다.
이를 통해 매직넘버 하드코딩을 피할 수도 있고, 추후 기능 수정에도 대응할 수 있게 되었습니다.

<br>

### ☑️ 4. delegate 으로 구조체가 아닌 클래스 타입을 사용
기존 `BankManager`가 `BankDelegate`를 채택하지만, `struct`로 구현되어 있었습니다.
현 코드 상태에서는 `class`이든 `struct`이든 상관없지만, 추후 `BankManager`에 저장 프로퍼티가 추가되고, 이를 변경하는 `mutating func`가 구현된다면 인스턴스를 추적할 수 없기 때문에 의도하지 않은 동작이 발생할 수 있습니다.
이에 대비하기 위해 `BankManager`를 `class`로, `BankDelegate`는 `AnyObject` 제약을 걸었습니다. 또한, `Bank.delegate`는 순환 참조를 막기 위해 `weak`로 선언했습니다.

📝 [관련 이슈 링크](https://github.com/Jager-yoo/ios-bank-manager/issues/2#issue-1089006729)

<br>

### ☑️ 5. NumberFormatter 변경
기존 업무 시간(`CFAbsoluteTime`)을 표시하기 위해 `String`으로 변환 및 소수점 2자리 미만을 버리는 로직에서 결함이 발견되었습니다.
의도는 `버림`이었지만, 사용한 `String(format:"%.2f")`은 `반올림`을 하기에, 로직을 수정했습니다.
`String(format:)` 대신 `NumberFormatter`를 사용하고, `roundingMode`를 `.floor`로, `fractionDigit`을 2로 제한하여 해결했습니다.

📝 [관련 이슈 링크](https://github.com/Jager-yoo/ios-bank-manager/issues/3#issue-1089059165)

<br>

## 🤔 궁금한 점

### ❓ 고객의 수 만큼 thread 를 만들고 semaphore 사용하는 구조가 괜찮을까요?

은행원이 담당하는 업무는 예금(deposit)과 대출(loan)이 존재합니다.
요구사항에 따라, 2명의 은행원은 예금 업무만, 1명은 대출 업무만 처리해야 하는데요.

💡 `한 개의 활성화된 thread == 한 명의 은행원`

일을 할 수 있는(활성화된) Thread 개수와 은행원의 숫자를 동기화하기 위해, 저희는 `2개의 semaphore` 를 생성했습니다.
서로 다른 thread 의 업무 종료 시점을 트래킹하기 위해 `DispatchGroup` 또한 사용했습니다.

```swift
// Bank 클래스
let depositSemaphore = DispatchSemaphore(value: numberOfDepositBankers)
let loanSemaphore = DispatchSemaphore(value: numberOfLoanBankers)
let group = DispatchGroup()
// numberOf~Bankers 는 Bank 클래스의 인스턴스 프로퍼티입니다.
```

그리고 아래 코드와 같이, `DispatchQueue.global().async`를 구현하고 내부에 `switch문`을 넣어 업무의 종류에 따라 각기 다른 `semaphore`에 제한이 걸리는 구조를 만들었습니다.

```swift
DispatchQueue.global().async(group: group) {
    switch client.task {
    case .deposit:
        depositSemaphore.wait()
        self.service(for: client)
        depositSemaphore.signal()
    case .loan:
        loanSemaphore.wait()
        self.service(for: client)
        loanSemaphore.signal()
    }
}
```

저희가 은행원 마다 하나의 thread 를 사용하는 컨셉으로 코드를 만들긴 했으나, 실제 thread 개수는 while문을 돌면서 `고객의 수 만큼 생성`됩니다.
그 이후에 주어진 semaphore 제한을 받으면서 업무를 처리하게 되는데요!

🙋🏻‍♂️ 이렇게 thread 를 고객의 수 만큼 만들어두고 semaphore 로 제한을 거는 구조는 비효율적인 것일까요?

차라리 Custom Serial Queue 를 은행원의 수 만큼 만들고 `단일 thread`에서만 업무를 하게 만드는 게 컨셉도 지키고 thread 생성 비용을 아낄 수 있는 방법일까요? 🤔

<br>

## 알게된 점

### 학습 키워드
- 동시성 프로그래밍 개념의 이해
- 동기(Synchronous)와 비동기(Asynchronous)의 이해
- 스레드(Thread) 개념에 대한 이해
- GCD를 활용한 동시성 프로그래밍 구현 (DispatchSemaphore, DispatchGroup)

<br>

# Step2 - 은행, 고객 타입 구현

## 📍 Class Diagram

![image](https://user-images.githubusercontent.com/71127966/147312742-3d865633-022a-4411-9728-ae07f9e48e54.png)

<br>

## 🏷 타입 개요
- `Bank` -> 가장 핵심이 되는 타입으로, 고객 대기열 `clientQueue`의 고객이 갖고있는 `task`를 처리하는 역할을 담당합니다.
- `BankManager` -> Console을 제어하며(사용자 입출력), `Bank` 객체의 시작을 관리합니다.
- `BankDelegate` -> `Bank`가 `BankManager`에게 보낼 메세지를 정의합니다.
- `Client` -> `Bank`의 `clientQueue`에 들어갈 고객 타입입니다. 대기번호(`waitingNumber`), 업무(`task`)를 상태값으로 가집니다.
- `Task` -> 고객의 은행업무를 정의한 타입입니다.
- `Queue` -> `Bank`의 `clientQueue`를 위해 구현한 큐 타입입니다.
- `LinkedList` -> `Queue` 타입을 위해 구현한 단일연결리스트 타입입니다.
- `Node` -> `LinkedList` 타입을 위해 구현한 Node 타입입니다.
- `ConsoleMessage` -> 콘솔에서 사용자에게 입출력될 string literal을 정의한 타입입니다.

<br>

## 고민한 점

### ☑️ 1. Delegation Pattern을 활용한 객체간 역할 분리
추후 이 프로젝트는 Console 앱 -> UI 앱 으로 전환될 예정입니다. 
MVC 패턴에 기반하여 객체의 역할을 분리해야 할 것을 생각하면, 현재 Console 기반 앱에서도 View와 관련된 기능인 `print` 메서드가 객체 여기저기서 쓰이면 안됩니다. 
View 관련 기능만 담당할 객체(현 `BankManager`, 추후 `ViewController`)에만 해당 역할이 할당되어야 한다고 생각했습니다. 
그래서 Console에 보여질 것을 관리하는 `BankManager`에서 모든 `print`를 수행하도록 설계하고 싶었습니다.

이를 위해, `Bank`와 `BankManager` 간에 `BankDelegate` 프로토콜을 통하여 Delegation Pattern을 구현해 보았습니다. 
`Bank`에서는 은행업무의 상태를 알릴 필요가 있을 때 `delegate`를 통해 `BankManager`에게 메시지를 보내고, `BankManager`는 프로토콜 요구사항으로 구현한 메서드 내부에서 `print`를 수행하도록 했습니다.

결과적으로, 추후 UI 앱으로 전환 시 `ViewController`에 `BankDelegate`를 채택하여 요구 메서드만 구현하면 쉽게 유지보수가 이루어질 수 있게 되었다고 생각합니다.

<br>

### ☑️ 2. Task 열거형의 결합도를 낮게 유지
저희는 고객의 업무를 정의하는 Task 열거형의 케이스가 다음 STEP에서 추가되는 상황을 예상했습니다.
지금은 업무 종류가 `예금(deposit)` 하나뿐이지만, 추후 업무의 종류(케이스)가 늘어나는 경우가 생기더라도, 열거형의 코드만 변경하면 되는 안정적인 코드를 만들고 싶었습니다.
(응집도는 높이고 결합도는 낮춘다.)

그래서 열거형에 `CaseIterable` 프로토콜을 채택시키고 고객의 업무를 랜덤하게 생성해주는 연산 프로퍼티를 미리 구현했습니다.

<p align="center"><img src="https://i.imgur.com/k3tkMmD.png" width="30%"></p>

<br>
 
## 🤔 궁금한 점

### ❓ 1. 저희가 적용한 Delegation Pattern 이 올바르게 적용된 것일까요?
🙋🏻‍♂️ 저희가 만든 코드를 `구조적인 측면`에서 어떻게 생각하시는지, 피드백을 받아보고 싶습니다! 🥺

<br>

### ❓ 2. NumberFormatter 인스턴스 생성 비용이 꽤 크다고 들어서, 다른 방식을 사용했는데 괜찮은 걸까요?
```swift
let numberFormatter = NumberFormatter()
```
위와 같이 NumberFormatter 인스턴스 생성하는 경우의 비용이 크다는 말을 들은 적이 있습니다. :sweat_smile: 
다른 리뷰어 분들 중에서도 그렇게 말씀해주시는 분이 있었고 관련 스택오버플로우 링크도 찾아봤습니다. (좀 오래된 자료이긴 합니다.)
- ["Why is allocating or initializing NSDateFormatter considered "expensive"?"](https://stackoverflow.com/questions/8832768/why-is-allocating-or-initializing-nsdateformatter-considered-expensive)

이번 프로젝트에서는 은행 업무에 소요된 시간을 `소수점 아래 2번째 자리까지만` 보여주면 되는 것이라서, 저희는 numberFormatter 를 사용하지 않고 Double 타입의 extension 으로 아래와 같은 연산 프로퍼티를 구현했는데요!

```swift
extension Double {
    var roundedOff: String {
        String(format: "%.2f", self)
    }
}
```

🙋🏻‍♂️ NumberFormatter 를 반드시 사용해야 하는 게 아니라면, 이런 식으로 대체할 수 있는 포맷터를 사용하는 방식이 괜찮은 걸까요?

<br>

## 알게된 점

### ✅ 1. CFAbsoluteTime 타입 == Double 타입
업무에 소요된 시간을 계산하기 위해, 시스템의 현재 시간을 반환해주는 `CFAbsoluteTimeGetCurrent()` 메서드를 사용했습니다.
이 메서드는 `CFAbsoluteTime` 타입을 반환하는데요, 저희는 소수점 아래 2번째 자리까지만 보여주는 연산 프로퍼티를 `Double` 타입의 extension 으로 구현해놨음에도 컴파일 에러가 나지 않았습니다.

그래서 `CFAbsoluteTime` 타입의 정의를 확인해보니, `typealias` 가 2번 걸려서, 결국 `Double` 타입이었다는 걸 알 수 있었습니다.

```swift
// CFAbsoluteTime
typealias CFAbsoluteTime = CFTimeInterval

// CFTimeInterval
typealias CFTimeInterval = Double
```

<br>

### ✅ 2. 특정 소수점 자리 이하로 '버리는' String 이니셜라이저
Double 타입의 숫자 self 에서 소수점 아래 2자리 미만을 버리고 싶을 때 `"%.2f"`를 전달인자로 넣어주면 결국 String 타입으로 반환시켜주는 이니셜라이저를 활용했습니다.

```swift
String(format: "%.2f", self)

// 예시
// 2.34567 -> 2.34
```
---

<br>

# STEP 1 - Queue 타입 구현

## 고민한 점

### ☑️ LinkedList 구현
1. **단일 연결리스트 / 이중 연결리스트**
이중 연결 리스트로 구현하면 `중간에 있는 요소` 탐색 시 시간복잡도의 이익이 있습니다.
하지만 요구사항의 Queue 타입에서 필요로 하는 기능들은 `중간 요소`를 탐색할 필요가 없기에 단일 연결리스트로 구현했습니다.

2. **subscript 구현 여부**
1번과 같은 이유로, 인덱스를 통해 `가운데 요소`에 접근할 필요가 없기에 구현하지 않았습니다.

3. **Node 타입 정의**
Node는 LinkedList 내부에서만 사용되는 타입이기에 `private Nested Type`으로 구현했습니다.
`next` 프로퍼티를 통하여 참조되어야 하기에 `class`로 구현했습니다.

4. **class / struct**
단일 연결 리스트는 `head`와 `tail`이라는 Node를 저장 프로퍼티로 가집니다.
저장값이 많지 않은 가벼운 타입이기에 값 복사가 일어나도 성능상 문제가 없다고 생각했으며, 굳이 참조 타입으로 구현할 이유가 없기에 `struct`로 구현하였습니다.

5. **tail**
`tail`을 구현하면 마지막에 `append`한 요소에 쉽게 접근할 수 있는 이점이 있어서 `head` 이외에 `tail`도 구현했습니다.
또한, `tail`을 연산프로퍼티로 구현하면 접근할 때마다 O(n)의 연산을 해 주어야 하는데, 저장 프로퍼티로 구현하여 리스트에 요소가 추가될 때마다 `tail`을 갱신해주면 `tail`에 접근 할 때 성능적 이점이 있다고 판단하여 저장 프로퍼티로 구현했습니다.

### ☑️ Queue 구현
1. 구현한 LinkedList를 활용하여 요구사항대로 `enqueue`, `dequeue`, `clear`, `peek`, `isEmpty` 기능을 구현했습니다.
요구사항 외적인 기능은 구현하지 않는 것으로 결정했습니다.

### ☑️ UnitTest 작성
1. **유닛 테스트의 대상**
유닛 테스트의 대상은 외부에서 접근할 수 있는 요소에 대해서만 실행하는 것이 적절하다고 생각하여, Node, LinkedList에 대한 테스트는 작성하지 않고, 외부에서 사용할 Queue 타입에 대해서만 테스트를 작성, 수행했습니다.
2. **Mock 인스턴스 활용**
접근제어로 인해 Queue의 `list`에 접근하지 못합니다.
그렇기에 접근제어 설정을 하지 않은 MockQueue를 만들어 테스트에 활용했습니다.

<br>

## 🤔 궁금한 점

### ❓ CFGetRetainCount 메서드를 통해 디버깅 시 reference count가 추가로 하나 더 표시되는 이유가 뭘까요?

![](https://i.imgur.com/P6wGS8h.png)

- list 변수에 enqueue 메서드로 3개의 원소(1, 2, 3)를 append 해준 상태에서
- list 를 비우는 removeAll() 메서드가 잘 작동하는지 검증하기 위해 `RetainCount`를 직접 확인해보고 싶었습니다.
- head, tail 변수에 `nil`을 할당하기 전에 breakpoint를 걸고 tail 의 `RetainCount` 재보면 `3개`가 나왔습니다.
- 저희가 예상한 건 `2개`개 였는데요, 왜냐면 앞의 `Node().next`가 하나를 올려주고, 변수 tail 이 하나를 올려준다고 생각했어요.
- 그러면 왜 `3개`가 나올까요? 나머지 1개는 어디서 나온 건지 궁금했습니다.

🙋🏻‍♂️ 저희 가설은 `CFGetRetainCount` 메서드에서 tail을 전달하기 때문에 하나가 더 늘어난다는 것인데요, 저희가 생각한 이유가 맞는지 궁금합니다!

---

## 알게 된 내용

### ✅ 1. 모든 프로퍼티가 private 접근제어인 구조체의 초기화
구조체로 구현한 `LinkedList` 타입은 `private` 접근제어와 `옵셔널`이 부여된 2개의 인스턴스 프로퍼티 head, tail 을 가집니다.

```swift
private var head: Node<Element>?
private var tail: Node<Element>?
```

이때, 외부에서 `LinkedList` 타입의 초기화를 시도하는 경우, 멤버와이즈 이니셜라이저에서 파라미터가 보이지 않습니다. (`private` 접근제어로 인해 외부에서 프로퍼티 접근 불가)

```swift
private var list: LinkedList<Element> = LinkedList()
```

따라서 위와 같이 `list` 변수를 선언하면, head 와 tail 모두 자동으로 `nil`이 할당된 채로 초기화됩니다.

<br>

### ✅ 2. 유닛 테스트에서 sut 변수와 setUp, tearDown 메서드 활용

- `sut` = System Under Test

```swift
var sut: MockQueue<String>!

override func setUpWithError() throws {
    try super.setUpWithError()
    sut = MockQueue()
}

override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut = nil
}
```

MockQueue 타입을 갖는 `sut` 변수를 `!(암시적 추출 옵셔널)`을 붙여 선언합니다.

`setUpWithError` 메서드는 각각의 테스트 메서드가 실행되기 전에 `sut` 변수에 MockQueue 타입을 초기화해서 할당합니다.

`tearDownWithError` 메서드는 각각의 테스트 메서드가 실행된 이후 `sut` 변수에 `nil`을 할당하여 다음 테스트를 동일한 조건에서 실행할 수 있도록 만듭니다.

<br>

### ✅ 3. TestDouble
> 테스트 더블이란 테스트를 진행하기 어려운 경우 이를 대신하여 테스트를 진행할 수 있도록 만들어주는 객체입니다. 테스트 더블에는 Dummy, Stub, Fake, Spy, Mock 등이 있습니다. 각각 역할이 다르지만, 명확하게 구분되지 않는 경우가 많습니다. 그렇기에 다른 테스트 더블을 아울러 Mock으로 통칭하기도 합니다. 
> 
> 출처: [Test Double - 야곰닷넷, by. 오동나무](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/lessons/%ed%85%8c%ec%8a%a4%ed%8a%b8%eb%a5%bc-%ec%9c%84%ed%95%9c-%ea%b0%9d%ec%b2%b4-%eb%a7%8c%eb%93%a4%ea%b8%b0/topic/test-double/)

저희 `MockQueue`의 경우에는 사실상 Stub에 가까운 역할인 것 같지만, 역시 명확히 들어맞는지는 모르겠기에 Mock으로 이름 지었습니다.

<br>

### ✅ 4. CFGetRetainCount

LLDB에서 `po CFGetRetainCount(객체)` 명령어로 클래스 인스턴스의 `RetainCount(참조 횟수)`를 확인할 수 있습니다.

<p align="center"><img src="https://i.imgur.com/CWdXNeO.png)" width="40%"></p>

<br>

### ✅ 5. breakpoint 작동 시점

특정 코드 라인에 breakpoint 를 걸어놨다면, 그 라인의 코드가 작동하기 `전에` breakpoint 가 작동합니다.
