# 은행 창구 매니저

<div align="center">
    <img src="https://img.shields.io/badge/swift-5.7-F05138.svg?style=flat&logo=Swift">
    <img src="https://img.shields.io/badge/14.0-000000.svg?style=flat&logo=iOS">
    <img src="https://img.shields.io/badge/Xcode-13.4.1-white.svg?style=flat&logo=XCode">
    <img src="https://img.shields.io/badge/UIKit-white.svg?style=flat&logo=UIKit">
</div>

<br>


## 🫂 팀 소개

|[민쏜](https://github.com/minsson)|[Derrickkim](https://github.com/derrickkim0109)|
|:--------:|:--------:|
|<img src="https://i.imgur.com/ZICS3vT.jpg" width=200 height = 200>|<img src="https://avatars.githubusercontent.com/u/59466342?v=4" width=200>|


<br>

## 타임라인

### Week 1 (2022.06.27 ~ 2022.07.03)

- **2022-06-27(월)**
    - 프로젝트 요구명세서 파악
    - Step 1 고객 대기열을 표현하는 ClientQueue 구현
        - "Node" LinkedList 구현을 위한 커스텀 타입 정의
        - "LinkedList" ClientQueue 구현을 위한 커스텀 타입 정의
        - "ClientQueue" 은행 고객 대기열을 표현하기 위한 커스텀 타입 정의
        - ClientQueue가 채택할 Queue 프로토콜 정의

- **2022-06-28(화) - STEP_01 PR 전송 완료**
    - "BankManagerTests" ClientQueue의 메서드 기능 테스트

- **2022-06-29(수)**
    - Step 1 UML 작성
    - 동시성 프로그래밍 개념 학습 및 토론

- **2022-06-30(목) - STEP_01 Merge 완료**
    - Step 2 UML 작성
    - Step 2 요구명세서를 바탕으로한 타입 추상화 개별수행 및 토론
    - Step 2 추상화 방식 선정 및 코드 작성
    - Step 2 리팩토링

- **2022-07-01(금)**
    - Step 1 리뷰어 피드백 반영 리팩토링 완료
    - Step 2 구현 완료
        - "Queue" dequeue 반환 타입 변경 및 관련 파일 폴더 구조 정리
        - “BankAppManager” 콘솔앱 실행을 위한 타입 구현
        - "BankManager" 은행 창구 스레드 역할을 담당하는 타입 구현
        - "Bank" 타입 정의 및 Client를 생성하는 메서드 구현
        - "Bank" 은행 창구 스레드에 Client 객체 데이터를 전달하는 메서드 구현
        - "Bank" 은행 업무 마감 결과를 프린트하는 메서드 구현
    - Step 2 UML 작성 완료

- **2022-07-02(토)**
    - 휴식 및 개인 공부
    
- **2022-07-03(일)**
    - Step 2 관련 내용 README에 추가
    - Step 2 PR 전송
    
### Week 2 (2022.07.04 ~ 2022.07.08)

- **2022-07-04(월)**
    - 휴식 및 개인 공부
    
- **2022-07-05(화)**
    - 동시성 프로그래밍 학습 (GCD 기본)
    
- **2022-07-06(수)**
    - 동시성 프로그래밍 학습 (Semaphore 등 GCD 심화)
    - 학습 내용 토론
    
- **2022-07-07(목)**
    - Step 3 구현
        - 은행원 2명이 비동기적으로 업무 처리하도록 수정
        - 은행 총 업무시간이 잘못 계산되는 문제 수정
        - 대출 업무 처리 기능 추가
        - 코드 중복 제거 및 메서드 기능 분리를 통한 가독성 개선
        - "BankManager" 의 업무 처리 함수 내에 업무 처리 시간 적용
        - "ClientGenerator" 고객 대기열을 생성하는 역할의 타입 구현
        
- **2022-07-08(금)**
    - Step 3 구현 완료
        - "Bank" 타입 기능 및 역할 일부를 다른 타입으로 분리
        - 불필요한 개행 및 프레임워크 제거, 메서드 배치 순서 변경
        - "BankManager" 메서드 이름 변경
        
- **2022-07-09(토)**
    - Step 2 PR 전송
    
- **2022-07-10(일)**
    - Step 3 관련 내용 README에 추가
<br> 

## 🔎 고민한 점 

## 🥾 STEP 1
### 1. LinkedList에서 Node를 제거하는 메서드 구현

#### 처음에 작성해 본 코드
```swift
 func removeFirstNode() -> Node<Element>? {
        if !isEmpty() {
            let removedNode = head ?? nil
            head = head?.nextNode
            return removedNode ?? nil
        }
        
        return nil
}
```
- 불필요한 `nil-Coalescing`를 반복사용하였고 `nil` 반환을 3번 하고 있습니다.
- 불필요한 `isEmpty()`를 사용하고 있습니다. 사실 `head`가 없으면 비어 있으므로 굳이 쓸 필요 없다고 생각했습니다.
- `head`가 옵셔널이므로 `removedNode`로 `unwrapping`했지만, 정작 바로 아래에서는 그 값을 쓰지 않고 `head?.nextNode`라고 `optional chaining`을 사용했습니다.

#### 참조타입 검증

처음에 `head = removedNode.nextNode`가 아니라 `head = head?.nextNode`라고 작성했던 이유는 `removedNode`와 `head`가 같은 메모리 주소를 참조하는지 확신할 수 없었기 때문입니다.
따라서 아래와 같은 메서드를 통해서 두 개의 인스턴스가 참조하는 주소값이 같은지를 확인하였습니다.

```swift
print("heap 영역 1 : ", Unmanaged.passUnretained(head).toOpaque())
print("heap 영역 2 : ", Unmanaged.passUnretained(removedNode).toOpaque())
```

#### 리팩토링한 코드
```swift
    func removeFirst() -> Node<Element>? {
        guard let removedNode = head else {
            return nil
        }
        
        head = removedNode.nextNode
        
        return removedNode
    }
```

### 2. 커밋메시지 작성 양식
`feat: "타입이름" 구현한 내용`과 같은 양식으로 작성해보았습니다.
- feat, refactor 등 어떤 성격의 작업을, 어떤 타입과 관련해, 어떤 내용을 구현했는지 표기하고자 했습니다.
- 처음에는 `feat: [타입이름] 구현한 내용`과 같이 `대괄호`를 사용했지만, 마크다운 에디터 등 여러 환경에서 대괄호가 특정 기능을 수행하는 경우가 많아 보여 `쌍따옴표`로 변경했습니다.


### 3. 양방향 리스트가 필요할지 단방향 리스트가 필요할지 고민해보았습니다.
- 고객 대기열에서 먼저 온 고객이 먼저 처리되기 때문에(FIFO), 현재로서는 Queue의 tail부터 요소에 접근할 일이 없다고 가정했습니다.
- 따라서 단방향 리스트를 사용해보았습니다.

### 4. `LinkedList` 의 Node 데이터를 제거하기 위해 어떻게 해야할지 고민하였습니다.
1) head와 tail 모두 nil을 할당하여야 연결리스트가 제거되는지
2) head에만 nil을 할당하면 연결리스트가 제거되는지 
- 단방향 연결리스트는 head Node에서 시작하여 다음 Node의 주소값을 알게 되는 구조 
- head 자체가 없다면 연결리스트 자체가 없는 것

