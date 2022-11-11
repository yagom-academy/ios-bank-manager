# 은행창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

|Gundy|jpush|
|:-:|:-:|
|<img src="https://i.imgur.com/od5Wj9n.png" width = 300/>|<img src="https://avatars.githubusercontent.com/u/82566116?v=4" width = 300/>|

`Gundy`와 `jpush`의 iOS 은행창구 매니저 프로젝트입니다.

- **핵심적으로 다뤄본 기술**
    - OpenSource
    - POP
    - TDD
    - NameSpace
    - Operation
    - DispatchQueue

## 📆 타임라인

<details>
<summary>STEP 1</summary>

221101 
    
- LinkedList, Node, BankcustomerQueue 생성
- BankcustomerQueue 타입 내부 stub 구현
    - enqueue, dequeue, isEmpty, peek, clear   
- LinkedList 내부 stub 구현
    - head, tail, pushLast, popFirst, clear, peek, isEmpty
- UnitTest 작성
</details>

<details>
<summary>STEP 1 Feedback 반영</summary>

221103
    
- 테스트 케이스 추가
- Queue의 Generic 설정
</details>

<details>
<summary>STEP 2</summary>

221104
    
- STEP 1에서 구현한 BancCustomerQueue를 SPM으로 제작하여 프로젝트에 추가
- BankCustomer 생성
- BankProtocol 생성
- Bank 생성 및 구현
    - BankProtocol 채택
    - 메서드 구현
        - open, floatingMenu, work, close, init
    - 중첩타입으로 Constant 구현
</details>
 
<details>
<summary>STEP 2 Feedback 반영</summary>

221108
    
- 내부 Constant 타입을 enum 에서 struct로 변경 및 CustomerType 추가
- open 메서드의 네이밍 변경 및 기능을 쪼개서 분리
</details>
<details>
    
<summary>STEP 3</summary>

221108
    
- 예금 업무를 처리하는 deposit() 메서드 구현
- 업무 마감 후 초기화 시키는 configure 메서드 구현
- 대출 업무를 처리하는 loan() 메서드 구현
</details> 

## 👀 시각화된 프로젝트 구조

### TREE

```
├── BankManagerConsoleApp
│   ├── Bank
│   │   ├── Bank.swift
│   │   ├── BankCustomer.swift
│   │   ├── CustomerType.swift
│   │   ├── BankProtocol.swift
│   │   └── BankDesk.swift
│   └── main.swift
├── BankManagerConsoleAppTests
│   ├── BankCustomerTests.swift
│   └── BankManagerConsoleAppTests.swift
└── BankCustomerQueueModule
    ├── DataStructure
    │   ├── BankCustomerQueue.swift
    │   ├── LinkedList.swift
    │   └── Node.swift
    └── Protocols
        ├── List.swift
        └── Queue.swift
```

