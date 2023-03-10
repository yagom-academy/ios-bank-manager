# 은행창구 매니저 🏦

> 프로젝트 기간: 2023.03.06 ~ 2023.03.17
> 
> 팀원: 👨🏻‍💻[Harry](https://github.com/kak1x), 👨🏻‍💻[brody](https://github.com/seunghyunCheon), 👩🏻‍💻[Christy](https://github.com/christy-hs-lee)
> 
> 소개: GCD기술을 이용해 은행업무를 동시적으로 처리할 수 있게 만든 프로젝트

</br>

## 목차
1. [타임라인](#1-타임라인)
2. [프로젝트 구조](#2-프로젝트-구조)
3. [실행화면](#3-실행-화면)
4. [트러블슈팅](#4-트러블-슈팅)
5. [참고링크](#5-참고-링크)


</br>
<br>

## 1. 타임라인
### 프로젝트 진행 기간
**23.03.06 (월) ~ 23.03.17 (금)** 

| 날짜 | 타임라인 |
| --- | --- |
|23.03.06 (월)| TDD: DataStructure(Node, LinkedList, BankManagerQueue) 정의 |
|23.03.07 (화)| 메인에서 동기로 작업이 한번에 하나씩 동작할 수 있도록 구현|
|23.03.08 (수)| DispatchSemaphore 실습 |
|23.03.09 (목)| 비동기로 작업이 동시에 실행될 수 있도록 구현|
|23.03.10 (금)| DispatchGroup을 사용하여 모든 작업이 끝나는 시점을 추적할 수 있도록 구현|

<br/>
<br>

## 2. 프로젝트 구조

<details>
    <summary><big>폴더 구조</big></big></summary>

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

</details>

</br>

<details>
    <summary><big>UML</big></big></summary>

<img src="https://i.imgur.com/8OVh7Ep.png" width="1000">

</details>

</br>
</br>

## 3. 실행 화면


<img src="https://i.imgur.com/KqNpprA.gif" width=400>

</br>
</br>
</br>

## 4. 트러블 슈팅

### 1️⃣ Command line 프로젝트에서의 유닛테스트

Command line 프로젝트에서 유닛테스트를 하기위해 `@testable import {모듈이름}`을 사용했지만 불러올 수 없었습니다.

이는 GUI 프레임워크, 즉 코코아터치 프레임워크를 기반으로 하는 경우에만 테스트 번들이 작동하기 때문이었습니다. 
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


>
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

## 5. 참고 링크
- [Apple Docs - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
- [Apple Docs - Thread.sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [CommandLine 유닛테스트](https://developer.apple.com/forums/thread/52211)
- [야곰닷넷 - DispatchGroup](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/lessons/gcd-%ec%8b%ac%ed%99%94/topic/dispatchgroup/)
- [야곰닷넷 - DispatchSemaphore](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/lessons/gcd-%ec%8b%ac%ed%99%94/topic/dispatchsemaphore/)
---
