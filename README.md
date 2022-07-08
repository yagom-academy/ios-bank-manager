# 🏦 은행 창구 매니저

## 🙋🏻‍♂️ 프로젝트 소개
은행 창구 매니저가 되어 고객의 업무를 처리하는 기능을 수행합니다.

> 프로젝트 기간: 2022-06-27 ~ 2022-07-08</br>
> 팀원: [수꿍](https://github.com/Jeon-Minsu), [브래드](https://github.com/bradheo65) </br>
리뷰어: [HARIBO](https://github.com/HARlBO)</br>
그라운드롤: [GroundRule](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step01/Docs/GroundRule.md)

## 📑 목차

- [🧑🏻‍💻🧑🏻‍💻 개발자 소개](#-개발자-소개)
- [📈 UML](#-UML)
- [💡 키워드](#-키워드)
- [🤔 핵심경험](#-핵심경험)
- [📚 참고문서](#-참고문서)
- [📝 기능설명](#-기능설명)
- [🚀 TroubleShooting](#-TroubleShooting)
- [1️⃣ STEP 1](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step01/Docs/Step01.md)
- [2️⃣ STEP 2](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step02/Docs/Step02.md)
- [3️⃣ STEP 3](https://github.com/Jeon-Minsu/ios-bank-manager/tree/step03/Docs/Step03.md)

## 🧑🏻‍💻🧑🏻‍💻 개발자 소개

|브래드|수꿍|
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174251611-46adf61c-93fa-42a0-815b-2c998af1c258.png" width="250" height="250">| <image src = "https://i.imgur.com/6HkYdmp.png" width="250" height="250">
|[브래드](https://github.com/bradheo65)|[수꿍](https://github.com/Jeon-Minsu)|

## 📈 UML

### [ClassDiagram]

![image](https://user-images.githubusercontent.com/45350356/177477755-0da39d92-1941-4c5f-aaa2-3f0f4a5e65ea.png)

## 💡 키워드

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
- `randomElement`
- `CFAbsoluteTime`, `CFAbsoluteTimeGetCurrent`
- `DispatchQueue`, `concurrent`, `sync`, `async`, `closure`, `Thread`
- `DispatchGroup`, `wait`
- `DispatchSemaphore`, `wait`, `signal`, `race condition`
- `return tuple`

## 🤔 핵심경험
    
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 동기(Synchronous)와 비동기(Asynchronous)의 이해
- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x] 스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

## 📚 참고문서

- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [Swift Language Guide - Subscripts(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
- [Concurrency Programming Guide(선택사항)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [Swift Language Guide - Concurrency(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
- [오토레이아웃 정복하기 - Dynamic Stack View까지 (선택사항)](https://yagom.net/courses/autolayout/)
    
## 📝 기능설명
    
### **Customer Queue** 구현을 위한 여러 타입 구현
    - Node
    - LikedList
    - CustomerQueue

### **Bank, Client** 타입 구현 및 콘솔앱 구현
    - BankManagerConsole
    - Bank
    - BankManager
    - Banker+Protocol
    - Banker+Extension
    - Client
    - Option
    
### 시작 메뉴 분리
    - BankManagerConsole  
    - BankManagerConsole+Extension
    
### 다중처리 기능을 위한 동시성 프로그램 구현
    - Bank+Extension
    - DepositBankManager
    - LoanBankManager
    - Banker+Extension
    - Client
    
## 🚀 TroubleShooting
    
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

### STEP 3
    
#### T1. isEmpty 프로퍼티 문제

- `clientQueue`에 있는 모든 고객의 업무를 처리할때까지 은행원의 업무가 계속되도록 코드를 구상해보았습니다. 이에 `clientQueue`의 `isEmpty` 프로퍼티가 `true`가 되기 전까지, `client`를 `dequeue`하기 위하여 `while` 문 안에 집어 넣어보았습니다. 그런데 `breakpoint`를 걸어보니 `while`문의 밖에 쓴, `bankGroup.wait()`, `return numberOfServedClient` 메서드가 호출되지 않는 것을 발견하였습니다. 
- 코드를 전체적으로 다시 검토한 결과, `LinkedList` 구조체의 `isEmpty` 프로퍼티의 구현부가 `head == nil && tail == nil`로 되어 있었습니다. 여기서 `&&` 비교 연산자를 `||` 비교 연산자로 바꾼 결과, 정상적으로 작동하는 것을 확인하였습니다.

#### T2. 동시성 프로그램 구현

- 프로젝트 요구상황에 따라 다중처리를 구현하는 부분에서 애를 많이 먹었습니다. 처음에는 `clientQueue`에서 고객을 `dequeue`하는 기능도 비동기적으로 이루어져야 하니 여기서부터 동시성 프로그램을 구현해보아야 하는 것인가 고민을 하였습니다. 이를 고민해본 결과, `clientQueue`에서 `dequeue`를 하는 작업까지는 기존의 코드 내에서 구현되어도 충분하다고 판단되었고, 주목할 점은 고객의 업무에 따라 예금 고객 대기열(`depositQueue`) 혹은 대출 고객 대기열(`loanQueue`)에 넣은 다음 고객에 대한 은행원의 업무 처리 작업에서 동시성 프로그램을 구현해야 한다는 점이었습니다.
- 이를 간단히 정리하자면, 고객은 원래의 코드에서 진행하던대로 빼서 각각의 `dispatchQueue`에 넣은 다음, 몇개의 `Thread`로, 그리고 동기 혹은 비동기적으로 처리할 지 고민하면 되는 문제였습니다. 우선 `Thread`의 개수는 은행 종업원의 수로 파악하여, 현재 요구사항에는 각각 2명, 1명으로 설정되어 있기도 하고, 추가적으로 종업원의 수를 늘릴 수도 있다고 판단하여, 다중 `thread`를 필요로하기 때문에 `attribute`를 `Concurrent`로 구현해보았습니다.
- 그 다음으로 고객 대기열에서 고객을 어떻게 추출하는 지를 고민해보아야 했습니다. 이 부분이 처음에 가장 잘 이해가 안 되었습니다. 왜냐하면, 전체적인 시점에서 한 은행원이 다른 은행원이 고객을 응대하는 중에도 당연히 자신의 고객이 비었다면 데려와야 한다고 생각하여 비동기로 처리한다고 생각했습니다. 하지만, 은행원 개인의 시점에서 자신의 고객 응대가 끝나기 전에 다른 고객을 데려오지는 않아야 하므로 동기로 처리해야 되지 않을까 의문이 생겼습니다. 동기 혹은 비동기는 서로 상충되어서 하나의 방법만을 선택해야하여 고민이 깊어졌습니다. 
- 고민 결과, `sync`, `async`의 문제는 아래의 화살표처럼 각각의 쓰레드에서의 처리 방식을 의미하는 것이었고, 은행원 개인 시점에서 일이 끝날때까지 다음 고객을 안 데려오는 것은, 기존의 코드블럭의 논리처럼 하나의 일이 끝날때까지 다른 일은 시작하지 않는 기본적인 구조였습니다. 이를 바탕으로, 은행의 다중처리 기능은 동시성 프로그램에 비동기 방식을 통해 구현하였습니다.

- 이미지
    <img width="1093" alt="스크린샷 2022-07-06 오전 11 13 03" src="https://user-images.githubusercontent.com/99063327/177453100-5d7f43b2-20c6-4609-8982-12563ad9b38c.png">

---