### 실행 로직
![](https://i.imgur.com/TBmcoQz.png)

CustomerQueue에 고객을 담고
각 타입별로 deposit과 loan으로 나누어 준 뒤
타입의 CustomerQueue에서 DispatchQueue.global.async로 Task를 실행해줍니다.

각각의 DispatchQueue는 하나의 그룹에 넣어서 그룹이 다 끝날 때까지 기다린 후 업무 마감 메세지를 출력하도록 구성했습니다.

## 💻 실행 화면


| 동기로 실행되는 화면 | 비동기로 실행되는 화면 |
|:--:|:--:|
|![](https://i.imgur.com/Uv04ICE.gif)|![](https://i.imgur.com/GbOgG0K.gif)|


## ❓ 트러블 슈팅

### Equatable
<details>
<summary>자세히</summary>
Queue에서 꺼낸 Queueable 타입의 값을 Equatable을 채택해주어 비교할 수 있도록 하고 싶었습니다.

![](https://i.imgur.com/VoYAGwz.png)

이부분을 해결하기 위하여 찾아보니 내부 요소인 Queueable 타입에 Equatable인 타입이 들어올 수 있도록 처리를 해 주었으나 잘 해결되지 않았고 직접적으로 Queue의 타입을 지정해주어서 출력되는 값이 String, Int 같은 Equatable 이 채택된 타입의 값을 받을 수 있도록 처리해서 해결해주었습니다.

![](https://i.imgur.com/C1wMhZ5.png)
</details>

### 오픈소스 제작
<details>
<summary>자세히</summary>
STEP 1에서 구현한 제네릭 타입을 지원하는 Queue를 오픈소스로 제작하기 위해 Swift Package Manager를 사용하였습니다. 오픈소스를 제작하고 나서 프로젝트에 적용하고 커밋을 하면 해당 커밋을 pull한 다른 사람들도 패키지가 적용된 상태로 바로 사용할 수 있을 줄 알았습니다. 

하지만 적용한 사람 이외에는 사용할 수도 없었고, 같은 패키지를 추가하여 사용할 수도 없었습니다. 이미 추가되어있는 패키지라서 추가할 수 없다는 멘트였습니다. 이 문제를 해결하기 위해 프로젝트 폴더도 뒤져봤지만 패키지는 프로젝트 폴더에 저장되지 않았고, 더 알아본 결과 Xcode 폴더 내부에서 발견할 수 있었습니다. 해당 파일을 삭제하는 것도 정답은 아니었는데, Xcode 프로젝트 상에서 해당 패키지를 resolve 하는 것으로 해결하였습니다.
</details>

### DispatchGroup
<details>
<summary>자세히</summary>
STEP 3에서 비동기 작업을 구현하면서 DispatchQueue를 활용했습니다. 이를 적용하면서 각각의 예금업무와 대출업무가 모두 마무리 된 이후에 업무 마감 안내문구를 출력해야하기 때문에 예금업무 대기열과 대출업무 대기열을 그룹으로 만들어 `wait()`을 사용하였습니다. 하지만 작업이 끝날 때까지 기다리는 경우도, 기다리지 않는 경우도 임의로 발생해 문제가 되었습니다. 저희가 그룹에 작업을 추가하기 위해 `enter()`와 `leave()` 메서드를 사용한 부분에서 문제가 된 것이라고 생각해, task를 추가할 때 group을 매개변수로 받아서 그룹에 추가하였습니다. 그렇게 해서 너무 빠른 속도로 코드가 진행돼 task가 제대로 수행되기 전에 다음 코드가 실행되는 것을 막았습니다.
</details>
    
### @escaping 메서드의 캡처 리스트
<details>
<summary>자세히</summary>
    
![](https://i.imgur.com/ylgIeiL.png)

비동기로 task를 그냥 보내주는 경우 
`Escaping closure captures mutating 'self' parameter` 의 오류가 발생했습니다.

escaping closure는 mutating 한 parameter를 캡처해야 했습니다.
혹시 함수 바깥에서 실행되다보니 같은 프로퍼티에 접근할 경우 충돌이 발생해서 캡쳐를 해야하는 것일까? 싶었습니다.

![](https://i.imgur.com/mtRCpbD.png)

캡처를 해 주었으나 이번에는 캡처 리스트는 **캡처**되었기 때문에 변할 수 없는 `상수, let`이 되었습니다. 
이것을 해결하기 위해서는 self의 타입이 class 가 되거나 프로퍼티가 외부에서 접근 가능한 타입 프로퍼티가 되어야 했습니다.

class로 변경하지 않고 현 상태인 struct를 유지하며 수정하고 싶었기 때문에 타입프로퍼티로 변경해주었습니다.

![](https://i.imgur.com/Hc4Uorq.png)
</details>
    
## 🔗 참고 링크

- Swift Language Guide
    - [Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
    - [Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
    - [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
    - [Subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
    - [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
- WWDC
    - [Concurrent Programming With GCD in Swift 3 (WWDC 2016)](https://developer.apple.com/videos/play/wwdc2019/257/)
- Apple Developer Documentation
    - [Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- 야곰닷넷
    - [오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)

---

[🔝 맨 위로 이동하기](#은행창구-매니저)
