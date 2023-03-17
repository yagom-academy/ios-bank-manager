# 은행창구 매니저💰

## 프로젝트 소개
> 은행을 방문한 고객들의 업무를 여러명의 은행원이 동시에 처리하도록 구현한 앱 
>
> 프로젝트 기간: 2023.03.06 - 2023.03.17

## 목차 :book:


- [1. 팀원을 소개합니다 👀](#팀원을-소개합니다-) 
- [2. 시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
    - [2-1. Class Diagram 🗺](#class-diagram-) 
    - [2-2. File Tree 🌲](#file-tree-) 
- [3. 타임라인 ⏰](#타임라인-) 
- [4. 실행 화면 🎬](#실행-화면-) 
- [5. 트러블슈팅 🚀](#트러블-슈팅-) 
- [6. 핵심 경험 ✏️](#핵심-경험-)
- [7. 팀 회고](#팀-회고)
- [7. Reference 📑](#reference-) 

</br>

## 팀원을 소개합니다 👀

|<center>[Rowan](https://github.com/Kyeongjun2)</center> | <center> [릴라](https://github.com/juun97)</center> | 
|--- | --- |
|<Img src = "https://i.imgur.com/S1hlffJ.jpg" width="300">| <img src="https://i.imgur.com/9M6jEo2.png" width=300>  |

</br>

## 시각화된 프로젝트 구조 
### Class Diagram 🗺
#### Consle App
<img src="https://i.imgur.com/aUAvv3A.png" width = 600>

#### UI App
<img src="https://i.imgur.com/Gzft1GI.png" width = 800>

</br>

### File Tree 🌲
#### Consle App
```typescript
BankManagerConsoleApp
├── BankManagerConsoleApp
│   ├── main.swift
│   ├── Model
│   │   ├── Bank.swift
│   │   ├── BankDepartment.swift
│   │   ├── BankManager.swift
│   │   ├── Business.swift
│   │   ├── Customer.swift
│   │   ├── CustomerReceiver.swift
│   │   └── DataStructure
│   │       ├── CustomerQueue.swift
│   │       └── LinkedList.swift
│   └── ProcessTimer.swift
└── UnitTest
    ├── BankManagerTest
    │   ├── BankManagerTest.swift
    │   ├── StubCustomerReceiver.swift
    │   └── MockBank.swift
    ├── CustomerQueueTest
    │   ├── CustomerQueueTest.swift
    │   └── MockQueue.swift
    └── BankTest
        ├── BankTest.swift
        ├── MockQueue.swift
        └── MockDepartment.swift
```
</br>

#### UI App
```typescript
BankManagerUIApp
├── App
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Controller
│   │   └── BankManagerViewController.swift
├── Model
│   ├── Bank.swift
│   ├── BankDepartment.swift
│   ├── Business.swift
│   ├── Customer.swift
│   ├── DataStructure
│   │   ├── CustomerQueue.swift
│   │   └── LinkedList.swift
│   └── Notification.swift
└── View
│   ├── CustomStackView.swift
│   └── CustomerLabel.swift
└── Extension
    └── extension+UIView.swift
```

</br>

## 타임라인 ⏰

| <center>STEP | <center>날짜 | <center>타임라인 |
| --- | --- | --- |
|**STEP1**| **2023.03.06** | - Node, LinkedList 구현 </br>- LinkedList를 이용한 Queue 구현  |
|**STEP2**| **2023.03.07** | - 필요한 Model 타입 추상화 ( Bank, Banker, BankManager, Customer, Business ) </br> - 추상화된 Model 타입 세부구현 |
|**STEP2**| **2023.03.08** | - 기능 분리 리팩토링 진행 </br> - 기존 로직 최적화 리팩토링 진행 |
|**STEP3**| **2023.03.09** |  - Concurrent Programming 로직 도입 </br> - 의존성 외부주입 로직으로 리팩토링 |
|**STEP3**| **2023.03.10** |  - 전체적임 프로그램 구조 재편성 </br> - 재편성된 구조에 맞게 리팩토링 진행 |
|**STEP3**| **2023.03.13** |  - 피드백 사항 수정작업 |
|**STEP3**| **2023.03.14** |  - UnitTest 진행 </br> - Unit Test에 필요한 Mock 타입 생성 |
|**STEP3**| **2023.03.15** |  - UnitTest 진행  |
|**STEP4**| **2023.03.15** |  - 필요한 기본 UI 틀 구성  |
|**STEP4**| **2023.03.15** |  - 오토레이아웃 적용 </br> - Console App의 Model 필요에 맞게 병합</br> - 비동기적으로 UI 업데이트 구현 |

</br>

## 실행 화면 🎬
### Console App

<img src ="https://i.imgur.com/xl7A61f.gif" width = 300>


</br>

### UI APP

|<center>10명 추가 클릭 시</center>  |<center>추가된 상태에서 계속 누를 때 </center> |
| -- | -- |
|<img src ="https://i.imgur.com/a0KZ5Xe.gif" width = 300>   | <img src ="https://i.imgur.com/cbdATGh.gif" width = 300>
  |

|<center>업무가 끝났을 때 타이머가 멈춤</center>  |<center>초기화를 누르면 초기화가 됨 </center> |
| -- | -- |
|<img src ="https://i.imgur.com/8MqzRX0.gif" width = 300>   | <img src ="https://i.imgur.com/ak0ejj4.gif" width = 300>
  |


</br>

## 트러블 슈팅 🚀

### 1️⃣ Main Thread의 코드가 비동기 작업 중 실행되는 문제
#### ▪️ 문제점
```swift
workQueue.async {
    self.depositDepartment.wait()
    Banker.doWork(for: customer)
    self.depositDepartment.signal()
}
```
`workQueue`는 concurrent DispatchQueue이기 때문에 비동기 작업은 Main Thread가 아닌 새로운 스레드에서 진행하게 됩니다. 이때, 새로운 스레드의 작업을 기다리지 않아 main Thread의 다음 코드가 실행되는 문제가 있었습니다.

#### ▪️ 해결방안
```swift
workQueue.async(group: workGroup) {
    self.depositDepartment.wait()
    Banker.doWork(for: customer)
    self.depositDepartment.signal()
}

//...

workGroup.wait()
```
비동기 작업을 Main Thread가 기다릴 수 있도록 DispatchGroup을 생성하였습니다.

비동기 작업들을 같은 그룹으로 묶은 후, `workGroup.wait()`메서드를 통해 비동기 작업이 끝날 때까지 Main Thread가 정지하는 방법으로 문제를 해결하였습니다.

</br>

### 2️⃣ 접근 제어자 설정

#### ▪️ 문제점
```swift
struct LinkedList<T> {
    final private class Node<T> {
        var next: Node? = nil
        let data: T
        
        init(data: T) {
            self.data = data
        }
    }
}
```

구현 한 Node 타입을 외부에서는 모르게 하고 싶었기에 LinkedList 내부 `Nested Type` 으로 옮겨주었습니다.

하지만 내부로 옮겨 주면서 아래와 같은 에러가 발생 했습니다.
<img src="https://i.imgur.com/lYFVObu.png" width = 500>
</br>
     
Node type의 값을 갖는 프로퍼티의 접근 제어자는 nested type `Node` 클래스의 접근 제어자보다 높은 제어 수준을 가질 수 없었습니다.


#### ▪️ 해결방안
기존에 `private(set)`으로 구현한 Node 타입에 대한 접근제어자를 `private` 으로 수정하고 해당 프로퍼티의 data를 리턴해주는 get only 연산프로퍼티를 추가 구현 했습니다.

```swift
struct LinkedList<T> {
    final private class Node<T> {
    //...
    }
    
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private(set) var count: Int = 0
    
    var headData: T? {
        return head?.data
    }
    //...
}
```

이렇게 수정함으로써 자연스럽게 CustomerQueue도 Node에 대해 모르게 되었습니다 👀

</br>


### 3️⃣ 고객Queue 를 업무별로 가질 것인지, 하나로 처리할 것인지
#### ▪️ 문제점
- 하나의 Queue에서 dequeue 된 customer의 업무와 순회했을 때의 banker의 업무가 맞지 않을 때가 있기에 customer 의 업무가 무엇인지 검증하는 조건문이 필요했습니다.
- 이 과정에서 하나의 Queue 로 처리할시 banker들을 forEach 로 검증하는 과정에서 2명의 banker을 보유한 deposit 업무일 경우 첫 번째 banker 가 모든 deposit 업무를 수행하는 이슈가 생겼습니다.

#### ▪️ 해결방안
``` swift
        let loanWorkItem = DispatchWorkItem {
            while self.loanCustomerQueue.isEmpty == false {
                self.loanBankers.forEach { banker in
                    let customer = self.loanCustomerQueue.dequeue()
                    banker.workQueue.async(group: workGroup) {
                        banker .doWork(for: customer)
                    }
                }
            }
        }
        let depositWorkItem = DispatchWorkItem {
            while self.depositCustomerQueue.isEmpty == false {
                self.depositBankers.forEach{ banker in
                    let customer = self.depositCustomerQueue.dequeue()
                    banker.workQueue.async(group: workGroup) {
                        banker.doWork(for: customer)
                    }
                }
            }
```



이를 해결하기 위해 처음부터 고객의 업무별로 나누어진 Queue 를 생성해 banker 들에게 고객의 업무를 검증하는 과정을 생략할 수 있게 했습니다.


#### ▪️ 리팩토링

```swift
    private func startWork() {
        while customerQueue.isEmpty == false {
            guard let customer = customerQueue.dequeue() else { return }
            respond(to: customer)
        }
        
        workGroup.wait()
    }

    private func respond(to customer: Customer) {
        switch customer.business {
        case .deposit:
            workQueue.async(group: workGroup) {
                //...
            }
        case .loan:
            workQueue.async(group: workGroup) {
                //...
            }
        }
    }
```

- 리팩토링을 하는 과정에서 `"Banker의 수를 어떻게 인식할 것인가"` 라는 주제가 있었고,  Banker의 인스턴스가 아닌 작업 `thread` 갯수인 `Semaphore` 로 인식을 하자는 결과가 도출 되었습니다.
- 그렇기에 업무별 Banker의 인스턴스도 필요 없어지게 되었고, 고객의 Queue 도 업무별로가 아닌 하나의 Queue 로 처리가 가능해졌습니다.
- 고객의 업무검증만 된다면 똑같은 Banker 에게 customer 만 넘겨주어 코드의 길이가 확 주는 경험을 했습니다.

</br>

### 4️⃣ 업무시간 체크
#### ▪️ 문제점
> 기존에는 고객 수에서 업무시간을 곱하는 방법을 선택해 업무시간을 체크했습니다.

- 위 방식으로 진행 했을 때 업무를 처리하는 Banker 가 한명일 경우 문제가 없었느나 `Banker 가 여러명일 경우`에는 해당 방식으로 시간을 체크하는게 불가능하다는 문제가 있었습니다.

#### ▪️ 해결방안
- Banker 들의 업무는 비동기적으로 이루어지므로 Banker 들의 업무들이 시작되는 시점과 끝나는 시점을 알아야 했기에 다른 방법을 찾아보았습니다.
- 이를 해결하기위해 `CFAbsoluteTime`을 반환하는 메서드 `checkProcessTime`을 정의해 `startWorK` 메서드의 실행 시간을 구하도록 했습니다.
```swift
private func checkProcessTime(for process: () -> Void) -> CFAbsoluteTime {
    let startTime = CFAbsoluteTimeGetCurrent()
    process()
    let processTime = CFAbsoluteTimeGetCurrent() - startTime

    return processTime
}
```

</br>

### 5️⃣ 스크롤을 하는동안 타이머가 멈추는 문제
#### ▪️ 문제점
스크롤뷰의 스크롤 동작 시, timer가 멈추는 현상이 있었습니다.
이는 RunLoop의 mode에 기인한 문제였습니다.
Run Loop에는 mode가 있고 해당하는 mode에 따라 원치 않는 소스에 대한 이벤트를 필터링 할 수 있습니다.
Main Run Loop 초기 mode(`.default`)에서 스크롤이 동작하면 mode가 `eventTracking`으로 변경되어 타이머 이벤트를 처리하지 못하기 때문에 타이머가 멈추게 됩니다. 

#### ▪️ 해결방안
Timer 객체를 생성할 때, RunLoop의 `add(_:forMode:)` 메서드를 사용해 timer 이벤트를 MainRunLoop eventTracking mode에서도 처리할 수 있도록 수정했습니다.
```swift
RunLoop.current.add(self.timer, forMode: .common)
```

<br/>

</br>

### 6️⃣ 비동기 작업이 끝나는 시점

OperationQueue 에 추가한 비동기 작업들이 마지막으로 끝난 시점을 알아야 했습니다. 마지막 비동기 작업이 끝난 시점에 맞춰 타이머를 중지 시켜야 했기 때문에 어떤 방식으로 인식할 수 있을까 고민해봤습니다.

#### ▪️ 첫 번째 시도

BlockOperation 의 프로퍼티중  completionBlock 이 있단걸 알게 되었습니다. 해당 프로퍼티는 하나의 블록이 끝난 후 실행되는 전달인자와 반환값이 없는 클로저로 이 프로퍼티를 사용할 때 Queue 의 상태를 확인해 Notification 에 Post 를 해보려 했습니다.

```swift
operation.completionBlock = {
    guard self.operationQueue.isSuspended == true else { return }
// NotificationCenter의 Post 진행
}
```

 operationQueue의 isSuspended 프로퍼티를 활용해 현재 큐가 스케쥴링이 진행중인지 확인을 했습니다.
 
 만약 마지막 작업이라면 완료되는 시점에 isSuspended 가 true 가 될것이라 생각하고 NotificationCenter 에 Post 를 진행 했으나 guard 문에서 항상 return 이 되었습니다.
 
 lldb를 통해 확인한 결과 마지막 작업이 끝난 후에도 isSuspended 는 False 인 상태였습니다. 그렇기에 다른 방법을 찾아야만 했습니다.

#### ▪️ 두 번째 시도

thread의 sleep 후 NotifcationCenter 에 끝났다는 알림을 post 하고 있습니다. 해당 시점에서 StackView 들의 subView 들의 존재 여부를 검증 하는 방식으로 수정 해 보았습니다.

마지막 작업시점에서는 대기중과 업무중을 보여주는 StackView 들의 subView들이 다 removeArrangedSubview 가 진행이 되었기에

```swift
if waitingStackView.arrangedSubviews.isEmpty && workingStackView.arrangedSubviews.isEmpty {
    timer.invalidate()
}
```

두개의 StackView 들이 다 비어있다면 작업이 끝났다고 인지하고 타이머를 중지하도록 했습니다.


</br>

### 7️⃣ 비동기 작업 중간에 종료하기

초기화 버튼을 클릭 했을 때 진행중인 비동기코드를 중단을 해야 했습니다.
그래서 workItem 들을 서브 스크립트인 cancel 메서드를 사용하면 간단하게 해결될 줄 알았으나 예상대로 작동하지 않았습니다. 

#### ▪️ DispatchQueue
초기 비동기 코드를 작동할 때는 `DispatchQueue` 를 사용하고 있었습니다. 
작업 코드블록을 `DispatchWorkItem` 을 사용해 작성했고, 해당 타입에는 내부 메서드로 `cancel()` 메서드가 존재 했습니다. 하지만 해당 메서드는 실제로 작업을 취소해주는 것이 아닌 내부 프로퍼티인 isCancelled 를 true 로 바꿔주는 메서드 였습니다.

cancel() 를 호출하는 시점에는 이미 DispatchQueue 에서 대기하고 있는 상태였기에 취소되지 않고 계속해서 작동을 하고 있었습니다.

#### ▪️ OperationQueue
위와 같은 이유로 `OperationQueue`를 채택하기로 했습니다. OperationQueue는 각각의 작업들의 관리면에서 좀 더 용이 했었기에 쉽게 제어할 수 있었습니다. 

OperationQueue의 경우 `maxConcurrentOperationCount`를 설정해주면 Queue에 들어있는 operation의 동시에 실행되는 최대 개수를 지정해 실행되지 않는 Operation이 Queue에서 대기하게 되어 operation을 cancel 상태로 만들어줄 수 있었습니다. 

OperationQueue를 채택하게 되니  Semaphore 대신 `maxConcurrentOperationCount` 로 동시작업 수를 조절하게 되니 비동기 코드블록에서 wait() 과 signal()을 할필요도 없어졌고 기존에 전역으로 관리하고 있던 Semaphore을 삭제할 수 있어 코드의 간결성도 좋아졌습니다.  

<br/>

## 핵심 경험 ✏️

<details/>
    <summary>Concurrency Programming</summary>
    
### Concurrent DispatchQueue
```swift
private let workQueue: DispatchQueue = DispatchQueue(label: "workQueue", attributes: .concurrent)
```
`BankManager`가 `banker`에게 일을 넘기기 위한 대기열 `workQueue`를 concurrent DispatchQueue로 정의해 멀티스레드에서 작업될 수 있도록 하였습니다.

### DispatchSemaphore
```swift
private let loanDepartment: DispatchSemaphore
private let depositDepartment: DispatchSemaphore

private func respond(to customer: Customer) {
    switch customer.business {
    case .deposit:
        workQueue.async(group: workGroup) {
            self.depositDepartment.wait()
            Banker.doWork(for: customer)
            self.depositDepartment.signal()
        }
    case .loan:
        workQueue.async(group: workGroup) {
            self.loanDepartment.wait()
            Banker.doWork(for: customer)
            self.loanDepartment.signal()
        }
    }
}
```
각 업무 별로 접근 가능한 스레드의 수를 은행원의 인원 수로 생각하여 Semaphore를 만들어 동시에 진행될 작업의 수를 특정했습니다.

### DispatchGroup
```swift
workQueue.async(group: workGroup) { ... }
workGroup.wait()
```
concurrent DispatchQueue를 통해 수행되는 비동기 task들이 main 스레드 외의 스레드에서 수행되기 때문에 Group으로 묶어주어 비동기 작업이 끝나는 시점을 main 스레드가 기다릴 수 있도록 하였습니다.

</details>

</br>

<details/>
    <summary>Dynamic Scroll View</summary>
    
저희는 대기중인 customer label이 많이 추가되면 대기열을 전체적으로 확인할 수 있도록 Dynamic ScrollView를 사용하기로 했습니다.

처음에 Layout 문제로 아예 화면이 표시되지 않는 문제가 있었습니다.
```swift
waitingStackView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
    waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
    waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
    waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor)
])
```
ScrollView의 ContentView가 StackView이므로 Bottom이 알아서 잘 늘어나겠다고 생각했습니다만, 예상대로 작동하지 않았습니다.
스택뷰가 늘어나지 않고 스택뷰 안에 label들이 겹쳐서 쌓였습니다. 또한 width constraint가 없어서 스택뷰가 customer label의 크기에 맞게 줄어들었습니다.

이를 해결하기 위해 width constraint와 height constraint를 추가했습니다.
```swift
waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor).isActive = true
let heightConstraint = waitingStackView.heightAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.heightAnchor)
heightConstraint.priority = UILayoutPriority(250)
heightConstraint.isActive = true
```
**중요 포인트**
height constraint의 Priority를 낮춰주지 않으면 스택뷰가 스크롤뷰 영역 밖으로 늘어나지 않아 스크롤이 불가능했습니다.
customer label들이 찌그러지거나 겹치지 않고 쌓이게 하기 위해서는 해당 constraint의 priority를 낮게 설정할 필요가 있었습니다.

</details>

<br/>

## 팀 회고

### 우리팀이 잘한 점
- 프로젝트 수행 의지가 대단했다!
- 문제가 생겼을 때 바로 정답을 찾는게 아닌 어째서 그 문제가 일어났는지 파악한 뒤 대안을 생각했다.
- 스텝 수행을 우선으로 하지 않고 제대로 된 구현을 목표로 했다.
- Unit test를 열심히 작성했다. Test Double 사용 경험👍


### 우리팀의 개선할 점
- 열정이 넘친 나머지 컨디션 관리에 신경을 쓰지 못했다 😩

### 서로에게 한마디
- **Rowan to 릴라**
 진짜 어려운 프로젝트 같이 진행하느라 고생 많으셨습니다 👏 <br/> 힘든데도 항상 밝은 모습으로 진행해주셔서 힘내서 프로젝트 마무리할 수 있었던 것 같습니다~👍 <br/> 같이 고민하고 문제를 해결해나가면서 더 큰 보람을 느꼈던 것 같아요 💪💪💪 <br/> 남은 캠프 일정도 같이 힘내서 수료해봅시다 🫡

- **릴라 to Rowan**
 로완이랑 하는 첫 프로젝트 였는데 너무 많은걸 배운 2주 였습니다 👁👄👁 
 주제들이 되게 어려웠었는데 외부의 도움에 의존하지 않고 저희의 힘으로만 해내는 과정이 되게 값진 경험 이었습니다 🥹
 로완이랑 프로젝트 하면서 저도 많이 성장한걸 느꼈네요 !! 또 만나요 꼬오오오오옥~~~~~ 🧑🏻‍🔬
 


<br/>

## Reference 📑
- [Concurrency Programming Guide - Apple Document](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [Concurrency - Swift Language Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [Concurrency Programming - 야곰닷넷](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
