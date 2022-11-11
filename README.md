# 은행창구 매니저 🏦

## 📖 목차

1. [소개](#-소개)
2. [프로젝트 구조](#-프로젝트-구조)
3. [구현 내용](#-구현-내용)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅 & 어려웠던 점](#-트러블-슈팅-&-어려웠던-점)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`애종`, `stone`의 은행 창구 매니저 앱입니다.

- KeyWords
    - Cocoapods
        - swiftLint
    - 동기(Synchronous)와 비동기(Asynchronous)
    - GCD, operation
    - thread
    - Queue
    - LinkedList


## 🛠 프로젝트 구조
### 📊 UML
![](https://i.imgur.com/n1OsnKj.jpg)



### 🌲 Tree
```
.
└── BankManagerConsoleApp/
    ├── Controller.swift/
    │   └── main.swift
    ├── Namespace/
    │   └── Namespace.swift
    └── Models/
        ├── Queue/
        │   ├── Node.swift
        │   ├── LinkedList.swift
        │   └── Queue.swift
        ├── Protocols/
        │   ├── Workable.swift 
        │   └── Customer.swift
        ├── Extensions/
        │   └── Double+Extension.swift
        ├── Bank.swift
        ├── BankCustomer.swift
        ├── BankManager.swift
        └── WorkType.swift
```
## 📌 구현 내용

>은행에 고객들이 번호표를 뽑고 기다리는 것을 `Queue`로 구현
>- `Queue`는 `LinkedList`로 구현
>
>은행의 직원(Manager)는 한명, `Queue`의 고객들에게 순차적으로 한명씩 서비스 제공 후 업무 마감
#### .swiftlint.yml -> disabled_rules
- `trailing_whitespace` : 코드 뒤에 공백이 존재하면 warning을 표출하지 않기 위해 추가
- `redundant_discardable_let` : 테스트 코드에서 dequeue작업을 수행하는 반복문에서 반환 값을 사용하지 않기 위해 추가
- `line_length` : print문을 출력하는 곳에서 120개의 문자를 넘길 수 있도록 하기 위해 추가

#### Decimal+Extension -> doubleValue 연산프로퍼티
- `Decimal` 타입의 값을 `NSDecimalNumber`클래스를 이용해서 `Double`값을 리턴해주는 연산 프로퍼티
#### 비동기처리를 위한 DispatchGroup, DispatchSemaphore, DispatchQueue
- `private let group: DispatchGroup`
    - 예금과 대출을 DispatchGroup으로 묶어줌으로써 `wait()`함수를 통하여 모든 작업이 끝나고 다음 코드를 실행할 수 있도록 그룹처리하기 위해 사용했습니다.
- `private let semaphore: DispatchSemaphore`
    - 예금의 경우 2명의 은행원이 처리해야한다는 로직을 사용하기 위해 예금 작업을 보내는 글로벌 큐에서 쓰레드의 제한을 주기위해서 `DispatchSemaphore(value: 2)`의 값으로 선언하여 사용했습니다.
- `private let loanQueue: DispatchQueue`
    - 대출 업무의 경우 한번에 한개의 업무만 진행해야해서 직렬 큐를 통해 처리했습니다.
- `private let depositQueue: DispatchQueue`
    - 예금 업무를 처리할 때 2개의 업무를 처리할 수 있도록 `attribute` 값을 `.concurrent`로 선언하였습니다.


## 📱 실행 화면
<img src="https://i.imgur.com/hJDg4bb.gif" width="600px"/>




## ⏰ 타임라인


<details>
<summary>Step1 타임라인</summary>
<div markdown="1">       

- **2022.11.01**
    - CocoaPods `SwiftLint`추가 
    - `Node`, `Queue`, `LinkedList` 구현
</div>
</details>

<details>
<summary>Step2 타임라인</summary>
<div markdown="1"> 
    
- **2022.11.02**
    - `Bank`, `Customer`, `BankManager` 구조체 구현 
    - `Lint` 규칙 `redundant_discardable_let` 추가 
    - `Decimal extension - doubleValue` 연산프로퍼티 구현    
- **2022.11.03**
    - `Lint` 규칙 `line_length` 추가 
    - `Bank` 구조체 리팩토링
- **2022.11.04**
    - `Bank` 접근 제어자 수정, Extension 파일분리
- **2022.11.07**
    - `Namespace` 추가, Bank 내부 함수 분리
    - 'Customer`, `Workable' 프로토콜 추가
        - 프로토콜 추가에 따른 리팩토링
</div>
</details>
<details>
<summary>Step3 타임라인</summary>
<div markdown="1">       

- **2022.11.08**
    - `Customer` -> `BankCustomer` 네이밍 변경, `WorkType` enum타입 추가
    - `DispatchGroup`과 `DispathSemaphore`를 활용한 비동기 작업 추가
- **2022.11.09**
    - `DispatchSemaphore.wait()`구문 비동기 함수 내부로 이동
    - 예금, 대출에 따른 delay `Namespace` 추가
    - 폴더구조 정리
- **2022.11.10**
    - `DispatchQueue.global()`로 사용하는 글로벌 큐를 label에 따른 커스텀 큐로 구현 및 depositQueue 변수에 할당
</div>
</details>

## ❓ 트러블 슈팅 & 어려웠던 점

### `@testable import` 키워드
<img src="https://i.imgur.com/wjpVfQ5.png" width="600px"/>

#### 문제점
UnitTest를 진행하기 위해 `@testable import`를 사용하려 했으나 아래 오류들로 인해 진행하지 못했음
- `Could not find module for target 'x86_64-apple-macos'; found: arm64-apple-macos`
- `No such Module`
- 아래 자료를 통해 해결하고자 했으나, 해결하지 못했음
    - ["No such module" when using @testable in Xcode Unit tests](https://stackoverflow.com/questions/32008403/no-such-module-when-using-testable-in-xcode-unit-test)
    - [[iOS] could not find module for target 'x86_64-apple-ios-simulator' found arm64.. 오류 해결법](https://levenshtein.tistory.com/396)
    - [Commandline-tool 에서 Unit 테스트 환경 구축하기](https://woongsios.tistory.com/162)

#### 해결방안
- XCode 업데이트를 통해 해결할 수 있었음.
~~- Target Membership을 통한 UnitTest를 진행함~~
###  `semaphore.wait()` 호출 위치

#### 문제점
아래 코드와 같이 비동기함수 외부에 `wait()`함수를 호출하여 진행할 경우, 예금 창구가 꽉 차고 다음 고객의 목적도 예금일 경우 async외부 에서 wait()에 걸려 semaphore에서 signal() 되기 전까지 멈추게 됩니다.
```swift
switch customer?.purpose {
case .deposit:
    /* ***** wait()위치 ***** */
    semaphore.wait()
    DispatchQueue.global().async(group: group) { [self] in
        self.manager.provideService(to: customer)
        semaphore.signal()
    }
case .loan:
    loanQueue.async(group: group) { [self] in
        self.manager.provideService(to: customer)
    }
default:
    break
}
```
#### 해결방안
아래코드처럼 `semaphore.wait()`을 비동기 함수 내부에서 호출주었습니다. wait하더라도 async로 넘겨주고 기존 코드는 진행되기 때문에 뒤에 대출을 원하는 고객이 있을 경우 정상적으로 업무를 할당해 줄 수 있었습니다.
```swift
switch customer?.purpose {
case .deposit:
    DispatchQueue.global().async(group: group) { [self] in
        /* ***** wait()위치 ***** */
        semaphore.wait()
        self.manager.provideService(to: customer)
        semaphore.signal()
    }
case .loan:
    loanQueue.async(group: group) { [self] in
        self.manager.provideService(to: customer)
    }
default:
    break
}
```
---


## 📖 참고 링크

### 공식문서
[Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

[Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)

### 트러블 슈팅 - `@testable import`에 대한 문서들

["No such module" when using @testable in Xcode Unit tests](https://stackoverflow.com/questions/32008403/no-such-module-when-using-testable-in-xcode-unit-test)

[[iOS] could not find module for target 'x86_64-apple-ios-simulator' found arm64.. 오류 해결법](https://levenshtein.tistory.com/396)

[Commandline-tool 에서 Unit 테스트 환경 구축하기](https://woongsios.tistory.com/162)

---

[🔝 맨 위로 이동하기](#-은행창구-매니저-)
