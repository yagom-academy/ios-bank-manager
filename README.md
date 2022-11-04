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
![](https://i.imgur.com/cLE7jxL.jpg)


### 🌲 Tree
```
.
└── BankManagerConsoleApp/
    ├── Models/
    │   ├── Bank.swift
    │   ├── BankManager.swift
    │   └── Customer.swift
    ├── Extensions/
    │   └── Decimal+Extension.swift
    ├── main.swift
    ├── Node.swift
    ├── LinkedList.swift
    └── Queue.swift
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
    - https://stackoverflow.com/questions/32008403/no-such-module-when-using-testable-in-xcode-unit-tests
    - https://levenshtein.tistory.com/396
    - https://woongsios.tistory.com/162
#### 해결방안
-  Target Membership을 통한 UnitTest를 진행함

---


## 📖 참고 링크
**공식문서**
[Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
[Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)

**트러블 슈팅**
["No such module" when using @testable in Xcode Unit tests](https://stackoverflow.com/questions/32008403/no-such-module-when-using-testable-in-xcode-unit-test)
[[iOS] could not find module for target 'x86_64-apple-ios-simulator' found arm64.. 오류 해결법](https://levenshtein.tistory.com/396)
[Commandline-tool 에서 Unit 테스트 환경 구축하기](https://woongsios.tistory.com/162)

[🔝 맨 위로 이동하기](#-은행창구-매니저-)