```swift
    func removeAll() {
        head = nil
    }
```

> 단방향 리스트는 각 노드가 `data` 속성과 `nextNode` 속성을 갖고 있다
> `class` 로 선언하므로, 참조타입이며, 참조 타입의 인스턴스는 힙 영역에 생성된다
    <br> 힙 영역의 인스턴스들은 그 인스턴스를 참조하는 다른 객체가 없다면, 즉, 총 해당 인스턴스의 참조가 0이라면 사라진다<br>
         따라서, `head = nil`을 쓰면 `head.nextNode`에 들어있던 두 번째 노드를 가리키는 객체가 없어지므로, 두 번째 노드는 사라지게 된다(메모리에서 해제된다고 말한다). 두 번째 노드가 사라지므로 세 번째 노드를 가리키는 객체가 없고, 그래서 세 번째 노드도 사라진다. 이게 연쇄적으로 작용하여 결국 모든 노드는 사라진다.

## 🥾 STEP 2


### 1. Client 객체의 생성 및 Bank 타입으로의 데이터 전달 방법
현실 세계 관점의 추상화와 컴퓨터 세계 관점의 추상화 측면에서 고민했습니다.

요구사항의 `은행에는 n명의 고객이 업무처리를 위해 대기합니다`와 관련, Bank 객체 내부에 Client 객체를 담기 위한 clientQueue 속성을 정의했습니다.
이때, Client 객체를 생성해 clientQueue에 할당하는 방법과 관련하여 아래와 같이 고민했습니다.

