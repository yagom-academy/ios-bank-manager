# 🏦 은행창구 매니저

## 🍀 소개
> `Dasan`과 `Mary`이 만든 은행창구 매니저입니다.

사용자에게 메뉴를 입력받아 은행 개점 및 업무 처리를 진행합니다.
은행은 은행원의 수만큼 동시에 여러 업무를 처리할 수 있습니다.

- 🎯 핵심 경험 : `Queue`, `Generics`, `Closure`, `GCD`, `Operation`

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [고민했던 점](#-고민했던-점)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

<br>

## 👨‍💻 팀원
| Dasan | Mary |
| :------: | :------: |
|<Img src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/ca103b42-8938-447f-9381-29d0bcf55cac.jpg" width="200"> | <img src="https://i.imgur.com/8mg0oKy.jpg" width="200"> |
|[<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Dasan**](https://github.com/DasanKim) |[<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Mary**](https://github.com/MaryJo-github)

<br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.(월)| - `Node`, `LinkedList`, `Queue` 타입 구현 <br> - `Queue`의 `Unit Test` 추가 |
|2023.07.11.(화)| - `Queue`의 Test Case 추가 <br> - `은행`, `고객`, `은행원`, `콘솔앱`에 대한 초기 설계 진행|
|2023.07.12.(수)| - `Customer`, `BankTeller`, `Bank`, `BankManager` 타입 구현| 
|2023.07.13.(목)| - `폴더 구조` 수정 및 리펙토링 진행 <br> - 각 타입의 `메시지` 출력 설정|
|2023.07.14.(금)| - README 작성 |
|2023.07.17.(월)| - `Node`, `LinkedList`, `Queue` 타입 구현 <br> - `Queue`의 `Unit Test` 추가 |
|2023.07.18.(화)| - `KWDC` 참석 |
|2023.07.19.(수)| - `BankTeller` 타입을 `BankDepartment` 으로 변경 <br> - `Bank`와 `BankDepartment`에 `GCD`를 이용한 동시성 구현 <br> - 업무시간 계산 로직 수정 <br> - `Openable` 프로토콜 추가 <br> - `BankManager`의 `Unit Test` 추가|
|2023.07.20.(목)| - `Operation`을 이용한 동시성 구현 <br> - `폴더 구조` 수정 및 리펙토링 진행 |
|2023.07.21.(금)| - 피드백 반영 및 전체적인 리펙토링 진행 <br> - README 작성 |

<br>

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p>
<img width="800" src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/24389ba2-e472-41fb-804b-f8141c98a967.jpg">

</p>

<br>

## 💻 실행 화면 

|실행 화면|
|:--:|
|<img src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/3519816f-0bf6-4a45-9420-498aaf235e1f.gif" width="600">|

</br>

## 🧠 고민했던 점

### 1️⃣ GCD로 동시성 구현하기
- `Semaphore`는 `공유 자원` 및 `임계영역(Critical Section)`에 접근할 수 있는 스레드의 수를 제어해주는 역할을 합니다.
- 이에, **Semaphore의 수를 은행원의 수**라고 생각하여 아래와 같이 동시성을 구현하였습니다.
    - 각 은행원들이 고객 대기줄을 `dequeue`하는 것이 아니라 **Bank 타입에서 dequeue한 뒤**, 고객이 받고자하는 서비스에 따라 `담당 부서`에게 고객을 `배정`하였습니다.
    - 그 이후 담당부서에서는 은행원의 수(semaphore의 수)만큼 — `DispatchSemaphore(value: numberOfBankTeller)` — 아래 코드를 비동기적으로 처리하도록 하였습니다.

<details>
<summary><span style="color:blue">코드 보기</span></summary>
<div markdown="1">

```swift
// bank.swift
while let currentCustomer = customerQueue.dequeue() {
  switch currentCustomer.service {
  case .deposit:
      depositDepartment.takeOnTask(for: currentCustomer,
                                   startHandler: printStartMessage,
                                   completionHandler: printFinishMessage)
  case .loan:
      loanBankDepartment.takeOnTask(for: currentCustomer,
                                    startHandler: printStartMessage,
                                    completionHandler: printFinishMessage)
  }
}
```
```swift
// BankDepartment.swift
init(responsibility: BankingService, numberOfBankTeller: Int, group: DispatchGroup) {
  (...)
  self.semaphore = DispatchSemaphore(value: numberOfBankTeller)
  (...)
}

func takeOnTask(for customer: Customer,
              startHandler: @escaping (Customer) -> Void = { _ in },
              completionHandler: @escaping (Customer) -> Void = { _ in }) {
  departmentQueue.async(group: group) {
      semaphore.wait()
      startHandler(customer)
      work()
      completionHandler(customer)
      semaphore.signal()
  }
}
```
</div>
</details>
    
<br>

## 🧨 트러블 슈팅

### 1️⃣ Command Line Tool 프로젝트의 Unit Test

⚠️ **문제점** <br>
- `unit test target`을 생성하고, `test plan`에 해당 test target을 추가한 후 실행하였을 때, 다음과 같은 오류가 발생하였습니다.

   <img width="300" src="https://github.com/yagom-academy/ios-bank-manager/assets/106504779/d5dd94b2-d4b7-4d63-bbca-5d24777795e9">

✅ **해결방법** <br>
- 이는 `BankManagerConsoleApp` 내부의 파일들을 인식하지 못하여 나타났던 문제로, 해결하려면 테스트하고 싶은 파일들에 대해 `Target Membership`을 설정해주어야 합니다.
- 아래와 같이 `Target Membership에서 QueueTests`에 체크해줌으로써 오류를 해결하였습니다.
- 이번 프로젝트가 `CLI 환경`에서 진행되기에 `Target Membership`에 `테스트용` target을 추가하였지만, 본래 `호스트용` target과 `테스트용` target은 분리되어야하므로 이 방법은 `Unit Test`를 수행할 때 권장되는 방법이 아님을 유념해야합니다.

  <img width="300" alt="2023-07-10_10 02 17" src="https://github.com/yagom-academy/ios-bank-manager/assets/106504779/46e1cbb2-9e6c-4acc-8678-397404b97fa2">


<details>
<summary> 왜 CLI(Command-Line Interface)환경에서 테스트를 위해 Target Membership에 추가하는 행위 없이 타겟을 찾지 못하는가? </summary>
    
 - 프로세스 내에서 테스트 번들을 load하는 기계는 프로세스가 `Cocoa` 또는 `Cocoa Touch`와 같은 `GUI` 프레임워크를 기반으로 하는 경우에만 작동하기 때문입니다. 
 - `Command Line Tool`은 일반적으로 `GUI` 프레임워크를 사용하지 않으므로 **테스트 머신이 해당 도구에 번들을 로드할 수 없습니다.**

</details>

<br>

### 2️⃣ escaping closure

⚠️ **문제점** <br>
- 비동기 task를 정의한 `takeOnTask`메서드에서 startHandler 및 completionHandler에 escaping 키워드를 붙이지 않으면 다음과 같은 오류가 발생하였습니다.

   <img width="536" alt="2023-07-20_11 00 07" src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/2f997b63-063c-43e5-964c-c2b3f4c5f441">

- 해당 오류에 대한 원인 분석을 진행해보았습니다.
    - 현재 task는 비동기로, DispatchQueue에 작업만 넘기고 실제 작업은 언제 시작될 지 모릅니다. (시스템에서 자동으로 관리)
    - 만약 두 handler에 escaping 키워드를 붙이지 않으면 non-escaping closure가 되는데, 이는 함수의 실행이 종료되기 전에 무조건 closure의 실행이 완료되어야 합니다.
    - 하지만 startHandler와 completionHandler는 비동기 task 코드블럭 안에 위치하기 때문에 `takeOnTask` 함수가 종료된 후에도 실행될 가능성이 있습니다.

✅ **해결방법** <br>
- closure에 escaping 키워드를 붙여서 함수의 실행이 종료된 후에도 실행될 수 있도록 설정해줌으로써 해당 오류를 해결하였습니다.

    > **Closure**
    > - non-escaping closure
    >   - 함수의 실행이 종료되기 전에 실행되는 클로저
    > - escaping closure (`@escaping`)
    >   - 함수의 실행이 종료된 후에도 실행될 수 있는 클로저 

<br>

### 3️⃣ Bank 의존성 주입
⚠️ **문제점** <br>
- BankManager에서 Bank타입의 인스턴스를 만들어서 활용하기 때문에 MockBank를 이용해야하는 BankManager 테스트 시 어려움이 있었습니다.

    <details>
    <summary><span style="color:blue">코드 보기</span></summary>
    <div markdown="1">
        
    ```swift
    struct BankManager {
        mutatin func runProgram() {
            var bank: Bank = createBank()
            ...
        }

        private func createBank() -> Bank {
            let randomNumber = generateRandomNumber()

            return Bank(numberOfCustomer: randomNumber)
        }
        ...
    }
    ```
    </div>
    </details>
        
✅ **해결방법** <br>
- 다음과 같은 방법을 이용하여 `Bank`와 `BankManger`의 의존성을 없애고 Unit test가 용이한 형태로 변경해주었습니다.
    - `BankManager` 타입에서 Bank 인스턴스 생성하는 것 대신 Bank 타입을 주입받는 형태로 변경하였습니다.
    - Openable 프로토콜을 생성하고 Bank 타입이 채택하도록 만들어주었습니다.

    <details>
    <summary><span style="color:blue">코드 보기</span></summary>
    <div markdown="1">
        
    ```swift
    protocol Openable {
        mutating func open(numberOfCustomer: Int)
    }

    struct Bank: Openable {
        mutating func open(numberOfCustomer: Int) { ... }
    }

    struct BankManager {
        var bank: Openable

        init(bank: Openable) {
            self.bank = bank
        }

        ...
    }
    ```
    </div>
    </details>
    
<br>

### 4️⃣ Enumeration의 rawValue와 property
- 콘솔창에서 `입력받은 값`을 구분하기 위하여 `Menu Enumeration`을 사용하였습니다. `Enumeration`을 활용하는 여러가지 방법 중, `rawValue`와 `property`를 활용하는 방법에 대하여 고민을 하였습니다. 입력값 1과 2가 무엇을 뜻하는지 알 수 있도록 표현하기 위하여 `property`를 활용하는 방법을 선택하였습니다.

⚠️ **문제점** <br>
- **enum의 rawValue 활용**
    - `rawValue`를 통하여 `Menu 인스턴스`를 생성하여, 1과 2 이외의 입력값에 대하여 `guard`문의 `else`에서 예외를 처리합니다.
    - 입력된 숫자와 Menu의 case값을 맞추기 위하여 각 `rawValue`에 1과 2를 할당하였습니다.
    - 하지만 아래와 같이 작성하면 `rawValue`가 `메뉴 번호`를 나타내는 것인지 **직관적으로 알기 힘들다는 단점**이 있었습니다.

    <details>
    <summary><span style="color:blue">코드 보기</span></summary>
    <div markdown="1">
        
    ```swift 
    // 입력 처리하는 부분
    guard let inputValue = readLine(),
          let inputValue = UInt(inputValue),
          let menu = Menu(rawValue: inputValue) else {
        continue
    }

    switch menu {
    case Menu.bankOpening:
        bank.open()
    case Menu.quit:
        isContinue = false
    }

    // Menu
    private enum Menu: UInt {
        static let message: String = "1 : 은행 개점\n2 : 종료\n입력 : "

        case bankOpening = 1
        case quit = 2
    }

    ```
    </div>
    </details>

✅ **해결방법** <br>
- **enum의 property 활용**
    - 위의 한계를 극복해보고자 `enum` 내에 `number`라는 `property`를 생성하여, 입력되는 값이 메뉴 번호임을 알 수 있도록 나타내었습니다.
    - 1과 2 이외의 입력값에 대한 처리는 `switch`문의 `default`에서 처리합니다.

    <details>
    <summary><span style="color:blue">코드 보기</span></summary>
    <div markdown="1">
    
    ```swift
    // 입력 처리하는 부분
    guard let inputValue = readLine() else {
        continue
    }

    switch inputValue {
    case Menu.bankOpening.number:
        bank.open()
    case Menu.quit.number:
        isContinue = false
    default:
        continue
    }

    // Menu
    private enum Menu {
        static let message: String = "1 : 은행 개점\n2 : 종료\n입력 : "

        case bankOpening 
        case quit

        var number: String {
            switch self {
            case .bankOpening:
                return "1"
            case .quit:
                return "2"
            }
        }
    }
    ```
    </div>
    </details>

<br>

## 📚 참고 링크
- [🍎 Apple Docs: enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations#Initializing-from-a-Raw-Value)
- [🌐 Apple forums: How do I unittest a command line application?
](https://developer.apple.com/forums/thread/52211)
- [🌐 Blog: How to Unit Test Swift CLI applications in XCode](https://dev.to/sokol8/how-to-unit-test-cli-application-in-swift-5f5o#solution-1)
- [🌐 Wikipedia: Magic number](https://en.wikipedia.org/wiki/Magic_number_(programming))


<br>

## 👥 팀 회고
### 칭찬할 부분
- 
- 
