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
- [6. 핵심 경험 ✏️](#핵심-경험-%EF%B8%8F)
- [7. Reference 📑](#reference-) 

</br>

## 팀원을 소개합니다 👀

|<center>[Rowan](https://github.com/kokkilE)</center> | <center> [릴라](https://github.com/juun97)</center> | 
|--- | --- |
|<Img src = "https://i.imgur.com/S1hlffJ.jpg" width="300">| <img src="https://i.imgur.com/9M6jEo2.png" width=300>  |

</br>

## 시각화된 프로젝트 구조 
### Class Diagram 🗺

<img src="https://i.imgur.com/aUAvv3A.png" width = 700>


### File Tree 🌲

```typescript
├── BankManagerConsoleApp
│   ├── main.swift
│   └── Model
│       ├── Bank.swift
│       ├── Banker.swift
│       ├── Business.swift
│       ├── Customer.swift
│       └── DataStructure
│           ├── CustomerQueue.swift
│           └── LinkedList.swift
└── UnitTest
    └── CustomerQueueTest.swift
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

</br>

## 실행 화면 🎬
### Console App

<img src ="https://i.imgur.com/xl7A61f.gif" width = 700>


</br>

## 트러블 슈팅 🚀

### 1️⃣ Main Thread의 코드가 비동기 작업 중 실행되는 문제
```swift
workQueue.async {
    self.depositDepartment.wait()
    Banker.doWork(for: customer)
    self.depositDepartment.signal()
}
```
`workQueue`는 concurrent DispatchQueue이기 때문에 비동기 작업은 Main Thread가 아닌 새로운 스레드에서 진행하게 됩니다. 이때, 새로운 스레드의 작업을 기다리지 않아 main Thread의 다음 코드가 실행되는 문제가 있었습니다.

#### 해결방안
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

### 2️⃣ 접근 제어자 설정

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



그렇기에 기존에 `private(set)`으로 구현한 Node 타입에 대한 접근제어자를 `private` 으로 수정하고 해당 프로퍼티의 data를 리턴해주는 get only 연산프로퍼티를 추가 구현 했습니다.

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




### 3️⃣ 고객Queue 를 업무별로 가질 것인지, 하나로 처리할 것인지

- 하나의 Queue에서 dequeue 된 customer의 업무와 순회했을 때의 banker의 업무가 맞지 않을 때가 있기에 customer 의 업무가 무엇인지 검증하는 조건문이 필요했습니다.
- 이 과정에서 하나의 Queue 로 처리할시 banker들을 forEach 로 검증하는 과정에서 2명의 banker을 보유한 deposit 업무일 경우 첫 번째 banker 가 모든 deposit 업무를 수행하는 이슈가 생겼습니다.

### 해결방안
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


### 리팩토링

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


## 4️⃣ 업무시간 체크
>기존에는 고객수에서 업무시간을 곱하는 방법을 선택해 업무시간을 체크했습니다.

- 위 방식으로 진행 했을 때 업무를 처리하는 Banker 가 한명일 경우 문제가 없었느나 B`anker 가 여러명일 경우`에는 해당 방식으로 시간을 체크하는게 불가능했습니다.

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

## Reference 📑
- [Concurrency Programming Guide - Apple Document](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [Concurrency - Swift Language Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [Concurrency Programming - 야곰닷넷](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