#### 처음 생각했던 것 (현실 세계 관점의 추상화)
##### 구조 측면
- 현실 세계에서 고객은 은행 외부로부터 입장하므로, 은행이 자신의 내부에 고객을 생성하는 것은 자연스럽지 않다고 생각했습니다.
- 따라서, `ClientManager`라는 별도의 객체를 두고, 요구사항에 맞는 ClientQueue를 생성해 Bank의 clientQueue 속성에 데이터를 전달했습니다.

##### 네이밍 측면
- Bank 객체 내에 `meet(_: Client)`라는 네이밍의 메서드가 있었습니다.
- Bank 내부의 clientQueue 속성에 외부로부터 파라미터로 전달 받은 Client 객체를 enqueue하는 메서드였습니다.
- 코드 내에서 사용시 `bank.meet(client)`와 같은 형태가 되어 무척 자연스러운 네이밍이라고 생각했습니다.

#### 고민 후 결정한 것 (컴퓨터 세계 관점의 추상화)
Bank 객체 내부에 아래와 같은 메서드를 정의했습니다.
```swift
mutating func generateClients() {
    let clientAmount = Int.random(in: 10...30)
    let task: Request = .task
        
    for amount in 1...clientAmount {
        clientQueue.enqueue(Client(request: task, waitingNumber: amount))
    }
}
```
##### 구조 측면
- 컴퓨터 세계 관점에서 추상화한다면, Client는 Bank 객체 내부에서만 사용될 객체이므로, Bank 객체 내부에서 생성되는 것이 효율적이라고 생각했습니다.

##### 네이밍 측면
- `meet(_: Client)`라는 현실 세계의 관점에서 고객이 입장하는 것을 표현한 것이지만, 네이밍만으로는 어떤 기능을 하는 메서드인지 추론하기 어려웠습니다.
- Bank 객체 내부에서 Client 객체를 생성하는 것이므로 `generateClients()`라고 네이밍했습니다. 메서드의 기능이 더 명료해졌다는 생각이 들었습니다.

### 2. Bank 객체에서 Client 객체를 생성하고 접근할 때의 은닉화

아래 코드는 Client 객체 정의부입니다.
```swift
struct Client {
    private(set) var waitingNumber: Int // 고객의 대기 번호를 표현
    private(set) var request: Request // 고객이 은행에서 처리하고자 하는 업무
    
    init(request: Request, waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.request = request
    }
}
```
위 코드를 작성하며, `waitingNumber`를 리턴하는 메서드를 정의하는 방안에 대해 고민했습니다.
하지만 아래와 같은 이유로 `private(set)`을 사용하기로 결정했습니다.
- 저장속성의 데이터를 `읽기` 수준에서 접근하는 것과 동일한 리턴값을 가진다는 측면에서 `private(set)`과 은닉화 수준도 동일하다고 생각했습니다.
- 속성에 `private` 접근제어자를 사용하기 위해 불필요한 메서드를 정의하는 것이 합리적이지 않다고 생각했습니다.
- `캡슐화` 측면에서도 단순히 저장속성을 리턴해주는 메서드를 `캡슐화`라고 표현하기 어렵다고 생각했습니다.

### 3. `BankManager` 타입의 업무 시작/완료를 표현하기 위한 메서드
- 아래의 두 메서드는 동일한 결과를 도출합니다.
- 하지만 업무를 진행한 후 종료 하기 위해 DispatchQueue의 메서드를 사용하였습니다.

#### 1) Thread.sleep(forTimeInterval:) 활용
주어진 업무처리 시간만큼 메인 Thread를 정지시킵니다.
```swift
startTask(for: client)

Thread.sleep(forTimeInterval: .now() + processingTime)

finishTask(for: client)
```
#### 2) DispatchQueue.global().asyncAfter(deadline:) 활용

DispatchQueue의 asyncAfter메서드로 deadline을 설정하여 해당 시간이 지난 후 업무 종료를 알립니다.
    
