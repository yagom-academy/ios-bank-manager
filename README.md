# 은행 창구 매니저

## 프로젝트 소개
은행 창구 매니저가 되어 고객의 업무를 처리하는 기능을 수행합니다.

> 프로젝트 기간: 2022-06-27 ~ 2022-07-08</br>
> 팀원: [수꿍](https://github.com/Jeon-Minsu), [브래드](https://github.com/bradheo65) </br>
리뷰어: [HARIBO](https://github.com/HARlBO)</br>
그라운드롤: [GroundRule](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step01/Docs/GroundRule.md)

## 📑 목차

- [개발자 소개🧑🏻‍💻🧑🏻‍💻](#개발자-소개)
- [UML📈](#UML)
- [키워드💡](#키워드)
- [핵심경험🤔](#핵심경험)
- [참고문서📚](#참고문서)
- [기능설명📝](#기능설명)
- [TroubleShooting🚀](#TroubleShooting)
- [1️⃣ STEP 1](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step01/Docs/Step01.md)
- [2️⃣ STEP 2](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step02/Docs/Step02.md)

## 개발자 소개🧑🏻‍💻🧑🏻‍💻

|브래드|수꿍|
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174251611-46adf61c-93fa-42a0-815b-2c998af1c258.png" width="250" height="250">| <image src = "https://i.imgur.com/6HkYdmp.png" width="250" height="250">
|[브래드](https://github.com/bradheo65)|[수꿍](https://github.com/Jeon-Minsu)|

## UML📈

### [ClassDiagram]

![image](https://user-images.githubusercontent.com/45350356/176827443-6bf8cc88-075a-4a97-9ca8-62f148e2665e.png)


## 키워드💡

- `UML`
- `Dependency Manager`, `SwitLint`, `CoCoaPods`, `gitignore`
- `TDD`
- `Node`, `LinkedList`, `Queue`
- `Generics`
- `struct`, `class`
- `POP`, `protocol`, `extension`
- `Dependency Injection`
- `CustomStringConvertible`
- `In-Out parameters`
- `Thread`, `sleep(forTimeInterval:)`

## 핵심경험🤔
    
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
    
## 참고문서📚

- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [Swift Language Guide - Subscripts(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
- [Concurrency Programming Guide(선택사항)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [Swift Language Guide - Concurrency(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
- [오토레이아웃 정복하기 - Dynamic Stack View까지 (선택사항)](https://yagom.net/courses/autolayout/)
    
## 기능설명📝
    
### **Customer Queue** 구현을 위한 여러 타입 구현
    - Node
    - LikedList
    - CustomerQueue

### **Bank, Client** 타입 구현 및 콘솔앱 구현
    - Bank
    - BankManager
    - Banker+Protocol
    - Banker+Extension
    - Client
    - Option

## TroubleShooting🚀
    
### STEP 1

#### T1. `SwiftLint적용`
    
같은 프로젝트 내 라이브러리 적용 시 별도의 설정 없이는 `main.swift`만 적용되었는데 
`.swiftlint.yml` 파일에서 어떠한 디렉토리에 라이브러리를 적용할지 설정하고 나서 해결되었다.
- M1 MAC CocoaPods 다운로드
```shell
sudo arch -x86_64 gem install ffi
"${PODS_ROOT}/SwiftLint/swiftlint"
```
- 라이브러리 적용 디렉토리 설정
```shell
included:
  - BankManagerConsoleApp
```

### STEP 2 
    
#### T1. `bank와 bankManager간 의존성 주입`

- 은행 창구 매니저 프로젝트를 통해, `Bank`와 `BankManager`간 의존성 주입 방법에 대하여 고민해보게 되었습니다. 1번 방법은 `Bank` 인스턴스를 생성한 이후, `BankManager`를 초기화할 때, 소속 `bank`를 지정하는 방법이었고, 2번 방법은 `BankManager` 인스턴스를 생성한 이후, `Bank`를 초기화할 때, 소속 `bankManager`를 지정하는 방법이었습니다. 두 방법 모두 설득력이 있었고, 둘 중 어떤 방법을 택해야하는지, 혹여나 두 방법을 모두 사용해야 하는 것인지 고민에 빠졌습니다.

    ```swift
    // 1번 방법
    let bank = Bank()
    let bankmanager = Bankmanager(bank: bank)
    
    // 2번 방법
    let bankmanager = Bankmanager()
    let bank = Bank(bankmanager: bankmanager)
    ```
    
- 고민에 대한 해답을 `Queue`와 `LinkedList`에서 찾을 수 있었습니다. Step1에서 `Queue` 타입 구현을 위한 `Linked-list` 타입을 직접 구현하는 과정에서, `Queue`의 내부 프로퍼티로 `Linked-List`를 가져왔습니다. 이와 비슷하게, `Bank`의 업무를 수행하기 위해서, `BankManager`를 내부 프로퍼티로 가져와, `BankManager`의 메서드를 사용하는 것이, 실제 은행 내에서 은행원을 호출하는 것과 비슷한 관계로 파악하였습니다.

- 이에, 2번 방법을 채택하여 `Bank`의 내부 프로퍼티로 `BankManager`를 구현하는 것이 적절하다 판단을 내렸습니다. 추가로, 의존성 역전 원칙에 따라, 의존성 주입 과정에서 각 모듈이 직접 의존을 갖기 보다는 추상화된 인터페이스를 의존하게 하기 위하여, `Banker`라는 프로토콜을 생성하여 사용해보았습니다. 

--- 
