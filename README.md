# 🏦 은행 매니저 프로젝트 저장소


---
## 목차 
- [STEP 1](#step-1)
  - [구현 내용](#구현-내용)
  - [고민했던 부분](#고민했던-부분)
- [STEP 2](#step-2) 
  - [구현 흐름(UML)](#구현-흐름-uml) 
  - [구현 내용](#구현-내용)
- [STEP 3](#step-3) 
  - [고민했던 부분](#고민했던-부분)
- [STEP 4](#step-4) 
  - [고민했던 부분](#고민했던-부분)
---

## STEP 1
## 구현 내용

#### **1. Linked List**

|자료 구조|LinkedList|
|:---:|---|
|장점|1. 데이터 추가 및 삭제가 빠르다 <br> 2. 데이터 추가/삭제시 메모리 재배치가 필요없기에 오버헤드가 낮다|
|단점|1. 인덱싱(검색)이 느리다(`O(n)`)|

프로젝트에서 요구되는 `LinkedList` 자료구조에 대해 살펴보았습니다. `은행에 도착한 고객은 순서대로 처리될 것`이라고 생각하여 `Singly Linked List`를 구현한 후 이를 활용하여 Queue를 구현했습니다. 

#### **2. `Node` 타입을 nested type으로 구현**

`Node` 타입의 경우 `Linked List`와 직접적으로 관련된 타입으로, 외부에서는 사용될 일이 없을 것이라 생각하여 nested type으로 구현해주었습니다.


```swift
class LinkedList<Element> {
    class Node {
        var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
}
```

#### **3. `Queue`의 `items` 인스턴스**

`Queue`타입을 초기화 할 때는 `items`에 요소가 없는 빈 경우일 것이라고 생각하여 `items`를 옵셔널이 아닌 빈 값으로 만들어주었습니다. 

### 고민했던 부분

### **1. Struct vs Class**

-  Node를 클래스로 만든 이유
    - Node 타입의 프로퍼티인 next가 Node 타입이어야 하는 상황, 즉 recursive한 관계를 가져야하기 때문에 class를 선택했습니다.
    - 다음 노드에 대한 참조가 필요하기 때문에 class를 선택했습니다.

- LinkedList, Queue를 클래스로 만든 이유
    - struct로 구현할 경우 단점
        1. 변경으로부터 안전하지 않다
            - 우선 struct로 구현하지 않은 이유는, 내부의 타입이 class이기 때문에, 값 타입임에도 불구하고 변경으로부터 안전하지 않기 때문이라고 생각했습니다.
            - struct 타입으로 구현된 Linked List의 인스턴스를 만들고 이를 복사한 후, 복사본 내 node의 값을 변경하게 되면 원본의 노드 값에도 영향을 미치게 됩니다. 
            - node가 class로 구현되어있기 때문에 동일한 메모리 주소를 가리키기 때문이기에 발생한 문제로, 해당 타입을 struct가 아닌 class로 구현해주었습니다. 
            - struct안에 class 타입을 구현하게 되면 struct의 장점인 '변경으로부터 안전하다'는 것이 사라집니다. 
        2. 메모리 관리
            - 또한 혹시나 있을 인스턴스 복사에 대해서 발생할 수 있는 메모리 문제에 유의하였습니다. 
            - 예시로, Linked List가 struct일 때 다른 인스턴스로 복사 후 내부 node를 모두 제거하는 경우, node의 retain count만  1만큼 내려가고, node의 deinit이 호출되지 않습니다. 하지만 이를 class로 구현할 경우, Linked List 원본과 복사본의 메모리 주소가 같아, 어느 한 군데서 node를 지우더라도 모두 제거되어 node의 deinit이 정상적으로 호출됨을 확인했습니다.
    - 이러한 이유에 근거하여 class로 해당 타입을 구현했습니다. 


### **2. LinkedList의 `removeAll()` 메서드**

Linked List의 모든 노드를 제거하기 위한 기능으로 아래와 같이 구현해주었습니다. 

```swift
//최종 코드
func removeAll() {
    head = nil
    tail = nil
}
```

처음에는 위처럼 구현할 경우 head와 tail 사이의 노드가 메모리에서 해제되지 않을 것이라고 생각했습니다. 또한 `append`하는 과정에서 변수에 Node를 넣어 선언하는 것이 변수와 Node 인스턴스 사이에 참조 관계를 만들어서 메모리에 할당된다고 생각하였습니다. 그래서 아래와 같이 모든 노드들을 순회하며 메모리를 해제해주도록 구현했습니다.


```swift
func append(value: Element) {
    let node = Node(value: value)

    if let tailNode = tail {
        tailNode.next = node
    } else {
        head = node
    }

    tail = node
}
```

```swift
//고민했던 코드
func removeAll() {
    while let next = head?.next {
        head = nil
        head = next
    }
    
    head = nil
    tail = nil
}
```

하지만 메서드 내의 지역변수이기 때문에 호출 종료와 동시에 메모리에서 해제된다는 것을 인지하였습니다. 이에 Node 타입에 deinit을 구현하여 확인해보니 기존 `removeAll`메서드 코드만으로도 모든 node를 메모리에서 해제 시키고 있음을 확인했습니다.

head를 nil로 만들어 줄 경우, 가장 마지막 이전 노드까지의 노드를 삭제해주게 됩니다. head가 사라지면서 head.next에 대한 참조 또한 깨지기 때문에 연쇄적으로 노드들이 사라지는 것을 확인했습니다. 

이에 마지막으로 `tail = nil`을 해주어 마지막 노드도 정상적으로 제거해주는 방식으로 구현하였습니다. 

### **3. Unit Test를 위한 테스트 코드 작성 방법**

테스트 코드도 좋은 코드로 작성해야하는지에 대한 고민이 있었습니다.

따라서 처음에는 좋은 코드를 작성하기 위해, XCTestCase에서 sut 프로퍼티를 암시적 추출 옵셔널 타입으로 생성하기보다는, 옵셔널 타입으로 생성하여 각 테스트마다 guard 문으로 옵셔널을 언래핑해주는 방식으로 작성했습니다.

그러나, guard 문으로 언래핑하는 것이 가독성 측면에서 좋지 않고 테스트 목적을 간결하게 보여주지 못합니다. 테스트 코드는 좋은 코드를 작성하는 것보다는 테스트 로직 자체에 집중해야하기 때문에 강제 언래핑을 사용해도 된다는 결론을 내렸습니다. 

```swift
class QueueTest: XCTestCase {
    var sut: Queue<Int>!
}
```

```swift
func test_1이_들어있는_큐에_peek했을때_값만_반환되고_1이_사라지지않는지() {
    sut.enqueue(value: 1)
    let result = sut.peek()

    XCTAssertEqual(result, 1)
    XCTAssertFalse(sut.isEmpty)
}
```
sut 를 사용하는 곳에서 굳이 언래핑해주지 않고 간결하게 사용이 가능해졌습니다. 

### 4. **`super.xxx`는 매번 호출해줘야 하는가?**

override를 하는 경우에 하위 클래스가 상위 클래스에서 지원하는 해당 기능을 사용할 수 있도록 `super.xxx`를 호출했었습니다. 

이 부분이 SOLID 원칙 중 LSP와 관련된 것이라는 추가적인 피드백을 받고 OOP적인 관점에서 다시금 생각해보게 되었습니다. 

앞서 언급된 부분처럼 테스트 코드에서는 OOP 관점으로 생각하지 않고 무결성을 우선시해야하기 때문에 관련된 메서드에서`super.xxx`를 호출하지 않아도 된다는 것을 인지했습니다.

## STEP 2
## 구현 흐름 (UML)

![](https://i.imgur.com/0ULWxpO.jpg)


## 구현 내용

### 1. 객체 지향 프로그래밍에 대해

객체들은 각각 역할과 책임을 갖고, 서로 메시지(요청)를 보내 협력할 수 있도록 구현해보고자 했습니다. 

- `BankClerk` (= 은행원)
    - 고객 업무 처리 진행
    - 은행에게 업무 마감을 알림
- `Bank` (= 은행)
    - 고객 queue 보유
    - 은행원에게 일을 시작할 것을 알림
    - 은행 업무 종료 관리 
- `BankManager` 
    - 은행 개점
    - 은행의 고객 queue를 채우는 기능 
    - 사용자에게 출력되는 기능 담당 
- `Customer` (= 고객)
    - 대기열 번호 보유
    - 업무 처리에 소요되는 시간 보유

요구사항에서는 은행/고객 타입만 있었지만, 은행 내에서 실질적으로 작업을 처리하는 은행원 타입을 추가해봤습니다.

 또한 최대한 위 구조를 기반으로 코드로 옮겨보려고 노력했습니다. 

### 2. Delegate 패턴 구현에 대한 부분 

두 가지 부분에 대해 Delegate 패턴을 사용하였습니다.
1. `Bank` <-> `BankClerk`
: 서로 작업을 요청하고, 작업이 종료됨을 알리기 위해 사용했습니다
2. `Bank`와 `BankClerk` -> `BankManager` (`BankDelegate`, `BankClerkDelegate` 프로토콜 채택)
: `Bank`와 `BankClerk`가 사용자에게 보여줄 메세지를 직접 프린트하지 않고 `BankManager`에서 대신 해주기 위해 사용했습니다. (추후 UIApp으로 전환시, 현재 print되고 있는 부분들이 UI요소와 연결될 부분이라고 생각하였습니다.)

### 3. Delegate 패턴의 순환참조 방지

`Bank`와 `BankClerk`가 서로 참조하고 있는 구조가 되어 순환 참조가 발생하여 메모리 누수가 발생할 수 있을거라 생각했습니다. 

이에 `BankClerk`가 가지는 `bank`를 `weak`로 구현하여 메모리 누수를 방지해주었습니다.



## STEP 3

### 고민했던 부분

1. 동시성 프로그래밍

은행원의 수를 쓰레드라고 생각하였고, 고객의 업무 종류에 따라 depositQueue, loanQueue를 만들어주었습니다.
depositQueue는 concurrent하게 loanQueue는 serial하게 만들었습니다.

while문의 조건으로 customerQueue에서 customer을 dequeue하는 것을 설정하여 공유자원에는 한 번씩만 접근하도록 설계하였습니다.

deposit 케이스에서는 비동기적으로 동작하는 concurrent 큐에서
semaphore를 사용하여 동시에 접근가능한 스레드의 수를 2로 두어서 deposit을 처리하는 은행원이 동시에 두명이 되도록 구현하였습니다.

반면에 loan 케이스에서는 일을 처리하는 은행원이 한 명이기때문에 비동기적으로 동작하는 serial큐를 사용하였습니다.

2. fatalError를 사용한 이유

```swift
static func createRandomTask() -> Self {
    guard let task = Self.allCases.randomElement() else {
        fatalError("랜덤한 Task를 생성할 수 없습니다.")
    }
    return task
}
```
`Task` enum내에 랜덤한 task를 열거형의 모든 case에서 골라서 리턴해주는 메서드에서 fatalError()을 사용하였는데요, 처음에는 error enum을 따로 만들어줘서 에러처리를 해주려고 했지만, 로직상 절대 발생할 수 없는 에러라고 판단하여 fatalError로 구현하였습니다. (apple이 검증한 메서드라고 생각했습니다.)

3. BankClerk의 역할

앞서 고민했던 부분에 따라 구현하다 보니 BankClerk가 delegate 패턴을 통해 Bank를 알게하는 방식이 필요없게 되었습니다. 이에 이 관계를 제거해주었고, 기존 customer queue에서 dequeue하던 부분을 Bank가 하도록 이전하였습니다.

4. 총 업무 시간 측정하는 방식

기존에는 BankClerk가 처리하는 고객의 소요 시간을 일일이 합하여 이를 계산했었는데, 시스템 시간을 활용하여 개선하였습니다. `CFAbsoluteTimeGetCurrent()` 메서드를 사용하여 시작/끝 시간을 기록하고 이 시간들의 차를 총 업무시간으로 하였습니다. 그러나, 시스템 시간은 외부 시간 참조와의 동기화 또는 사용자가 시스템 시간을 변경하는 경우 감소할 수 있기때문에 `DispatchTime` 방식을 사용하여 개선하였습니다. 

```swift
// 기존 방식
let startTime = CFAbsoluteTimeGetCurrent()
let endTime = CFAbsoluteTimeGetCurrent()

let totalProcessingTime = endTime - startTime
        
```

```swift
// 개선 방식
let startTime = DispatchTime.now()
let endTime = DispatchTime.now()

let totalProcessingTime = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
```

5. Bank 타입의 open 메서드 구현 방식 

Queue에서 맨 처음 요소를 제거하진 않고 확인만 하는 `peek()`를 통해 customer의 task를 확인하고 각각의 queue에 할당 한 후 각 쓰레드 내에서 customerQueue에 접근하여 dequeue하는 방식으로 구현해보려 시도했습니다.

그러다가 while문이 비정상적으로 많이 돌며 프로그램이 제대로 작동하지 않아서, 각 queue에서 customerQueue에 동시에 접근하는 상황이 아예 생겨나지 않도록 `customerQueue.dequeue()` 로 리턴한 요소를 바로 사용하는 로직으로 개선하였습니다. 

#### 개선 전 
```swift
func open() {
    let group = DispatchGroup()
    let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    let loanQueue = DispatchQueue(label: "loan")
    let semaphore = DispatchSemaphore(value: 2)

    while !customerQueue.isEmpty {
        switch customerQueue.peek()?.task {
        case .deposit:
            depositQueue.async(group: group) {
                semaphore.wait()
                self.bankClerk.work() //여기서 dequeue를 한다.
                semaphore.signal()
            }
        case .loan:
            loanQueue.async {
                self.bankClerk.work() //여기서 dequeue를 한다.
            }

        default:
            return
        }
    }

    group.wait()
}
```

#### 개선 후 
```swift
func open(timer: BankTimer) {
    timer.start()

    let group = DispatchGroup()
    let semaphore = DispatchSemaphore(value: 2)
    let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    let loanQueue = DispatchQueue(label: "loan")
    let bankGroup = DispatchGroup()

    while let customer = customerQueue.dequeue() {
        switch customer.task {
        case .deposit:
            depositQueue.async(group: group) {
                semaphore.wait()
                self.bankClerk.work(with: customer)
                semaphore.signal()
            }
        case .loan:
            loanQueue.async(group: group) {
                self.bankClerk.work(with: customer)
            }
        }
    }

    group.notify(queue: DispatchQueue.main) {
        timer.stop()
    }
}
```

## STEP 4

### 고민했던 부분

1. UI 업데이트

UI를 업데이트 하는 코드들은 모두 main 쓰레드 내에서 진행해주었습니다. 이에 문제없이 작동하는 점 확인했습니다. 기본적으로 은행 업무가 진행되는 쓰레드는 custom queue(serial/concurrent)이기에 UI의 경우 다른 쓰레드인 메인 쓰레드에서 정상적으로 업데이트 하도록 구현했습니다. 

2. CustomView의 활용

자주 쓰이는 `UIStackView`나 `UILabel`, `UIButton`들을 커스텀 뷰로 구현하여 사용했습니다. 커스텀 뷰를 만들 때 필요한 속성을 이니셜라이저를 통해 간단하게 생성할 수 있도록 했습니다.
추가적인 피드백을 통해 커스텀 뷰를 만들기 보다는 클로저 방식으로 UI인스턴스를 만들어주는 방식이 더 효율적이라는 것을 확인하고 추후 반영해보려고 합니다. 


3. `wait()` 과 `notify()`

Bank 타입의 `open()` 메서드에서 DispatchGroup을 사용하여 group안에 들어간 작업들이 모두 끝날 때 비동기적으로 timer의 stop 메서드가 호출되도록 구현하였습니다.

처음에는 Bank의 `open()` 메서드에서 마지막 라인에 `group.wait()` 를 사용하여 메인 쓰레드를 블록했었는데, 이 때문에 모든 작업이 완료되고 나서야 UI가 한꺼번에 업데이트 되는 상황이 발생하였습니다. 이에 동시에 UI 또한 업데이트를 시켜주기 위해, 작업을 동기적으로 기다리지 않고 비동기적으로 기다려주도록 수정했습니다.

이 때 dispatchGroup에서 `wait()`는 synchronous 하게 동작하고, `notify()`의 경우 asynchronous 하게 동작한다는 것을 이용하여 `notify()`로 변경했습니다.

```swift
group.notify(queue: DispatchQueue.main) {
    timer.stop()
}
```

4. UIStackView 활용

코드로 화면을 그릴 때 최대한 stackView를 활용하여 구성해보려고 노력했습니다. 이 덕분에 개별 UI요소에 auto layout을 적용하는 것보다 공수가 덜 들게 된 것 같아 이점을 취했다고 생각했습니다! 추가 피드백을 통해 `UIStackView`, Auto layout의 성능을 확인했으며 체계적으로 잘 사용해야겠다고 생각했습니다. 