```swift
taskGroup.enter()  
startTask(for: client)
DispatchQueue.global().asyncAfter(deadline: .now() + processingTime) {
    finishTask(for: client)
    taskGroup.leave() 
}
taskGroup.wait()
```

## 🥾 Step 3

## 1. 처음 작성한 코드

### 1) Thread와 Semaphore의 개념 혼동
`clientQueue`에서 `Client` 인스턴스를 `dequeue`한 후, 해당 인스턴스의 `request` 속성에 따라 분기처리하여 각자 `depositSemaphore`와 `loanSemaphore`로 묶어주고 있습니다.

빌드 자체에는 문제가 없었고, 잘 실행되는 것으로 보였으나, 아래에서 서술할 내용과 같이 논리적인 오류가 있었습니다. `Thread`와 `Semaphore`의 개념을 혼동하여 발생한 문제라고 생각합니다.

#### depositSemaphore의 value를 2로 설정
- `deposit` 업무는 2개의 스레드에서 처리해야하므로, value 또한 2가 되어야 한다고 생각했습니다. `value가 2여야 2개의 스레드(2명의 은행원)가 동시에 작업할 수 있다`고 생각했기 때문입니다.
- 같은 논리에서 `loanSemaphore`의 value는 1로 설정했습니다. 한 명의 은행원만 작업해야 하기 때문입니다.

```swift
struct Bank {
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)

    mutating func assignTask(to bankManager: BankManager) {
        guard let client = clientQueue.dequeue() else {
            return
        }

        let requestedTask = client.request

        switch requestedTask {
        case .deposit:
            self.taskGroup.enter()
            DispatchQueue.global().async { [self] in
                depositSemaphore?.wait()
                bankManager.processRequest(from: client)
                depositSemaphore?.signal()
                taskGroup.leave()
            }
        case .loan:
            self.taskGroup.enter()
            DispatchQueue.global().async { [self] in
                loanSemaphore?.wait()
                bankManager.processRequest(from: client)
                loanSemaphore?.signal()
                taskGroup.leave()
            }
        }

        totalVisitedClients += 1
    }
}

struct BankManager {
    private let taskGroup = DispatchGroup()
    
    func processRequest(from client: Client) {
        let processingTime = client.request.processingTime
        
        taskGroup.enter()
        startTask(for: client)
        DispatchQueue.global().asyncAfter(deadline: .now() + processingTime) {
            finishTask(for: client)
            taskGroup.leave()
        }
        
        taskGroup.wait()
    }
}
```

### 2) 고민했던 점:
- `depositSemaphore`의 value를 2로 설정하면 `Race Condition`의 리스크가 발생하지 않을지 의문이 남아있는 상태였습니다. 

- 실제로 코드를 작성한 후 콘솔 앱 실행 결과를 살펴본 결과, `업무처리소요시간`이 실제 시간보다 1-3초 가량 추가되어 계산되는 경우를 볼 수 있었습니다. 예금 업무 처리 관련 스레드에서 `Race Condition`이 일어나 일부 객체가 중복 처리 된 것으로 예상되었습니다.

    > `CFAbsoluteTimeGetCurrent()`: 시스템의 현재 시간을 반환해주는 메서드
    - 업무가 시작/종료될 때의 시간을 카운트하여 총 업무시간을 계산하였습니다.
    - 하단의 `처음 작성한 코드`에서는 depositSemaphore / loanSemaphore로 은행원의 업무를 구분했었습니다.
    - 해당 코드에서 CFAbsoulteTime을 사용하여 업무처리시간을 확인한 결과, 실제 소요시간 대비 오차가 발생했습니다.
    - 소요시간이 정확하지 않다는 점에서, Semaphore로 은행원을 구분하는 것은 틀린 접근 방법이라는 생각도 들었습니다.
    
    **처음 작성한 코드 일부:**
```swift 
mutating func open(_ client: [Client]) {
    cameInBank(by: client)
    let startTime = CFAbsoluteTimeGetCurrent()
        
    depositSemaphore = DispatchSemaphore(value: depositManagerHeadCount)
    loanSemaphore = DispatchSemaphore(value: loanManagerHeadCount)
    while !clientQueue.isEmpty() {
        assignTask(to: manager)
    }
        
    let closeTime = CFAbsoluteTimeGetCurrent()
        
    taskGroup.wait()
        
    totalProcessingTime = closeTime - startTime
        
    reportSummary()
    }
```

