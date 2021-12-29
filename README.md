# 은행 창구 매니저 프로젝트

1. 프로젝트 기간: 2021.12.20 - 2021.12.31
2. Grounds Rules
    - 시간
        - 시작시간 10시
        - 점심시간 12시~2시
        - 저녁시간 6시~7시 사이부터 2시간
    - 진행 계획
        - 프로젝트가 중심이 아닌 학습과 이유에 초점을 맞추기
        - 의문점을 그냥 넘어가지 않기
    - 스크럼
        - 10시에 스크럼 시작
3. 커밋 규칙
    - 단위
        - 기능 단위
    - 메세지
        - 카르마 스타일

# 목차

- [키워드](#키워드)
- [STEP 1 : 큐 타입 구현](#STEP-1--큐-타입-구현)
    + [고민했던 것](#1-1-고민했던-것)
    + [의문점](#1-2-의문점)
    + [Trouble Shooting](#1-3-Trouble-Shooting)
    + [배운 개념](#1-4-배운-개념)
    + [PR 후 개선사항](#1-5-PR-후-개선사항)
- [STEP 2 : 타입 구현 및 콘솔앱 구현](#STEP-2--타입-구현-및-콘솔앱-구현)
    + [고민했던 것](#2-1-고민했던-것)
    + [의문점](#2-2-의문점)
    + [Trouble Shooting](#2-3-Trouble-Shooting)
    + [배운 개념](#2-4-배운-개념)
    + [PR 후 개선사항](#2-5-PR-후-개선사항)
- [STEP 3 : 다중 처리](#STEP-3--다중-처리)
    + [고민했던 것](#3-1-고민했던-것)
    + [의문점](#3-2-의문점)
    + [Trouble Shooting](#3-3-Trouble-Shooting)
    + [배운 개념](#3-4-배운-개념)

# 키워드

- `struct` `class`
- `Queue`
    - `LinkedList`
- `Generic`
- `Protocol`
- `Delegate Pattern`
- `SOLID : SRP`
- `Wildcard Pattern`
- `Strong Reference Cycle`
- `Core Foundation` vs `Foundation`
- `CFAbsoluteTime` `Date`
- `GCD`
    - `DispatchQueue`
    - `Semaphore`
    - `DispatchGroup`
    - `async` `sync`
    - `Serial` `Concurrent`

# STEP 1 : 큐 타입 구현

은행에 도착한 고객이 임시로 대기할 대기열 타입을 구현합니다.

## 1-1 고민했던 것

- 양방향 LinkedList vs 단방향 LinkedList
    - 서로 이야기를 나누면서 단방향으로도 충분히 큐를 구현할 수 있다는 생각이 듦.
    - 노드를 클래스로 만들고 참조를 활용하여 모든 노드를 연결할 수 있게 구현하였다.
- 테스트를 위한 Mock 타입 생성
    - 테스트 진행시 `Node`, LinkedList의 `head`, `tail`의 요소를 접근하여 테스트 결과를 확인했다.
    - 해당 요소들은 외부에서 접근하면 안된다는 판단이 들어서 따로 MockLinkedList를 만들어주어 원활한 테스트를 할 수 있도록 구현하였다.
- attribute를 활용
    - 반환 값을 유의미하게 사용하지 않고 버려도되는 remove 관련 메소드에 속성 `@discardableResult`을 부여하여 컴파일러 경고가 발생하지 않도록 하였다.

## 1-2 의문점

- if vs guard
    
    ```swift
    // 1. if 구문
    func removeFirst() -> Element? {
        if isEmpty {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    ```
    
    ```swift
    // 2. guard 구문
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    ```
    
- if문으로 구현 시 조건문이 깔끔하게 isEmpty로 맞아떨어지기 때문에 코드의 가독성이 좋다고 생각했다.
    - guard문이든 if문이든 메소드 시작부문에서 return을 활용하여 메소드를 탈출하는건 동일하기 때문에 어떤 구문을 사용하든 상관없다는 생각이 들었다.
- guard문
    - guard 구문의 기능은 코드 블럭의 빠른 종료 기능을 가지고 있어 함수 전체 흐름을 봤을 때 guard 구문이 가독성이 더 좋다고 생각했다. guard문만 보더라도 함수를 탈출하는 구문이라고 읽혀지기 때문이다.
    - if문 처럼 조건문이 깔끔하지는 못하게 되었지만, 함수를 탈출하는 부분을 guard문으로 일관성 있게 구성할 수 있게 되었다.

## 1-3 Trouble Shooting

### [1] 참조타입을 활용한 연결리스트

- `상황` append를 할때 연결된 리스트들의 가장 마지막 부분에 새로운 데이터를 넣어줘야하는데, 요소를 탐색하기 위해 반복적으로 포인터를 추적하는 작업을 해야하는 점을 깔끔하게 해결해보고 싶었다.
- `이유` Queue를 위한 LinkedList인 점도 있고, 또 각 요소를 탐색하기 위해 반복적으로 포인터를 추적하게 된다면 시간복잡도가 O(n)이기 때문에 데이터 접근 방식이 매우 비효율적인 점을 해결하고 싶었다.
- `해결`  클래스의 참조를 활용하여 연결리스트를 연결하도록 구현하였다.
    
    ```swift
    func append(_ value: Element) {
        let newNode = Node(value: value)
            
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    ```

![](https://i.imgur.com/C3uId1Z.png)
    

## 1-4 배운 개념

- Linked-list 자료구조의 이해
- Queue 자료구조의 이해

## 1-5 PR 후 개선사항

- 테스트 코드 내부에서 override한 메소드 내부에 super 메소드를 호출하도록 수정
- LinkedList를 테스트하기 위한 Mock 객체 삭제
    - LinkedList 타입에서 접근할 수 있는 프로퍼티, 메소드를 활용하여 테스트를 하도록 리팩토링
- 테스트 메소드 이름을 적절하게 수정
- QueueTests에서 `setUp()` 메소드를 활용하도록 수정


[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#은행-창구-매니저-프로젝트)

---

# STEP 2 : 타입 구현 및 콘솔앱 구현

은행과 고객의 타입을 구현하고 콘솔앱을 구현한다.

## 2-1 고민했던 것

- 구현한 타입들 각각 하나의 책임만 갖도록 고민해보았다.
    - `출력문`까지도 은행원, 은행이 해야할 일이 아니라고 판단되었기 때문에 따로 출력만 하는 타입(ViewController)을 만들어 `Delegate 패턴`을 활용하여 분리해주었다.
    - 요구사항 예시에 맞춰 출력을 해주기 위해 NumberFormatter를 활용하는 부분이 필요했는데, 이 부분은 은행에서 직접 처리하는 건 적합하지 않다는 생각이 들었다. 따라서 따로 타입으로 빼주어 static 메소드로 구현해주었다.
- 순환참조
    - `Delegate 패턴`을 사용하기 위해서 `모델 타입` 별로 `viewController`를 만들어주었다.
    - `모델 타입`은 `delegate`로 `viewController`를 가지고 있고 `viewController`은 자기 자신을 `delegate`로 넘겨주기 위해 `모델 타입`을 가지고 있어 `순환 참조`가 발생한다.
    - `모델 타입`의 `delegate`를 weak 키워드(약한 참조)를 사용해 `순환참조`를 해결할 수 있다.
- Delegate 패턴 작성시 네이밍에 대한 고민을 해보았다.
    - 구글의 [Swift Style Guide](https://google.github.io/swift/#delegate-methods)를 참고하여 네이밍을 하였다.
        
        > The term “delegate’s source object” refers to the object that invokes methods on the delegate. For example, a `UITableView` is the source object that invokes methods on the `UITableViewDelegate` that is set as the view’s `delegate` property.
        > 

## 2-2 의문점

- Delegate 패턴 구현을 위해 기존 모델 타입에 변경사항이 생겼는데 이게 올바른 것인지 잘 판단이 서질 않는다.
    - 기존 구조체였던 타입들을 `class`로 변경해준 부분이 추후 retain count 추적 비용이 발생할 것이라는 우려가 생겼다.
- Delegate 패턴 사용시 강한 순환 참조 발생을 예방하기 위해 weak 키워드를 사용해주었더니 와일드카드 패턴으로 생성한 인스턴스가 생성과 동시에 해제가 되었다.
    - 인스턴스를 생성한 후 참조를 하지 않는다면 weak 키워드 보다는 와일드카드 패턴을 사용하는 것이 적합한 것일까?
- 단일 책임 원칙에 맞게 역할을 Delegate 패턴을 활용하여 분리해주었다. 하지만 확장성을 고려했을 때 이게 올바르게 설계한 것이 맞는지 너무 오버 엔지리어닝한 부분은 아닌지 판단이 어렵다.

## 2-3 Trouble Shooting

### [1] 와일드카드 패턴으로 생성한 인스턴스의 참조 카운트

- `상황` 기존에 와일드카드 패턴으로 인스턴스 생성한 타입이 Delegate를 채택하고 있던 형태였다. 이후 순환참조 문제가 우려되어 각 타입들마다 delegate 프로퍼티에 weak 키워드를 붙여주었다.
    
    ```swift
    final class Bank {
        private let bankClerk: BankClerk
        private var customerQueue = Queue<Customer>()
        weak var delegate: BankDelegate?
    ...
    }
    
    func run() {
        let bankClerk = BankClerk()
        let bank = Bank(bankClerk: bankClerk)
        let bankManager = BankManager(bank: bank)
        let _ = BankClerkViewController(bankClerk: bankClerk)
        let _ = BankViewController(bank: bank) // 
    ...
    }
    ```
    
- `이유` 그런데 weak키워드를 붙여주니 해당 타입에서 출력해주었던 메소드가 실행되지 않았다. init과 deinit을 통해 디버깅을 해보니 와일드카드 패턴으로 생성한 인스턴스가 생성과 동시에 해제되는 것을 확인할 수 있었다. `와일드카드 패턴`은 값을 해체하거나 무시하는 패턴중 하나이므로 `weak 키워드`가 추가됨과 동시에 retain count가 올라가지 않기 때문에 생성과 동시에 해제되는 것이였다.
- `해결` 사용하지 않는 viewController(은행원, 은행)를 상수에 담으면 xcode에서 고메세지가 출력된다. 와일드 카드 패턴을 사용해서 순환참조 문제를 해결할 수 있다고 판단되어 weak 키워드를 제거하고 와일드카드 패턴을 사용하기로 결정했다.
    
    ```swift
    final class Bank {
        private let bankClerk: BankClerk
        private var customerQueue = Queue<Customer>()
        var delegate: BankDelegate?
    ...
    }
    
    func run() {
        let bankClerk = BankClerk()
        let bank = Bank(bankClerk: bankClerk)
        let bankManager = BankManager(bank: bank)
        let _ = BankClerkViewController(bankClerk: bankClerk)
        let _ = BankViewController(bank: bank) 
    ...
    }
    ```
    

## 2-4 배운 개념

- 타입 추상화 및 일반화
- Delegate 패턴 활용
- SOLID의 단일 책임 원칙
- 와일드카드 패턴과 weak 키워드의 관계

## 2-5 PR 후 개선사항

- 개발할 때 염두해야할 것
    - 기능을 선택할 때에는 비슷한 기능은 무엇이 있는지 탐색하기.
    - 선택한 기능이 다른 기능보다 나은점은 뭐가 있는지 생각해보기
    - 기능을 찾아 사용할 때 선택한 이유를 생각해보기
- `CFAbsoluteTime` 타입 대신에 Date 타입을 활용하여 연산시간 측정하도록 수정
    - `Core Foundation` 내장함수보다 `Foundation`에 있는 기능을 활용하려는 의도
        - Core Foundation vs Foundation
            - 코어 파운데이션에 있는 기능은 Foundation에서 래핑하여 구현되어져있다.
            - 보통 앱개발을 할 때에는 Foundation의 기능 없이 개발하기에는 어려움이 있기 때문에, Core Foundation에 내장되어있는 기능보다는 Foundation에 내장되어있는 기능을 사용하는 것을 선호하는 편이다.
- `Delegate` 패턴과 `ViewController` 타입 모두 삭제
    - 다음 STEP를 지레짐작하지 말고 현재 STEP에 충실하자.
    - 시도하고 실패하고 돌아가는 과정을 반복하며 개선해나가는 방향으로 진행하자.
- `Message`의 네이밍을 명확하게 개선
    - Menu의 프로퍼티를 활용하여 `menuList`의 프로퍼티 내부 하드코딩을 개선
- `NumberFormatter`를 활용하였던 부분을 Double을 확장하여 개선
    - `String(format:)`을 활용하여 description을 반환하도록 구성

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#은행-창구-매니저-프로젝트)

---

# STEP 3 : 다중 처리

은행원 여러명이 업무를 처리할 수 있도록 구현합니다.

## 3-1 고민했던 것

### 1. 다중 처리

- 여러 은행원이 동시에 고객의 일을 처리하는 로직을 고민했다.
1. `global() 큐`에 은행원의 수 만큼 `task`를 만들고 각각의 `task`에서 고객을 `dequeue`해서 처리하는 방식
2. 하나의 while 구문에서 dequeue 해주고 고객의 은행 업무에 따라 예금 고객은 `DispatchQueue.global()`에 세마포어를 이용해 `은행원 수 == 접근 가능한 스레드 수`  만드는 방식
    - `DispatchSemaphore`의 `value`를 1이 아닌 2나 3으로 줄 경우 `Race Condition`이 발생할 수 있다는 가능성이 존재하기 때문에 해당 방법은 적절하지 못하다는 생각이 들었다.
    - `Banker`가 가지고 있는 `work()` 메소드는 현재 공유자원에 접근하고 있지 않지만, 추후 해당 메소드가 공유자원에 접근하지 않을거라는 보장이 없다라는 생각이 들었다.
- 추후 은행원의 수가 변경되더라도 대응할 수 있도록 은행원 수 만큼 `DispatchQueue.global()`에 `task`를 만드는 `1번 방식`으로 구현했다.
    - `은행원 수` == `DispatchQueue의 수`

### 2. 대기번호 오름차순으로 업무를 할 수 있도록 처리

- 프로젝트 실행예시에는 대기번호 순으로 실행되고 있지 않은 점을 발견하게 되었다.
    - 이 부분을 야곰에게 질문해보았고, 순차적으로 업무를 할 수 있도록 구현해보라고 하셔서 고민하게 되었다.
- 고민한 결과, 대기번호 순으로 `차례대로 업무가 처리되야 된다고 생각`했기 때문에 대출업무와 예금업무를 보는 고객들을 `두개의 고객큐`로 나누어 관리하도록 구현했다.

### 3. CustomStringConvertible을 사용하지 않고 연산프로퍼티를 사용

- `Banking`의 경우 `rawValue`를 `String`으로 가지고 있는 형태인데, 이 부분을 은행원이 어떤 업무를 처리했는지 알려주기 위해 사용하려는 의도로 구현하게 되었다. `프로토콜 채택`과 `연산프로퍼티` 중에 어떤 방식으로 활용할 지 고민해보았다.
    - `CustomStringConvertible`의 경우 인스턴스를 원하는 형태의 문자열로 반환하고 싶을 때 채택하여 사용하는 프로토콜로 우리가 활용하고자 하였던 부분이랑은 적합하지 않다는 생각이 들었다.
    - 따라서 description이라는 연산프로퍼티를 활용하여 rawValue를 반환하도록 구현해주었다.

## 3-2 의문점

### DispatchSemaphore의 value가 1 이상이라면 Race Condition이 무조건 발생할까?

- 처음에 while문 안에 `DispatchQueue`를 호출하고 `DispatchSemaphore`의 `value`를 `3`으로 주어 3개의 스레드만 접근할 수 있도록 설정해주었다. 그런데 여러번 돌려도 Race Condition이 발생하지 않았다.
- 은행원의 수(`DispatchSemaphore value`)와 고객의 수를 늘려주고 테스트를 해보았더니 Race Condition이 발생하였다.
    - 테스트를 하면서 알게된 부분은 `Banker`의 `work()` 메소드가 공유자원에 접근하지 않기 때문에 발생하지 않았던 것이였다. 프로퍼티 `count`를 만들어주고 그 count에 접근하도록 구현해주었더니 Race Condition이 발생하는 상황을 확인할 수 있었다.
- 이 의문점을 풀면서 결국 `Semaphore의 value를 여러개 주는 것`은 공유자원에 접근할 수 있는 상황이라면 `Thread-safe하지 않은 것`이고, 따라서 은행원의 수를 `DispatchSemaphore`의 `value`에 맞춰 설계를 하는 것은 적절하지 못하다는 결론이 났다.

## 3-3 Truoble Shooting

### 구조체 프로퍼티는 클로저 내부에서 왜 변경할 수 없는가?

- `상황` 프로젝트에서  `Bank 타입`은 `구조체`이고, `numberOfCustomers 프로퍼티`를 가지고 있다. 은행원이 일을 할 때, 처리한 고객의 수를 `Dispatch.global().async` 클로저 내에서 카운트(`numberOfCustomers`) 해주도록 하려고 했으나 위와 같은 에러가 발생하였다.
- `이유`  `Escaping closure`의 경우 구조체에서는 캡쳐가 불가능하기 때문에, 프로퍼티를 변경하려고 하면 위와 같은 에러가 발생한다.

```swift
// 간단한 코드 예시
struct SomeStruct {
    var num = 0
    
    private mutating func test() {
        let closure = { // Escaping closure captures mutating 'self' parameter
            self.num += 1
        }
        closure()
    }
}
```

- `Escaping closure`의 경우 구조체에서는 캡쳐가 불가능하기 때문에, 프로퍼티를 변경하려고 하면 위와 같은 에러가 발생한다.
    
    > class와 같은 참조 타입이 아닌 Struct, enum과 같은 값타입에서는 mutating reference의 캡쳐를 허용하지 않기 때문에 self 사용이 불가능 하다.
    > 
- `해결` `Bank 타입`을 `클래스`로 바꿔주었다.

## 3-4 배운 개념

- 동기(Synchronous)와 비동기(Asynchronous)의 이해
- 동시성 프로그래밍 개념의 이해
- 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- 스레드(Thread) 개념에 대한 이해
- GCD를 활용한 동시성 프로그래밍 구현
- 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#은행-창구-매니저-프로젝트)
