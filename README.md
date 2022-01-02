# 은행 창구 매니저 프로젝트
>10명에서 30명까지 랜덤으로 고객이 생성되며 3명의 은행원(예금 2명, 대출 1명)이 동시성 프로그래밍을 활용해 업무를 처리하는 앱입니다. 

|콘솔 앱|UI 앱|
|---|---|
|![console](https://user-images.githubusercontent.com/60090790/147868948-0c3b0218-1d2e-4977-9a74-e59788f7e48e.gif)|![Simulator Screen Recording - iPhone 13 Pro Max - 2022-01-02 at 14 49 43](https://user-images.githubusercontent.com/90880660/147868995-003c772c-e0b9-4722-8a93-d2ed487b42e3.gif)|![Simulator Screen Recording - iPhone 13 Pro Max - 2022-01-02 at 14 49 43](https://user-images.githubusercontent.com/90880660/147868995-003c772c-e0b9-4722-8a93-d2ed487b42e3.gif)|

---

## 📝 진행하며 배운 개념

- LinkedList
- DispatchQueue
- Semaphore
- CFAbsoluteTime
- 동시성 프로그래밍
- 코드로 UI 작성 (addTarget)
- Timer
- Custom View
- escaping closure
- 의존성 주입

---

## 1️⃣ Step 1

## 🔸 주요 구현 사항

> `Linked List`, `Unit Test`
> 

### 1. Singly Linked List 구현

- Linked List 맨 마지막에 원소를 조금 더 효율적으로 추가하기 위해 `tail` 변수를 생성했습니다.
- 스텝 요구사항대로 Linked List를 사용하는 Queue 타입과 `Enqueue, Dequeue, Clear, Peek, isEmpty` 기능을 구현했습니다.

### 2. Unit Test 진행 및 `XCTUnwrap` 사용

- `setUpWithError()` 에서 sut을 할당해주고 `tearDownWithError()` 에서 다시 nil로 할당하려면 sut을 옵셔널 타입으로 선언해야 했습니다. 옵셔널 타입인 sut을 바인딩하기 위해 `XCTUnwrap`을 사용했습니다.
- 강제 추출을 통해 바인딩을 해주게 되면 Fatal Error가 발생하며 앱이 아예 종료되는 문제가 있습니다. `XCTUnwrap`을 사용하면 테스트가 실패했다고 알려줘서 테스트 코드에 사용하기 더 적합하다고 생각했습니다.

<br>

## 🔸 문제점 및 해결 방법

### 1. Linked List의 `removeAll()` / `removeFirst()`메서드의 로직

```swift
mutating func clear() {
    while head != nil {
    	   head = nil
 	   head = head?.next
    }
}
```

- 처음에는 위 코드처럼 head가 nil이 아닐 때, head에 nil을 할당해주고 head를 `head?.next`로 이동시켜서 모든 원소를 돌며 일일히 삭제해주는 방법을 사용했습니다.
- 하지만 LLDB를 통해 확인해보니 head에 nil을 할당한다면 이어지는 모든 Node도 nil이 할당되어 전부 비워지는 것을 확인했습니다. tail에는 저희가 직접 특정한 Node를 할당해주어 `head = nil` 만으로는 nil이 할당되지 않는 것을 확인할 수 있었습니다.

![캡쳐](https://user-images.githubusercontent.com/90880660/146898189-ee09f9bb-db52-43c2-970f-372186a0ad34.png)

- head에 추가한 Node가 전부 들어가 있는 것을 확인할 수 있었습니다.
- 따라서 반복문을 사용하지 않고 head와 tail에 각각 nil을 할당해서 모든 LinkedList를 삭제하는 방법을 선택했습니다.

<br>

---

## 2️⃣ Step 2

## 🔸 주요 구현 사항

> `POP`, `Dispatch Queue`
> 

### 1. 고객 타입 구현

- 고객 모델을 어떻게 구현할지 고민했습니다. 동료들과 대화를 통해 리팩터링하여 최종적으로 이렇게 구현했습니다.
    
    ```swift
    struct Client {
        let clientNumber: Int
    
        init(_ clientNumber: Int = 0) {
            self.clientNumber = clientNumber
        }
    }
    
    struct Clients {
        private var waitingLine = Queue<Client>()
    		...
    }
    
    ```
    
- 그리고 `Bank Manager` 와 메서드를 통해 협력할 수 있게 구현해보려고 노력했습니다.

### 2. Protocol-Oriented Programming

- `BankClerk` 내부에 해야 하는 일을 구현하면 `BankManager`에서도 `BankClerk`의 인스턴스를 생성해서 사용해줘야 하는 만큼 타입 간의 의존성이 높아진다고 판단했습니다.
- 다음 스텝에서 `BankClerk` 의 수가 늘어나고 하는 일이 두 가지로 나눠지는 것도 인지하고 있었습니다.
- 그래서 어떤 일을 해야하는지 protocol로 구현한 후 extension을 통해 default implement를 해주었습니다.
    
    ```swift
    protocol Workable {
        func work(for client: Int)
    }
    
    extension Workable {
        func work(for client: Int) {
            print("\\(client)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\\(client)번 고객 업무 완료")
        }
    }
    
    ```
    
- 이렇게 해당 프로토콜을 채택하는 객체는 내부에 메서드를 따로 작성하지 않아도 적합한 일을 할 수 있도록 구현해줬습니다.

<br>

## 🔸 문제점 및 해결 방법

### 1. 코드 실행에 따른 소요 시간 계산

- 코드 실행에 따른 소요 시간을 어떻게 계산할 지에 대해 고민했습니다.
- 처음에는 실행에 걸리는 0.7초의 시간에 고객 수를 곱하여 계산하려고 했으나, 이렇게 계산할 경우 약간의 연산 딜레이를 포함하지 못했고, 여러 쓰레드가 일을 하게 된다면 이에 대응할 수 없었습니다.
- 따라서 업무를 시작하고 끝나는 시간을 `CFAbsoluteTime` 을 통해 받아온 뒤 이 둘의 차이를 계산할 수 있도록 구현했습니다.
    
    ```swift
    mutating private func dequeueWaitingLine() {
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
    
        while clients.startTask() > Bank.emptyWaitingLine {
            manageClerk(clerkNumber, for: clients.startTask())
            clients.completeTask()
        }
    
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        duration = endTime - startTime
    }
    
    ```
    

### 2. Dispatch Queue

- 처음에는 직접 일을 하는 `BankClerk`에 `Dispatch Queue`를 생성하도록 구현했습니다.
- 하지만 구현하는 중 `Dispatch Queue`가 일을 시키기 때문에 `BankManager` 와 유사한 역할이고, 저희의 설계 방향과 구현이 달라지는 문제가 있었습니다.
- `BankManager`에서 `Dispatch Queue`를 생성해서 `BankClerk`에게 일을 시킬 수 있도록 수정했습니다.
- 저희가 수정한 내용은 아래와 같습니다.
    - `BankManager` 가 `Managable` 프로토콜을 채택하고 있습니다.
        
        ```swift
        protocol Managable {
            func giveWork(to clerkNumber: Int) -> DispatchQueue
        }
        
        extension Managable {
            func giveWork(to clerkNumber: Int) -> DispatchQueue {
                return DispatchQueue(label: "clerk\\(clerkNumber)")
            }
        }
        
        ```
        
    - `giveWork` 메서드에서 DispatchQueue를 만들어서 반환하고 있습니다.
        
        ```swift
        private func manageClerk(_ clerkNumber: Int, for client: Int) {
                giveWork(to: clerkNumber).sync {
                    clerk.work(for: client)
                }
            }
        
        ```
        
<br>        

---

## 3️⃣ Step 3

## 🔸 주요 구현 사항

> `Semaphore`, `dispatchQueue.global.async`, `DispatchGroup`
> 

### 1. 동시에 세 명이 일하도록 구현

- 3명이 일하는 것처럼 Thread를 사용하려면 어떻게 구현해야 하는지 고민했습니다.
- `global.async`로 쓰레드에 일을 준 후 바로 `announceClose` 메서드가 실행되지 않도록 `DispatchGroup()` 을 만들어 `DispatchQueue` 를 만들 때 `group` 인자를 주었습니다.
- 그 후 `startBankTask` 메서드를 실행하고 바로 `announceClose` 메서드가 실행되지 않도록 `dispatchGroup.wait()` 를 해줬습니다.

### 2. 의존성 주입(생성자 주입)을 활용한 인스턴스 생성

- 함수나 객체 안에서 객체를 생성하게 되면 의존성이 높아져서 변화에 유연하게 대응하기 어렵다고 생각했습니다.
- 따라서 의존성 주입을 통해 최대한 타입 및 메서드 내에 인스턴스를 직접 생성하지 않도록 구현했습니다.
- 또한 전체 프로그램을 실행하는 객체 `MenuOperation`을 생성하여 main.swift에선 실행을 위한 최소한의 코드만 있을 수 있도록 구현했습니다.

<br>

## 🔸 문제점 및 해결 방법

### 1. `startBankTask` 메서드 관련

- `startBankTask` 메서드 내부의 `DispatchQueue`에 일감을 주는 부분을 분리하려는 시도도 했습니다. 하지만 의도했던 대로 동작하지 않았습니다.
    
    ```swift
    private func startBankTask() {
            let depositSemaphore = DispatchSemaphore(value: Bank.depositClerkCount)
            let loanSemaphore = DispatchSemaphore(value: Bank.loanClerkCount)
    
            while let taskType = clients.informTaskType(),
                  let clientIdentifier = clients.dequeueWaitingLine() {
    						// DispatchQueue에 일감을 주는 아래 부분
                DispatchQueue.global().async(group: dispatchGroup) {
                    switch taskType {
                    case .deposit:
                        depositSemaphore.wait()
                        self.clerk.work(for: clientIdentifier, task: taskType)
                        depositSemaphore.signal()
                    case .loan:
                        loanSemaphore.wait()
                        self.clerk.work(for: clientIdentifier, task: taskType)
                        loanSemaphore.signal()
                    }
                }
            }
        }
    
    ```
    

### (1) 시도한 방법

1. dispatchWorkItem 변수로 생성
    - `DispatchQueue.global().async(group: dispatchGroup, execute: workItem)` 처럼 workItem을 따로 프로퍼티로 두어 해당 메서드를 호출할 때 인자로 넣어주는 방법을 사용하고 싶었습니다.
    - `while let` 으로 `taskType` 과 `clientIdentifier` 를 매번 고객 대기열에서 꺼내오는 로직으로 구현이 되어 있었습니다. `while let` 보다 미리 선언된 `workItem` 내부에서 아직 할당되지 않은 `taskType` 과 `clientIdentifier` 가 필요한 문제가 있었습니다. 또한 업데이트를 해주기도 힘들어 실패했습니다.
2. 별도의 메서드로 분리
    - 아래 코드 부분을 메서드로 분리해보았습니다.
        
        ```swift
                let depositSemaphore = DispatchSemaphore(value: Bank.depositClerkCount)
                let loanSemaphore = DispatchSemaphore(value: Bank.loanClerkCount)
        
                DispatchQueue.global().async(group: dispatchGroup) {
                        switch taskType {
                        case .deposit:
                            depositSemaphore.wait()
                            self.clerk.work(for: clientIdentifier, task: taskType)
                            depositSemaphore.signal()
                        case .loan:
                            loanSemaphore.wait()
                            self.clerk.work(for: clientIdentifier, task: taskType)
                            loanSemaphore.signal()
                        }
                    }
        
        ```
        
    - 고객 대기열에서 `dequeue` 해온 대로 하나씩 메서드로 들어가서 → 쓰레드가 하나씩 생성되고 → 모든 고객의 업무 시작 문구가 먼저 찍히는 문제가 있었습니다.
    - 상기의 문제를 해결하였고, 최종적으로 별도의 메서드를 분리해서 기능 분리하는 방법을 선택했습니다.

### (2) 해결 방법

- 해당 문제는 semaphore를 미리 만들어놓지 않고, while문 내에서 매번 만들어주어 발생하는 문제로 파악했습니다.
- 따라서 namespace를 위해 만들어놓은 `Bank`의 `Task` 열거형에 미리 대출 및 예금에 해당하는 Semaphore를 미리 만들어놓았습니다.
- 그 후 `taskType`을 매개변수로 받는 `giveTask` 메서드를 구현한 뒤, `startBankTask` 메서드에서 `Clients`의 `waitingLine`에서 값을 `dequeue`하여 `giveTask`의 매개변수로 넣어줄 수 있도록 구현했습니다.
    
    ```swift
    private func startBankTask() {
            while let taskType = clients.informTaskType(),
                  let clientIdentifier = clients.takeTurn() {
                giveTask(of: taskType, for: clientIdentifier)
            }
        }
        
        private func giveTask(of taskType: Bank.Task, for clientIdentifier: Int) {
            let semaphore = taskType.semaphore
            
            DispatchQueue.global().async(group: dispatchGroup) {
                semaphore.wait()
                self.clerk.work(for: clientIdentifier, task: taskType)
                semaphore.signal()
            }
        }
    ```
    

### 2. DispatchSemaphore의 사용

- Semaphore에 3을 주고 while 문 내부에서 다시 예금과 대출에 각각 Semaphore를 2와 1로 주는 방법으로 구현했습니다.
- 하지만 이렇게 구현을 하니 처음에 3번의 일처리가 동시에 시작되긴 했으나, 예금과 대출에 접근하는 쓰레드의 수를 제어할 수 없는 문제가 있었습니다.
- 따라서 전체를 제어하는 Semaphore를 없에고, 예금과 대출에 해당하는 Semaphore를 각각 생성한 후 taskType에 따른 각각의 작업을 수행할 수 있도록 구현했습니다.
    
    ```swift
    private func startBankTask() {
            let depositSemaphore = DispatchSemaphore(value: Bank.depositClerkCount)
            let loanSemaphore = DispatchSemaphore(value: Bank.loanClerkCount)
    
            while let taskType = clients.informTaskType(),
                  let clientIdentifier = clients.dequeueWaitingLine() {
                DispatchQueue.global().async(group: dispatchGroup) {
                    switch taskType {
                    case .deposit:
                        depositSemaphore.wait()
                        self.clerk.work(for: clientIdentifier, task: taskType)
                        depositSemaphore.signal()
                    case .loan:
                        loanSemaphore.wait()
                        self.clerk.work(for: clientIdentifier, task: taskType)
                        loanSemaphore.signal()
                    }
                }
            }
        }
    
    ```
    

### 3. BankManager에서 구조체를 사용했을 때의 문제점

- 모두 구조체 타입으로 만들어서 진행하다가 startBankTask 메서드에서 `Escaping closure captures mutating 'self' parameter` 에러가 발생했습니다.
    
    > If `self` is an instance of a structure or an enumeration, you can always refer to `self` implicitly. However, an escaping closure can’t capture a mutable reference to `self` when `self` is an instance of a structure or an enumeration. Structures and enumerations don’t allow shared mutability, as discussed in [Structures and Enumerations Are Value Types](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID88). <br> (출처: [https://docs.swift.org/swift-book/LanguageGuide/Closures.html](https://docs.swift.org/swift-book/LanguageGuide/Closures.html))
    > 
    
- 에러를 해결하던 중 값 타입의 struct로는 진행할 수 없다는 것을 배우게 되어 `BankManager` 를 클래스로 바꾸어주었습니다.

<br>

---

## 4️⃣ Step 4

## 🔸주요 구현 사항

> `Custom View`, `Timer`
> 

### 1. **Timer**

- 기존 스텝에서 구현했던 CFAbsoluteTime로는 카운트 앱 타이머 기능이 불가하다고 판단하여 `scheduledTimer` 를 활용하여 0.001초마다 해당 메서드의 selector가 호출될 수 있도록 구현했습니다.
- 스텝 요구사항에 맞게 분, 초, 밀리초의 양식을 사용했습니다.

```swift
    extension StackViewController {
        @objc func timeCounter() {
            count += 1
            let (minute, second, millisecond) = convertTime(milliseconds: count)
            let formattedTime = makeFormattedTime(minute: minute, second: second, millisecond: millisecond)
            workingTimeLabel.text = "\\(Label.workingTime)\\(formattedTime)"
        }

        func convertTime(milliseconds: Int) -> (Int, Int, Int) {
            let minute = (milliseconds / 1000) / 60
            let second = (milliseconds / 1000) % 60
            let millisecond = milliseconds % 1000

            return (minute, second, millisecond)
        }

        func makeFormattedTime(minute: Int, second: Int, millisecond: Int) -> String {
            let formattedMinute = String(format: "%02d", minute)
            let formattedSecond = String(format: "%02d", second)
            let formattedMillisecond = String(format: "%003d", millisecond)
            let formattedTime = "\\(formattedMinute) : \\(formattedSecond) : \\(formattedMillisecond)"

            return formattedTime
        }
    }
    ```
```

### 2. **CustomView 구현**

- 명세에 `고객 정보를 표현할 커스텀뷰를 구현합니다` 라는 표현이 있어 이를 커스텀 뷰로 어떻게 구현할 지 고민했습니다.
- 처음에는 대기열 전체를 커스텀 뷰로 구현하고 그 위에 subview로 stackview를 갖는 것을 고려했습니다.
- 두 레이블(`5 -` / `예금`)이 반복적으로 사용되는만큼 하나의 CustomView로 구현하여 재사용할 수 있도록 하는 것이 적합하다고 판단했습니다.

<br>

## 🔸 문제점

### 1. 업무시간 레이블이 숫자 변화에 따라 흔들리는 문제

- `workingTimeLabel`의 `textAlignment`를 `center`로 줬더니 시간이 경과하면서 Label의 숫자 크기가 달라져서 `workingTimeLabel`자체가 흔들리는 문제가 있었습니다.
- `textAlignment`를 `.left`로 주었더니 흔들리지 않았으나, 위치를 수동으로 지정해주어야해서 오토레이아웃을 적용하기가 어려웠습니다.

---