- `BankManager`의 `processRequest` 에서 `        DispatchQueue.global().asyncAfter(deadline: .now() + processingTime)`가 `Client` 객체만큼의 스레드를 생성하고, 지우는 작업을 반복하는 것일 수도 있으며, 이 때 반복문에 의해 생성된 여러 개의 스레드가 세마포어의 벨류 2로 인해 대기 중일 수 있다는 생각이 들었습니다.


## 2. Race Condition을 방지한 코드
커밋번호: f880c7914768aee17cde6f1b85e342fcc199521b

### 1) Semaphore의 value
- Race Condition을 방지하기 위해 `Semaphore`의 `value`를 1로 설정하는 방법을 택했습니다.

### 2) 업무처리시간의 적용
- 요구사항의 각 업무별 처리 시간을 적용하기 위해 
`Thread.sleep(forTimeInterval: client.request.processingTime)` 코드를 구현했으나, 해당 코드를 `Semaphore.signal()` 아래에 배치했습니다.
- `Semaphore.signal()` 위에 배치하는 경우: `Semaphore`의 value가 1이므로, 하나의 스레드만 queue에 접근하여 동작할 수 있으며, 업무처리시간 동안 queue를 점유하고 다른 스레드의 접근을 막습니다. 따라서, 예금은행원1이 업무를 처리하는 동안 예금은행원2는 휴식하며, 업무를 번갈아가며 처리하게 됩니다.
- `Semaphore.signal()` 아래에 배치하는 경우: 각 스레드는 `dequeue`하는 순간만 `clientQueue`를 점유하고, 업무처리시간 동안은 clientQueue를 점유하지 않습니다. 따라서, 두 예금은행원는 거의 동시에 일을 처리할 수 있게 됩니다.

### 3) clientQueue의 분리
- `clientQueue` 내에 각기 다른 request를 가진 `Client`가 있던 기존 코드와 달리, `clientQueue`를 생성하는 메서드에서 객체를 생성한 후, request 내용에 따라 `depositClientQueue`와 `loanClientQueue`로 구분되어 `enqueue` 되도록 분기처리 했습니다.
    - Client 객체의 request 속성이 랜덤 결정되며, 업무별로 이를 처리하는 스레드의 개수가 다르므로 Semaphore의 value도 구분해야 한다고 생각했기 때문입니다.
    - 실제 현실의 은행에서도 입장시 키오스크에서 처리하고자 하는 업무를 선택하고, 업무 카테고리 별로 대기열이 달라지기 때문입니다.

### 4) BankManager 객체에 업무 할당
커밋번호: 8f52d4894a52df1506bb5b213da22c8751e4f212

- 각 `BankManager` 객체는 자신이 책임지는 업무의 고객 대기열에서 `Client` 객체를 `dequeue`하고, 주어진 업무처리시간 동안 업무를 처리하는 역할을 합니다.
- `Bank` 타입 내부에는 요구사항의 예금은행원 2명 대출은행원 1명이라는 요구사항만큼 `BankManager 배열` 내부에 `BankManager` 객체를 생성했습니다.
- 각각의 `BankManager` 객체가 예금 업무 대기열과 대출 업무 대기열 중 어떤 것을 담당할지 분기 처리하기 위해 `let task: Request`라는 저장 속성을 생성했습니다.
- `arrangeAllManagers(_:)` 메서드를 통해 어레이 내부의 각 `BankManager` 객체를 각각의 비동기 글로벌 큐에 할당했습니다. 즉, 결과적인 관점에서 각 `BankManager` 객체는 비동기적으로 업무를 처리할 하나의 스레드 역할을 합니다.

### 5) 고민했던 점: Bank와 BankManager 간 기능 분리에 대한 고민

#### 5-1) Bank의 역할 과다
- `Bank` 타입에서 거의 모든 일을 처리하고, `BankManager` 타입은 `Bank`에서 인스턴스화 되어 사용될 메서드 몇 개만 제공하고 있었습니다.
- `Bank` 타입의 `assignTask(to:from:)` 메서드가 비대해져, 너무 많은 역할을 하고 있었습니다.
    - `clientQueue`에서 `Client` 인스턴스를 `dequeue`하고, `BankManager` 인스턴스의 메서드를 활용하고 있습니다.
    - 몇 번 고객의 업무 처리를 시작하는지 print
    - 몇 번 고객의 업무 처리가 완료되었는지 print
    - 해당 고객의 업무 종류에 따라 업무시간만큼 Thread를 sleep 시킴 

