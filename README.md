# 은행창구 매니저

## 📖 목차
1. [소개](#🌱-소개)
2. [타임라인](#📆-타임라인)
3. [시각화된 프로젝트 구조](#👀-시각화된-프로젝트-구조)
4. [실행 화면](#💻-실행-화면)
5. [트러블 슈팅](#❓-트러블-슈팅)
6. [참고 링크](#🔗-참고-링크)

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
    
## 👀 시각화된 프로젝트 구조

### TREE

```
├── BankManagerConsoleApp
│   ├── Bank
│   │   ├── Bank.swift
│   │   ├── BankCustomer.swift
│   │   ├── BankProtocol.swift
│   │   └── Banker.swift
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

## 💻 실행 화면

STEP2 실행화면

![](https://i.imgur.com/Uv04ICE.gif)

## ❓ 트러블 슈팅

### Equatable
Queue에서 꺼낸 Queueable 타입의 값을 Equatable을 채택해주어 비교할 수 있도록 하고 싶었습니다.
![](https://i.imgur.com/VoYAGwz.png)

이부분을 해결하기 위하여 찾아보니 내부 요소인 Queueable 타입에 Equatable인 타입이 들어올 수 있도록 처리를 해 주었으나 잘 해결되지 않았고 직접적으로 Queue의 타입을 지정해주어서 출력되는 값이 String, Int 같은 Equatable 이 채택된 타입의 값을 받을 수 있도록 처리해서 해결해주었습니다.

![](https://i.imgur.com/C1wMhZ5.png)

---
        
### 오픈소스 제작
STEP 1에서 구현한 부분을 오픈소스로 제작하기 위해 Swift Package Manager를 사용하였습니다. 오픈소스를 제작하고 나서 프로젝트에 적용하고 커밋을 하면 해당 커밋을 pull한 다른 사람들도 패키지가 적용된 상태로 바로 사용할 수 있을 줄 알았습니다. 

하지만 적용한 사람 이외에는 사용할 수도 없었고, 같은 패키지를 추가하여 사용할 수도 없었습니다. 이미 추가되어있는 패키지라서 추가할 수 없다는 멘트였습니다. 이 문제를 해결하기 위해 프로젝트 폴더도 뒤져봤지만 패키지는 프로젝트 폴더에 저장되지 않았고, 더 알아본 결과 Xcode 폴더 내부에서 발견할 수 있었습니다. 해당 파일을 삭제하는 것도 정답은 아니었는데, Xcode 프로젝트 상에서 해당 패키지를 resolve 하는 것으로 해결하였습니다.
        
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
