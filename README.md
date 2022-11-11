# 🏦Ios Bank Manager🏦

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [파일구조](#-파일구조)
6. [UML](#-UML)
7. [실행화면](#-실행-화면)
8. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
9. [참고링크](#-참고-링크)


## 👋 소개
[Aaron](https://github.com/hashswim), [Tottale](https://github.com/tottalE)의 은행 창구 매니저 프로젝트입니다.


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

![]()

## 🧑 팀원
|<img src = "https://i.imgur.com/I8UdM0C.png" width=200 height=170>|<img src = "https://i.imgur.com/ZykY6Vn.png" width=200 height=170> 
|:--:|:--:|
|[Aaron](https://github.com/hashswim)|[Tottale](https://github.com/tottalE)|
 

## 🕖 타임라인
### STEP1
- cocoapods `swiftlint` setting
- `Linked List`, `Node`, `Queue` 클래스 생성 및 기본 구현 정의
- `Linked List`의 `Push`, , `Clear`, `RemoveAll`, `Peek`, `isEmpty` 기능 메서드 구현
- `Queue`의 `Enqueue`, `Dequeue`, `Clear`, `Peek`, `isEmpty` 기능 메서드 구현
- `Queue` 클래스에 대한 유닛 테스트 진행

### STEP2
- `Bank`, `Customer`, `BankClerk` 클래스 정의로 고객, 은행, 은행원 타입 구현
- 은행 내에 `open()`, `close()`, `menu()` 구현
- 은행에서 10~30사이의 랜덤한 명수의 손님들을 생성
- 은행에서 은행원이 손님들을 처리하도록 로직 구현
- CFAbsoluteTimeGetCurrent() 을 사용하여 시작 및 종료 시간을 측정해서 완료시에 보여주도록 함
- CFAbsoluteTime의 extension으로 fomat된 2자리 소수점의 string을 반환하도록 구현

### STEP3

- 예금과 대출 업무 큐 분리
- 대출과 예금 큐 각각 동시적으로 work 메서드 처리 구현
- 확장성과 다형성을 고려하여 workable 프로토콜 및 예금, 대출 은행원 구조체 구현
- 은행원 타입 두가지(DepositClerk, LoanClerk)로 분리, Workable protocol 생성
- serial Queue를 활용하여 Race Condition을 방지해 줌.
- Workable 프로토콜 내부의 scheduleWork() 함수를 정의하여 DispatchWorkItem을 생성해주도록 함.
- Bank init()에서 은행원 수와, 예금인원수를 입력하면 대출 및 예금 은행원이 자동 생성되도록 해줌.

### STEP4
- UIStackView 기준으로 autoLayout을 잡아주고 UI를 만들어줌.
- View에 맞도록 controller와 model을 수정해 줌.
- 커스텀 뷰를 만들어 적용해 줌.

## 💾 파일구조
```
└── BankManagerConsoleApp/
    ├── common
    │    └──CFAbsoluteTime+
    |
    ├── Appdelegate
    ├── SceneDelegate
    ├── Model
    │   ├── BankManager
    │   ├── LinkedList
    │   ├── Queue
    │   ├── Node
    │   ├── Bank
    │   ├── Customer
    │   └── BankClerk
    │
    ├── View/
    │   └── Main
    └── Controller/
```

## 📊 UML
 > ![](https://i.imgur.com/lY3ttMO.jpg)


## 💻 실행 화면

<!-- |일반 화면|다이나믹 타입 적용화면|
|:----:|:----:|
|<img src="https://i.imgur.com/vE9Xqbh.gif" width="300px">|<img src="https://i.imgur.com/68Y8ozn.gif" width="300px">| -->
> <img src="https://i.imgur.com/HZ4T4NK.gif" width="600px">

## 🎯 트러블 슈팅 및 고민****
### 1. `push 메서드 로직`
```swift!
class LinkedList<T> {
    ...
    
    func push() {      
        if self.isEmpty {
            self.head = node
            self.tail = node
            return
        }

        self.tail?.next = node
        self.tail = node
    }
    ...
}

```
- `self.tail = node` 의 중복을 없애기 위해
[다음](https://github.com/yagom-academy/ios-bank-manager/pull/214/commits/eba1e9f052f874584e140a9d039c101a3243da00)과 같이 수정 했으나 코드의 가독성과 직관성이 떨어져 아래와 같이 수정함

```swift!
class LinkedList<T> {
    ...
    
    func push() {      
        if self.isEmpty {
            self.head = node
        } else {
            self.tail?.next = node
        }
        self.tail = node
    ...
}

```


### 2. delay 구현
```swift
struct BankClerk {
        
    func work(for customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        usleep(useconds_t(700000))
        print("\(customer.number)번 고객 업무 완료")
    }
}
```

- `Timer`, `asyncAfter`, `DispatchSourceTimer` 등의 방법을 고려했지만 Step 2의 요구사항에만 맞도록 `usleep`을 사용하여 구현

### 3. 은행원의 역할

이전 코드에서는 은행원의 역할이 무엇이던 상관없이 은행원은 print만을 담당하였습니다. 그 코드는 아래와 같습니다. 

```swift
struct BankClerk {

    func work(for customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
    }
}
```

하지만, 객체지향적인 설계가 아니라는 생각이 들었고, 은행원을 enum 타입으로 대출 및 예금 형태로 구분해주는 것이 아닌 Workable 프로토콜을 따르는 대출 은행원, 예금 은행원으로 만들어주는 것이 더 낫다고 판단하였습니다.

```swift
protocol Workable {
    var service: Service { get }
    var processingTime: Double { get }
    func work(for customer: Customer)
    func scheduleWork(from customerQueue: Queue<Customer>) -> DispatchWorkItem
    static var serviceQueue: DispatchQueue { get }
}
```
위와 같은 형태로 프로토콜을 생성해 은행원이 일을 스케쥴링 하여 일을 할 수 있도록 하고 각각의 타입 프로퍼티로 serviceQueue를 설정하여 race condition을 방지할 수 있는 serial queue를 만들어 주었습니다.

### 4. 같은 큐 접근에 대한 race condtion 방지

- `DispatchQueue.gloabl().async`를 사용해 동시적으로 처리할 경우 같은 고객 대기열을 접근하게 되어 race condition이 발생할 수 있습니다. <br>
    이를 방지하기 위해서 `Dispatch Gruop`을 사용해 해당 그룹의 task가 끝나기 전까지 동기적으로 고객을 받아 race condition을 방지했습니다.
    
    ```swift
    func serve() {
            let group = DispatchGroup()

            clerks.forEach { clerk in
                switch clerk.service {
                case .loan:
                    DispatchQueue.global().async(group: group, execute: clerk.scheduleWork(from: loanQueue))
                case .deposit:
                    DispatchQueue.global().async(group: group, execute: clerk.scheduleWork(from: depositQueue))
                }
            }

            group.wait()
        }
    ```
    ```swift
    func scheduleWork(from customerQueue: Queue<Customer>) -> DispatchWorkItem {
            let depositWorkItem = DispatchWorkItem {
                while customerQueue.isEmpty == false {
                    var customer: Customer?
                    Self.serviceQueue.sync {
                        customer = customerQueue.dequeue()
                    }
                    guard let customer = customer else {
                        return
                    }
                    self.work(for: customer)
                }
            }
            return depositWorkItem
        }
    ```
## 📚 참고 링크

[Swift 지연실행 실험 - NSTimer, asyncAfter, DispatchSourceTimer
](https://es1015.tistory.com/405)
[Refactoring: Replace Enum with Polymorphism](https://medium.com/swift-fox/refactoring-replace-enum-with-polymorphism-c4803baeba07)