#### 5-2) BankManager로의 업무 이관
- 위에서 서술한 `Bank` 타입의 `assignTask(to:from:)` 메서드를 `BankManager` 객체의 책임으로 분리할 필요가 있다는 생각이 들었습니다. 아래와 같이 생각했기 때문입니다.
    - task를 initializer로 받았지만 `BankManager` 인스턴스 안에서는 사용되지
    - `BankManager` 타입의 저장 속성에 task가 있고, 인스턴스 초기화 시에 값을 할당하지만, 정작 `BankManager` 타입 내부에서는 사용되지 않았습니다. `Bank` 타입 내부에서 사용하기 위해 이러한 속성을 할당하는 것이 부자연스럽게 느껴졌습니다.

- 각 타입의 역할이 구체화되고, 각 메서드의 역할이 명료해질 것이라는 생각도 들었습니다.


## 3. 제출 코드
커밋 번호: ae438ec529da39311712794d3b247c45e8700761

### 1) ClientQueue의 데이터 전달 과정
> `ClientGenerator` -> `Bank` -> `BankManager`

- `ClientGenerator`에서 `depositClientQueue`와 `loanClientQueue`를 생성하여 `(ClientQueue<Client>, ClientQueue<Client>)` 튜플 형태의 데이터를 `Bank` 객체에 전달합니다.
- `Bank` 객체는 `ClientGenerator`로부터 전달받은 튜플 데이터를 `fetchClients(_:)` 메서드를 이용해 `Bank`의 저장속성인 `depositClientQueue`와 `loanClientQueue`에 할당합니다.
- `Bank`는 `arrange(bankManagers:to:)` 메서드를 통해 예금 은행원과 대출 은행원의 수만큼 비동기 글로벌 큐를 생성하고, 내부에서 `self.bankManager.processTask(from: queue)` 메서드를 호출합니다.
    - 결과적으로 각 은행원의 수만큼 스레드를 생성하고, 비동기식으로 업무를 처리하게 하는 역할을 합니다.

### 2) ClientGenerator 타입 구현
- `Bank` 객체에 전달할 `ClientQueue<Queue>`를 생성하는 역할을 담당합니다.
- 두번째 코드(8f52d4894a52df1506bb5b213da22c8751e4f212)에서는 `Bank` 타입 내부에 동일한 기능을 하는 메서드가 있었으나, 타입의 기능 분리를 위해 별도의 타입으로 분리했습니다.


## 🚥 UML

### Step_01
![](https://i.imgur.com/jE0c2ym.jpg)

<br>

### Step_02
![](https://i.imgur.com/Mcczhb5.jpg)
<br>

### Step_03
![](https://i.imgur.com/aoalxzb.jpg)
<br>


## 🗂 폴더 구조

```swift 
BankManagerConsoleApp
├── Extension
│   └── Double+Extensions
├── Model
   ├── AppManager
   │        ├── BankAppManager
   │        └── BankSystem
   ├── Bank
   │    ├── Queue
   │    │    ├── Node
   │    │    ├── LinkedList
   │    │    ├── ClientQueue
   │    │    └── Queue
   │    ├── Bank
   │    └── BankManager
   └── Client
         ├── ClientQueueGenerator
         ├── Client
         └── Request
```

<br>

## 🔫 트러블 슈팅

### 1. Command line tool 내 Unit Test 에러

- Unit Test 도중 모듈이 import 되지 않는 에러가 있었습니다.
- 코드상으로는 `@testable import 모듈` 부분이었습니다.
- 이에 따라 아래 절차와 같이 해결했습니다.
`1) Unit test scheme 추가`
`2) 각 파일별로 target member 체크`

## 🖇 참고 링크
[Commandline-tool_UnitTest](https://woongsios.tistory.com/162)

----

# 프로젝트 수행 중 핵심 경험
 
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 동기(Synchronous)와 비동기(Asynchronous)의 이해
- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x]  스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용
- [ ] 동시성 프로그래밍 중 UI 요소 업데이트의 주의점 이해
- [ ] 커스텀 뷰 구현
- [ ] 스택뷰 활용
- [ ] Xcode 프로젝트 관리 구조의 이해와 응용
