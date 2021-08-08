# 💷 은행창구 매니저 프로젝트

**프로젝트 기간: 2021년 7월 26일 ~ 8월 6일**

*with Coden, Joey*.  
&nbsp;   

## UML - 수정 전

![UML Ver.1](https://user-images.githubusercontent.com/39452092/127615589-93a85404-fe9e-4dec-9248-5d766cc640b1.png)
&nbsp;   

## UML - 수정 후

![UML Ver.2](https://user-images.githubusercontent.com/39452092/128499668-630c88c0-7cf2-422e-9d02-eb794f76ed3f.png)

&nbsp;   

# STEP1 - LinkedList로 Queue 타입 구현

## 📖 주요 학습 개념

### **LinkedList 자료구조의 이해 및 구현**

<details>
<summary> <b> LinkedList 코드 </b>  </summary>
<div markdown="1">


```swift
class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(with data: T) {
        self.data = data
    }
    
    fileprivate init() {
        self.data = nil
    }
}

struct LinkedList<T> {
    private var head: Node<T>
    private var tail: Node<T>
    
    var peek: Node<T>? {
        return head.next
    }
    
    var isEmpty: Bool {
        return head === tail
    }
    
    init() {
        let dummyNode = Node<T>()
        head = dummyNode
        tail = dummyNode
    }
    
    func push(data: T) {
        let newNode = Node(with: data)
        newNode.next = head.next
        head.next = newNode
    }
    
    mutating func append(data: T) {
        let newNode = Node(with: data)
        tail.next = newNode
        tail = newNode
    }
    
    func contains(_ targetNode: Node<T>) -> Bool {
        var currentNode = head
        while let nextNode = currentNode.next, nextNode !== targetNode {
            currentNode = nextNode
        }
        return currentNode !== tail
    }
    
    mutating func insert(data: T, after targetNode: Node<T>) {
        guard self.contains(targetNode) else {
            return
        }
        let newNode = Node(with: data)
        newNode.next = targetNode.next
        targetNode.next = newNode
        if targetNode === tail {
            tail = newNode
        }
    }
    
    mutating func pop() -> Node<T>? {
        if self.isEmpty {
            return nil
        }
        let frontNode = head.next
        head.next = frontNode?.next
        if frontNode === tail {
            tail = head
        }
        return frontNode
    }
    
    mutating func removeLast() -> Node<T>? {
        if self.isEmpty {
            return nil
        }
        var currentNode = head
        while let nextNode = currentNode.next, nextNode !== tail {
            currentNode = nextNode
        }
        let rearNode = tail
        tail = currentNode
        return rearNode
    }
    
    mutating func remove(after targetNode: Node<T>) -> Node<T>? {
        guard self.contains(targetNode) else {
            return nil
        }
        let nodeToRemove = targetNode.next
        targetNode.next = nodeToRemove?.next
        if nodeToRemove === tail {
            tail = targetNode
        }
        return nodeToRemove
    }
    
    mutating func clear() {
        head.next = nil
        tail = head
    }
}
```

</div>
</details>
<br>

**Dummy Node**

- **Dummy Node**와 **tail**을 활용해 마지막 노드까지 탐색하는 과정을 생략할 수 있도록 구현했다. (시간복잡도를 낮춤)
- Dummy Node의 Data에 들어갈 값을 고민했는데, data 타입을 옵셔널로 만듦으로써 nil이 들어갈 수 있도록 하였다.

&nbsp;   

**Reference Counting**

- LinkedList를 해제할 때 `head.next = nil`로 다음 노드에 대한 참조를 해제했다. 이전 노드가 사라지면 다음 노드의 참조가 사라져 연쇄적으로 다음 노드들이 해제된다.
- 단, 마지막 노드는 추가적으로 **tail에서의 참조**도 제거해 해제했다. 마지막 노드는 이전 노드와 tail에 의해 두 번 참조되기 때문이다. (ARC에 대한 이해)

&nbsp;   

**Generics**

- Generics 개념을 적용해 LinkedList에 다양한 타입을 담을 수 있도록 구현했다.

&nbsp;   

### Queue

- 큐는 선입선출(FIFO)의 특징을 가지는 ADT이다.
- 일상생활에서의 대기열을 예로 들 수 있다.
- `enqueue`, `dequeue`는 반드시 구현해야 하는 메소드이며 `peek`, `isEmpty`, `clear`등도 추가적으로 구현할 수 있다.
- 큐는 배열로도 구현할 수 있지만 연결리스트로도 구현이 가능하다.

&nbsp;   

### Unit Test

- 테스트할 타입을 `setUp()` 에서 초기화 해줬다.

- 하지만 다음 테스트처럼 타입을 새로 생성하는 경우 테스트 함수 내의 given에서 한 번 더 생성을 해주었다. 혹시 `setUp()` 에서 **sut에 다른 조작이 들어가게 되는 경우를 대비**해 **한 번 더 초기화**를 함으로써 **어떠한 값도 담기지 않았다는 것을 보장&명시**했다.

  ```swift
  func test_큐를새로생성하고_isEmpty해보면_true이다() {
      //given
      sut = Queue()
      //when
      let outputValue = sut.isEmpty
      //then
      XCTAssertTrue(outputValue)
  }
  ```

&nbsp;   

# STEP2 - Queue 활용과 동시성 기초

## 📖 주요 학습 개념

### Serial VS. Concurrent

**`Serial`**

- 한번에 하나만 수행한다는 개념
- Serial DispatchQueue에 많은 Task가 들어가 있다고 하더라도 이는 하나의 쓰레드에서 순차적으로 수행되게 됨
- Thread Pool에서 가져오는 쓰레드는 하나뿐이지만 매 Task마다 다른 쓰레드를 가져와서 처리시킬 수도 있다.

**`Concurrent`**

- 한번에 여러개를 수행한다는 개념
- Concurrent DispatchQueue에 많은 Task가 들어가 있는 경우 이는 여러 쓰레드에서 동시에 수행되게 됨
- Thread Pool에서 몇개의 쓰레드를 가져올지는 알 수 없다.(다만 iOS 환경에서 모든 DispatchQueue가 가져다가 쓰는 쓰레드 총 합은 64개를 넘지 못한다.)

&nbsp;   

### Sync VS. Async - 작업 완료여부를 누가 신경쓰는가

**`Sync`**

- 동기적으로 수행시킨다.
- **작업 완료여부는 호출한 쪽에서 신경쓴다.**
- 작업을 보낸 쪽에서 작업이 끝나기를(return) 기다리는 형태 → Block과 일반적으로 같이 쓰임
- Non-Block인 경우 호출한 쪽에서 부탁한 일이 끝났는지를 계속 물어보게 됨

**`Async`**

- 비동기적으로 수행시킨다
- **작업 완료여부는 콜백이 신경쓴다.**
- 작업을 보낸 쪽에서는 작업이 끝나기를 기다리지 않는 형태 → Non-Block과 일반적으로 같이 쓰임
- Block인 경우 작업을 부탁하고 돌아와도 아무것도 못하기 때문에 보통 같이 쓰이지는 않는다.
- 작업이 끝난 뒤 처리할 코드를 콜백에 넣어두고 동작하도록 할 수 있다.

&nbsp;   

### Block VS. Non-Block - 함수가 바로 리턴하는가

**`Block`**

- 호출된 쪽의 함수가 바로 return 되지 않으며 호출한 쪽이 일을 하지 못하도록 막음

**`Non-Block`**

- 호출된 쪽의 함수는 바로 return되며 호출한 쪽은 다음 일을 할 수 있음

![https://user-images.githubusercontent.com/39452092/128502366-542445ef-5618-42a3-bf4a-d9d867f71571.png](https://user-images.githubusercontent.com/39452092/128502366-542445ef-5618-42a3-bf4a-d9d867f71571.png)

> [앨런의 Blocking Non-Blocking 설명 - Inflearn](https://www.inflearn.com/news/72620)

&nbsp;   

### Concurrency VS. Parrellel

**`Concurrency`**

- 논리적인 개념
- 하나의 쓰레드가 여러 쓰레드의 일을 매우 빠르게 번갈아가면서 수행하면 이는 **동시에** 수행되는 것처럼 보임

**`Parrellel`**

- 물리적인 개념
- 실제 CPU에 물리적인 쓰레드가 여러개 있어, 여러 일을 **동시에** 수행할 수 있다.
- 병렬성은 동시성을 포함한다.

&nbsp;   

### Thread

**소프트웨어 스레드**

- **가장 작은 작업의 단위**
- 프로세스 내에서 생성되는 것은 소프트웨어 쓰레드
  - 소프트웨어 쓰레드는 여러 자원들을 공유한다.
  - 다만 스택 주소공간과 PC, Register 값은 별도로 가진다.

**물리적 스레드**

- 실제로 CPU가 가진 것들은 물리적인 쓰레드
- 물리적인 쓰레드 하나는 여러개의 소프트웨어 쓰레드 작업을 수행할 수 있다.
- iOS에서는 Thread Pool이라는 것이 있어 DispatchQueue는 이곳에서 쓰레드를 가져다가 쓴다.(소프트웨어 쓰레드)

&nbsp;   

### Thread.sleep(forTimeInterval:)

- `sleep(UInt)` 를 호출해 Thread를 잠시 중지할 수 있다.
- Double 타입의 시간동안 Thread를 중지하고 싶은 경우 `Thread.sleep(forTimeInterval:)` 를 활용하면 된다

&nbsp;   

### Class vs Struct

- `Class를 참조하는 Struct` 와 `Class를 참조하는 Class` 를 복사하는 경우 `Class를 참조하는 Struct` 의 reference counting 오버헤드가 무척 크기 때문에 상위 타입을 Struct보다는 Class로 구현하는 것이 좋다는 것을 배웠다. 하지만 이번 프로젝트에서 타입들을 복사할 일은 없기 때문에 Node를 제외한 타입들은 Struct로 구현하려고 했다.

&nbsp;   

### Mutable한 self는 share(capture) 할 수 없다.

- DispatchQueue로 보내는 closure에서 **Struct의 프로퍼티를 참조**하는 경우 **mutating self를 capture할 수 없다는 에러**가 발생했다. 따라서 비동기 처리를 하는 타입의 경우 class로 구현했다.

```swift
struct Camper {
		var name: String
		
		mutating func changeName(to newName: String) {
				name = "뭘로 바꾸죠?" //가능한 문장
				DispatchQueue.global().async {
						self.name = "조이!" //불가능. 클로저가 mutable한 self를 캡쳐해서 가지고 나가려 하기 때문
				}
		}
}
```

&nbsp;   

# STEP3 - DispatchQueue를 통한 동시성 처리

## 📖 주요 학습 개념

### DispatchQueue

DispatchQueue는 개발자가 queue에 closure 형태의 작업을 추가할 수 있도록 하는 class다. 작업이 queue에 추가되면 GCD는 작업을 처리하기 위해 알아서 Thread를 생성하고 작업을 별도의 thread에 분배해 처리한다.

- 프로그래머가 `NSThread`를 만들어서 복잡하게 동시성을 처리할 필요가 없도록, 애플에서 추상화된 클래스로써 제공
- 주의해야 할 것은 DispatchQueue와 Thread는 다르다는 것이다!

> by vivi 🦜
>
> Task - 실행될 작업
> Thread - 작업이 실행되는 흐름
> Queue - 작업 실행이 예약된 대기열 (요즘 플젝에서 자주 보는 큐 FIFO 방식의 😋)
>
> concurrent / serial - **queue가 작업을 thread에 할당하는 방식을 나타냄**
>
> sync / async - **queue에 작업을 할당시키는 방식**
>
> 요렇게 정리해보면 어떨까용

&nbsp;   

**Main**

코드가 default로 돌아가는 메인 스레드로 유일한 스레드며 serial로 동작한다. UI와 관련된 작업들을 처리하기 때문에 네트워크 작업과 같은 많은 시간이 소요되는 작업은 다른 스레드에서 실행해 최상의 사용자 경험을 제공하게 하는 것이 좋다.

- 만약 네트워크 작업과 같은 시간이 오래 걸리는 일을 메인쓰레드에서 수행시키게 한다면 화면이 버벅일 수 있다. → Update Cycle이 지연되기 때문

  ![https://user-images.githubusercontent.com/39452092/128512637-e6d6478e-a1c9-43fa-91a0-cdc45029aae9.png](https://user-images.githubusercontent.com/39452092/128512637-e6d6478e-a1c9-43fa-91a0-cdc45029aae9.png)

  > [앨런의 Concurrency, GCD, Operation 강의](https://www.inflearn.com/course/iOS-Concurrency-GCD-Operation)

**Global**

- 비동기로 작업이 처리되는 queue. 서비스 품질(quality of service)에 따라 6가지로 분류가 되어 있으며 각 queue는 우선순위가 높을 수록 더 많은 Thread를 배치하고 배터리를 더 집중해서 작업을 더 빨리 처리할 수 있도록 한다.
- .userInteractive, .userInitiated, .default, .utility, .background, .unspecified 가 있으며 default는 `DispatchQueue.global()` 이라고만 명시해줘도 된다. 대부분의 경우 default를 사용한다.
- qos에 따라 큐 인스턴스는 별도로 생성된다.

**Custom**

- 기본은 직렬로 동작하는 custom queue
- Concurrent하게 설정할 수 있지만 동시성 queue를 사용하기 위해서는 보통 Global queue를 사용한다.
- 인스턴스 생성 시 label을 지정해 줄 수 있는데, 고유 identifier로써의 기능은 수행하지 못한다. (같은 레이블값을 주어 생성해줘도 서로 다른 큐로 만들어짐)

> 💡 
>
> Global 큐이든 Custom 큐이든 총 쓰레드 개수 제한은 64개이다.(iOS 기준)
> 만약 Global에서 이미 64개를 쓰고 있다면 큐를 아무리 더 만들어봤자 해당 큐들은 쓰레드를  쓸 수 없다.
> 다만 각 큐마다 쓰레드 제한은 걸려있지 않다. (Operation Queue는 가능하다고 한다.)
> [참고](https://www.oreilly.com/library/view/high-performance-ios/9781491910993/ch04.html)

&nbsp;   

### 클로저와 ARC (Capture list에 대한 고민)

- DispatchQueue에 넘겨주는 Task도 클로저이기 때문에 Strong Reference Cycle을 염두해야 한다.
- 일반적으로 클로저 내에서 self를 캡처한다고 해도, 인스턴스가 DispatchQueue에 보내는 Task클로저를 참조하지는 않기 때문에 Strong Reference Cycle은 생기지 않는다. 그래도 유념하도록 하자.

&nbsp;   

### Semaphore

- 각 은행원은 고객의 업무를 동기적으로 처리한다. 하지만 만약 같은 업무를 수행하는 은행원이 둘이 있다면? 동기적인 작업의 개수를 제한하는 방식을 구현하기 위해 semaphore 를 사용했다.
- Semaphore는 임계구역 문제의 해결방안 중 하나로 **동일한 자원에 동시에 접근할 수 있는 개수**를 의미하는 정수 변수다. Semaphore는 `wait()` (p연산)과 `signal()` (v연산) 으로만 접근할 수 있으며 semaphore가 0이면 접근을 시도하는 프로세스나 스레드는 대기를 해야 한다.
- semaphore가 0이면 프로세스나 스레드는 `wait()` 에서 대기를 하다가 접근이 허용되면 semaphore를 1 감소시키고 접근한다. 데이터 사용이 끝나면 `signal()` 로 semaphore를 1 증가시켜 사용이 끝났음을 알린다.
- 같은 업무를 하는 은행원의 수가 2라면 `DispatchSemaphore(Value: 2)` 를 만들어 비동기 작업을 처리하도록 했다. 그러면 DispatchQueue가 알아서 동시에 2개의 작업만 처리한다.

&nbsp;   

### Thread safety of DispatchSemaphore

```swift
func serveCustomers() {
    let tellerGroup = DispatchGroup()
    while let currentCustomer = customerQueue.dequeue() {
        semaphore.wait()
        tellerGroup.enter()
        DispatchQueue.global().async {
            self.serve(customer: currentCustomer)
            self.semaphore.signal()
            tellerGroup.leave()
        }
    }
    tellerGroup.wait()
    departmentGroup.leave()
}
```

- DispatchQueue로 비동기 작업을 보낼 때 `semaphore.signal()`과 `tellerGroup.leave()` 는 과연 멀티 스레드 환경에서 동시에 호출됐을 때 thread safe한지 의문이 들었다. [Thread와 Semaphore에 관한 스탠포드 대학 문서](https://see.stanford.edu/materials/icsppcs107/23-Concurrency-Examples.pdf)를 참고해보니 semaphore의 연산들은 `atomic` 하다고 한다. 문서에 따르면 어떤 작업이 `atomic` 하다는 것은 같은 작업을 시도하는 다른 스레드에 의해 방해받을 일이 없다. 즉, semaphore의 연산들은 `thread safe`하다.
- [DispatchSemaphore의 공식문서](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)를 보면 *"efficient implementation of a traditional counting semaphore"* 라고 설명하고 있으니 DispatchSemaphore 역시 연산들이 atomic하기 때문에 `thread safe`한 작업이라고 봐도 좋을 것 같다.

&nbsp;   

### DispatchGroup

```swift
func serveCustomers() {
    departments.forEach { _, bankingDepartment in
        departmentGroup.enter()
        DispatchQueue.global().async {
            // 작업
            // departmentGroup.leave()
        }
    }
    departmentGroup.wait()
}
```

- 비동기적인 작업들이 **모두 끝난 시점**을 알고 싶어 DispatchGroup을 활용했다. 비동기 작업을 시작하기 전 `group.enter()` , 비동기 작업이 끝난 후 `group.leave()` 를 하도록 해 작업의 개수를 파악할 수 있도록 했다. 그리고 마지막으로 `group.wait()` 로 group에 들어간 작업들이 끝날 때까지 기다리도록 구현해 최종 완료 시점을 알 수 있었다.

&nbsp;   

### Mutual Exclusion

- 상호 배제라고 하며 공유자원에 여러 쓰레드가 접근하려 하는 것을 피하기 위해 사용된다.

  [상호 배제 - 위키백과]([https://ko.wikipedia.org/wiki/상호_배제)

- 상호 배제 기법에는 여러가지가 있다.

  1. 데커 알고리즘(최초)
  2. 피터슨 알고리즘
  3. Lamport 빵집 🍞 알고리즘
  4. 뮤텍스
  5. 세마포어
  6. 모니터

  &nbsp;   

### 확장성

- **BankingCategory**는 은행에서 처리하는 업무의 종류, **BankingDepartment**는 해당 업무를 처리하는 부서를 지칭한다.
- 현재 프로젝트에는 loan과 deposit 두 가지 업무밖에 없기 때문에 **Bank**에서 각 부서를 프로퍼티로 갖고 있어도 되지만 확장성을 고려해 `[BankingCategory:BankingDepartment]` 형태의 딕셔너리로 departments(부서)를 관리하도록 했다.
- 이를 위해 생성자에서 departments에 필요한 값들을 가변인자로 받도록 구현했다.

```swift
struct Bank {
    private var departments = [BankingCategory:BankingDepartment]()
    
    init(departmentInformation: [(departmentCategory: BankingCategory, numberOfDepartmentTellers: Int)]) {
        departmentInformation.forEach { category, numberOfTellers in
            self.departments[category] = BankingDepartment(duty: category, numberOfBankTellers: numberOfTellers, departmentGroup: self.departmentGroup)
        }
    }
    // ...
}
```

&nbsp;   

### Variadic Parameter

- 가변인자라고 하며 함수를 호출하는 쪽에서는 argument를 안 줄수도, 여러개 줄 수도 있다

```swift
func someVariadic(numbers: Int...) {
		numbers.forEach {
				//...
		}
}

someVariadic()
someVariadic(1)
someVariadic(1, 2, 3)
```

- 주의해야 할 점

  - 넘겨줄 때 배열로 넘겨주지 않는다는 것
  - 받은 쪽에서는 배열이 된다는 것(위의 경우 numbers의 타입은 `[Int]`이다.)

  &nbsp;   

### `UInt`에 대하여

[The Basics - The Swift Programming Language (Swift 5.5)](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID320)

> 💡
>
> Use `UInt` only when you specifically need an unsigned integer type with the same size as the platform’s native word size. If this isn’t the case, `Int` is preferred, even when the values to be stored are known to be nonnegative. A consistent use of `Int` for integer values aids code interoperability, avoids the need to convert between different number types, and matches integer type inference, as described in Type Safety and Type Inference.

>  `UInt`는 플랫폼의 고유 word size와 동일한 크기의 unsigned integer 타입이 필요할 때에만 사용해라.
> 만약 이 경우가 아니라면, `Int`를 추천한다. (양의 정수값만을 저장한다고 하더라도)
> 정수값에 대해 `Int` 타입을 일관성 있게 사용한다면, 코드 상호운용성을 증대시킬 수 있을 것이다. (다른 숫자 타입간에 변환과정이 필요없게 되며, 정수 타입의 타입추론과도 일치하게 된다.)

- 자세한 내용은 잘 모르겠지만, word size라는 것은 컴퓨터의 32-bit, 64-bit 아키텍쳐를 의미하는 것이므로, 해당 bit와 동일한 사이즈를 가지는 unsigned int가 필요할때만 쓰라는 것 같다. (이건 또 무슨 말이지)
- **Joey 뇌피셜** - `Int` 와 `UInt` 모두 `word size`를 갖는데 이때 `UInt`로 표현할 수 있는 양수 범위가 `Int`보다 훨씬 큽니다. 따라서 `Int`로 표현하지 못하는 크기의 양수를 선언해야할 때 `UInt`를 사용하고 그 외에는 `Int`를 사용하라는 의미인 것 같습니다.
- [UInt 공식문서](https://developer.apple.com/documentation/swift/uint)
- 어디에 어떻게 활용해 볼 수 있을까?

&nbsp;   

### Namespace Pollution

- 일반적으로 값의 변경이 추적되지 않기 때문에 전역변수는 쓰지 말라고 한다.
- 그렇다면 전역상수는? → Namespace Pollution을 막기 위해 struct, class, enum에 넣는 것이 바람직 할 수 있다.

```swift
enum SomeEnum {
		static let someGlobalConst = 100
}
```

- 여러가지 중에서도 enum에 넣는 이유는 case-less enum인 경우 accidently 하게 instance를 initiating 할 일이 없으므로!

---

# 헷갈릴만한 것들

## DispatchQueue에 sync로 Task를 넘기는 부분에 대하여

> 🐶
>  `DispatchQueue`도 사실 두개의 큐로 이루어져 있다고 합니다. `작업을 받아들이는 큐`와 `작업을 쓰레드로(?) 내보내는 큐` 이 두 개로요.
> 특정 쓰레드(이를테면 메인쓰레드)에서 동작하도록 작성한 코드에서 DispatchQueue에 sync로 Task를 보내면 (이는 작업을 받아들이는 큐로 들어갈 것) 당연히 작업을 보낸 해당 쓰레드는 block되면서 큐에 보낸 작업이 완료되길 기다리겠죠? (이 Task를 앞으로 A Task라고 칭하겠습니다.)
>
> 이 때 sync를 통해 A Task를 받은 DispatchQueu는  `작업을 쓰레드로 내보내는 큐` 의 내보내는 일들(?)을 동기적으로 수행한다고 해요. 
> A Task 이후에 받은 작업들은 'A Task가 쓰레드풀에서 가져온 쓰레드에 의해 실행이 완료'되어야 실행이 될 수 있는 형태로요. (큐 자체가 Concurrent라고 하더라도 이와같이 수행됨)
> (A Task를 받았어도 `작업을 받아들이는 큐` 는 그대로 두므로 해당 DispatchQueue는 계속 작업을 받을 수 있음)
>
> 그러면 A Task를 받기 이전에 큐에 존재했던 Task들은 어떻게 될까?
> A Task를 받기 이전에 먼저 받았던 작업들은 이미 쓰레드 풀에서 가져온 쓰레드에서 실행중이거나 / 가까운 미래에 쓰레드에서 실행되기를 기다리고 있을 것 같습니다. A Task와는 상관없이요. -> 제 생각입니다.
>
> [참고링크](https://theswiftdev.com/ultimate-grand-central-dispatch-tutorial-in-swift/)

&nbsp;   

## 아래의 인스턴스들은 Thread-safe할까?

1. `DispatchQueue`는 자체적으로 **thread-safe**한가?
2. `DispatchSemaphore`는 자체적으로 **thread-safe**한가?
3. `DispatchGroup`은 자체적으로 **thread-safe**한가?

→ Step3의 thread-safe에 해당하는 내용들과 동일한 내용이다. 우선 프로젝트의 코드 진행 결과로 봤을 때에는 Thread-safe한 것으로 보였다. 

**DispatchQueue는 Thread-Safe하다.** 

[애플의 동시성 프로그래밍 문서](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html#//apple_ref/doc/uid/TP40008091-CH102-SW28)

&nbsp; 
