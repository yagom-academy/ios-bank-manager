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
|<img src="https://i.imgur.com/Z4b9rrA.jpg" width=200>|<img src="https://avatars.githubusercontent.com/u/59466342?v=4" width=200>|

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
 
- **2022-07-05(화)**

- **2022-07-06(수)**

- **2022-07-07(목)**

- **2022-07-08(금)**

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

## 🚥 UML

### Step_01
![](https://i.imgur.com/jE0c2ym.jpg)

<br>

### Step_02
![](https://i.imgur.com/Mcczhb5.jpg)

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
