# 은행창구 매니저 🏦

> 소개: GCD기술을 이용해 은행업무를 동시적으로 처리할 수 있게 만든 프로젝트


</br>

## 목차
1. [팀원](#1-팀원)
2. [타임라인](#2-타임라인)
3. [프로젝트 구조](#3-프로젝트-구조)
4. [실행화면](#4-실행-화면)
5. [트러블슈팅](#5-트러블-슈팅)
6. [참고링크](#6-참고-링크)

<br>

## 1. 팀원

|[Harry](https://github.com/HarryHyeon)| [Christy](https://github.com/christy-hs-lee) | [Brody](https://github.com/seunghyunCheon)|
| :--------: | :--------: | :---------: |
|<img height="180px" src="https://i.imgur.com/BYdaDjU.png">| <img height="180px" src="https://i.imgur.com/kHLXeMG.png"> | <img height="180px" src="https://i.imgur.com/fPPz155.jpg">|


<br>

## 2. 타임라인
### 프로젝트 진행 기간
**23.03.06 (월) ~ 23.03.17 (금)** 

| 날짜 | 타임라인 |
| --- | --- |
|23.03.06 (월)| TDD: DataStructure(Node, LinkedList, BankManagerQueue) 정의 |
|23.03.07 (화)| 메인에서 동기로 작업이 한번에 하나씩 동작할 수 있도록 구현|
|23.03.08 (수)| DispatchSemaphore 실습 |
|23.03.09 (목)| 비동기로 작업이 동시에 실행될 수 있도록 구현|
|23.03.10 (금)| DispatchGroup을 사용하여 모든 작업이 끝나는 시점을 추적할 수 있도록 구현|
|23.03.13 (월)| 어떤 객체를 만들고 객체들간의 연관은 어떻게 할 지 토론하며 구상|
|23.03.14 (화)| BankManagerViewController UI 코드로 구현|
|23.03.15 (수)| Notification 등록, 대기중에서 진행 중으로 레이블 옮기는 기능 구현|
|23.03.16 (목)| 타이머 관리 객체 구현, 초기화 버튼 기능구현|
|23.03.17 (금)| UML작성, README 작성|



<br>

## 3. 프로젝트 구조

<details>
    <summary><big>폴더 구조</big></big></summary>

### 콘솔 프로젝트
```` swift
BankManagerConsoleApp
    ├── DataStructure
    │    ├── Node
    │    ├── LinkedList
    |    └── BankManagerQueue
    ├── Protocol
    │    └── BankWorkable
    ├── Bank
    |    ├── BankManager
    |    ├── Bank
    |    ├── Customer
    |    ├── BusinessType
    |    └── BusinessSection
    ├── LinkedListTests
    |    └── LinkedListTests
    └── BankManagerQueueTests
         └── BankManagerQueueTests
````

### UI 프로젝트
```swift
BankManagerUIApp
    ├── Protocol
    │    └── BankWorkable
    ├── Controller
    │    └── BankManagerViewController
    ├── View
    │    ├── ControlPanelStackView
    │    ├── CustomQueueScrollView
    │    └── CustomLabel
    └── Model
         ├── Bank
         │    ├── Bank
         │    ├── BankManager
         │    ├── BusinessType
         │    └── BusinessSection
         ├── DataStructure
         │    ├── Node
         │    ├── LinkedList
         │    └── BankManagerQueue
         ├── Customer
         ├── CustomerGenerator
         ├── NotificationName
         └── BusinessTimer
```


</details>

</br>

<details>
    <summary><big>UML</big></big></summary>
    
**콘솔 프로젝트**

<img src="https://i.imgur.com/8OVh7Ep.png" width="1000">

</br>
</br>

**UI 프로젝트**

<img src="https://i.imgur.com/dofIHdC.png" width="1000">

</details>

</br>


## 4. 실행 화면
### 콘솔 프로젝트

<img src="https://i.imgur.com/KqNpprA.gif" width=400>

</br>

### UI 프로젝트

| 고객 추가 | 일시정지 | 초기화 |
| :--------: | :--------: | :--------: |
| <img src="https://i.imgur.com/cLnfpED.gif" width=250> | <img src="https://i.imgur.com/fjIDLO8.gif" width=250> | <img src="https://i.imgur.com/4an9rMU.gif" width=250> |




</br>

## 5. 트러블 슈팅

### 1️⃣ Command line 프로젝트에서의 유닛테스트

Command line 프로젝트에서 유닛테스트를 하기위해 `@testable import {모듈이름}`을 사용했지만 불러올 수 없었습니다.

이는 GUI 프레임워크, 즉 코코아터치 프레임워크를 기반으로 하는 경우에만 테스트 번들이 작동하기 때문이었습니다. [CommandLine Tool UnitTest](https://developer.apple.com/forums/thread/52211)
따라서 `@testable import`를 사용하지않고 모듈 내 테스트될 파일의 타겟 멤버십을 활성화시킴으로써 문제를 해결했습니다.

<br/>

### 2️⃣ BankManager와 Bank의 역할분리

처음에는 은행이 문을열고 닫는 것이라고 생각해서 BankManager를 사용하지 않고 Bank파일에 은행에 관련된 기능을 담고, main파일에서 은행을 열지말지를 정하는 코드를 작성했습니다.

### 처음 코드
```swift
// main.swift
let bank = Bank()
bank.open()
```
하지만 main파일 내에서 은행을 말지열지를 정하는 것보다 BankManager가 이 행동에 대해 책임을 지는 것이 좋다고 생각했습니다.
따라서 BankManager객체에서 Bank의 인스턴스를 소유해, 사용자의 입력에 따라 Bank를 열지 말지 선택할 수 있게 만들었습니다.

### 변경된 코드
```swift
// main.swift
let bankManger = BankManager()
bankManger.start()

// BankManger.swift
struct BankManager {
    func start() {
        // ...
        let bank = Bank()
        bank.startBusiness()
    }
    
}
```
</br>

### 3️⃣ DispatchSemaphore를 이용한 스레드 제어
업무를 기다리는 고객대기열에서 들어온 순서대로 예금업무 2명, 대출업무 1명의 은행원에게 작업을 배치해야하는 요구사항이 있었습니다.

처음 아이디어는 세 명의 은행원들이 들어온 고객순서대로 작업을 끝내야 하기 때문에 각각 Serial DispatchQueue를 가져, 아래와 같이 작업을 균등하게 분배하려고 했습니다.

```swift
let customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
let depositBanker = Banker()
let depositBanker2 = Banker()
let loanBanker = Banker()

while !customerQueue.isEmpty {
    // ...
}
```

하지만 `customerQueue`에 있는 작업이 예금일때 예금은행원 2명에게 작업을 분배하는 규칙이 모호했고 후에 예금은행원이 늘어나거나 줄어드게 된다면 그 또한 확장성이 떨어진다고 생각했습니다. 

`customerQueue`에 있는 작업들을 예금, 대출로 분류를해서 새로운 큐에 담는 것도 하나의 방법이였지만 이 작업을 위해 두 개의 프로퍼티를 갖고 있어야 한다는 점이 조금 아쉬웠습니다.

#### DispatchSemaphore를 이용해 스레드를 제어하자.

은행원의 수에 의존하지않고 확장적인 방법으로 스레드 수를 제어하는`DispatchSemaphore`를 이용했습니다. 

`init`에서 예금창구에 해당하는 스레드(현재 2명)과 대출창구에 해당하는 스레드(현재 1명)에 대한 부분을 설정해준 뒤 `processJob`메서드를 통해 설정된 세마포어의 개수만큼 동시에 동작할 수 있도록 만들었습니다.

(`BankWorkable`은 프로토콜이며 `BusinessSection`은 이 프로토콜을 준수합니다`)
```swift
// Bank.swift
init() {
    loanSection = BusinessSection(
        queueName: "대출창구",
        businessType: .loan,
        numberOfBankers: 1
    )
    depositSection = BusinessSection(
        queueName: "예금창구",
        businessType: .deposit,
        numberOfBankers: 2
    )
}

// BankWorkable 
func processJob(for customer: Customer, group: DispatchGroup) {
    bankDispatchQueue.async(group: group) {
        self.bankSemaphore.wait()
        print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 시작")
        Thread.sleep(forTimeInterval: customer.consultingTime)
        print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 완료")
        self.bankSemaphore.signal()
    }
}
```

</br>

### 4️⃣ 모든 비동기작업이 끝난 후에 메인 스레드가 동작하도록 제어

#### 코드 수정 전

<img src="https://i.imgur.com/ItBzE71.png" width="400">



- 이전에는 커스텀 디스패치큐에 있는 비동기 작업이 메인 쓰레드의 흐름과 상관없이 동작이 되었습니다. 
- 따라서 모든 작업이 끝나기 전에 사용자 입력을 안내하는 문구가 콘솔에 먼저 출력되었습니다.

#### 코드 수정 후

``` swift
bankDispatchQueue.async(group: group) {
    self.bankSemaphore.wait()
    print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 시작")
    Thread.sleep(forTimeInterval: customer.consultingTime)
    print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 완료")
    self.bankSemaphore.signal()
}
```
- 위와 같이 async 작업에 같은 그룹으로 지정해 주고 `dispatchGroup.wait()` 메서드 호출을 통해 그룹으로 지정한 작업들이 모두 끝날때까지 메인 쓰레드가 기다리도록 제어할 수 있었습니다.

<br>
<br>


### 5️⃣ BusinessSection의 타입에 따른 클로저의 self 캡쳐
- BusinessSection 타입은 실제로 작업을 수행하는 타입입니다.
- 사용자가 초기화 버튼을 눌렀을 때, DispatchQueue에 이미 예약된 작업을 수행하지 않는 기능이 필요했습니다.
- 해당 기능을 다음과 같이 guard 문으로 isWorking 이라는 Bool 타입의 프로퍼티를 검사하여 작업을 수행하지 않고 일찍 종료할 수 있도록 구현하였습니다.

``` swift
bankDispatchQueue.async(group: group, qos: .default) {
    self.bankSemaphore.wait()

    guard self.isWorking else {
        self.bankSemaphore.signal()
        return
    }

    self.notifyStartJob(customer: customer)
    Thread.sleep(forTimeInterval: customer.businessType.consultingTime)
    self.notifyFinishJob(customer: customer)
    self.bankSemaphore.signal()
}
```

#### struct BusinessSection
- self가 struct 타입이고 `isWorking`이라는 프로퍼티가 앱이 실행중인 상태에서 초기화 버튼을 누르게 되면 값이 바뀝니다.
- 따라서 실행 중간에 초기화 버튼을 누르는 시점에서 `DispatchQueue`의 클로저에서 참조하는 self는 isWorking의 값이 바뀐 인스턴스와는 다른 복사된 인스턴스라고 생각했습니다.
- struct 타입일 경우 실행 시간에 isWorking의 값이 바뀌어도 복사된 인스턴스에서만 바뀌는 것이라고 결론 지었습니다.

#### class BusinessSection
- class 타입일 경우 값이 바뀌어도 인스턴스가 복사되거나 하는 일이 없기 때문에 실행 중에 초기화 버튼을 누르면 isWorking의 값이 자유자재로 바뀌는 것을 확인했습니다.

### 결론적으로 실행 중간에 DispatchQueue에 있는 작업들을 일찍 종료하려면 class 타입을 활용하는 것이 맞다고 판단하였습니다.

<br>

### 6️⃣ 초기화 시 bankSemaphore.signal()의 빠른 호출
- 초기화 버튼을 눌렀을 때 디스패치 큐에 대기하고 있는 작업들을 없애주는 작업이 필요했습니다. 
- 설정된 세마포어의 `wait()`을 통과해 `isWorking`변수가 false라면(초기화버튼 을 눌러 타이머를 초기화 시켰다면) 바로 guard문을 통해 `signal()`을 사용하여 활성 가능한 스레드의 수를 1증가시켜주었습니다. 그리고 그 이후 return문을 통해 현재 클로저를 종료하게 만들었습니다.
```swift
func processJob(for customer: Customer, group: DispatchGroup) {
    bankDispatchQueue.async(group: group, qos: .default) {
        self.bankSemaphore.wait()

        guard self.isWorking else {
            self.bankSemaphore.signal()
            return
        }
        
        // isWorking이 true라면 일어나는 작업들
    }
}
```

<br>

### 7️⃣ Notification Center 사용 
- Notification Center를 활용하여 대기중, 작업중 화면에 레이블을 추가 삭제하도록 구현했습니다.
- 한가지 고민했던 문제는 delegate 패턴을 사용할지 여부였습니다.
- delegate 패턴을 사용하게 되면 `BusinessSection > Bank > BankManager > ViewController > StackView` 이러한 경로로 BusinessSection이 ViewController에게 뷰를 업데이트하는 작업을 위임해야하는 구조였습니다.
- 이러한 복잡한 구조로 인해 BusinessSection 타입에 delegate를 전달하려면 BankManager, Bank를 거쳐서 delegate를 지정해줘야하기 때문에 Notification Center를 사용해 문제를 해결하였습니다.


<br>

## 6. 참고 링크
- [Apple Docs - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
- [Apple Docs - Thread.sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [Apple Docs - DispatchSourceTimer](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer)
- [Apple Docs - NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter)
- [CommandLine 유닛테스트](https://developer.apple.com/forums/thread/52211)
- [야곰닷넷 - DispatchGroup](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/lessons/gcd-%ec%8b%ac%ed%99%94/topic/dispatchgroup/)
- [야곰닷넷 - DispatchSemaphore](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/lessons/gcd-%ec%8b%ac%ed%99%94/topic/dispatchsemaphore/)
- [정주는 개발중 - escaping과 weak self](https://jeong9216.tistory.com/471)
- [RunLoop Mode](https://withthemilkyway.tistory.com/59)
- [Cancelling Background Tasks](https://jordansmith.io/cancelling-background-tasks/)
---
