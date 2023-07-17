# 🏦 은행창구 매니저

## 🍀 소개
> `Dasan`과 `Mary`이 만든 은행창구 매니저입니다.

사용자에게 메뉴를 입력받아 은행 개점 및 업무 처리를 진행합니다.
은행은 은행원의 수만큼 동시에 여러 업무를 처리할 수 있습니다.

- 🎯 핵심 경험 : `Queue`, `Generics`

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

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

<br>

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p>
<img width="800" src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/603c6963-ec30-4f05-8eff-519207e3b469.jpg">

</p>

<br>

## 💻 실행 화면 

|실행 화면|
|:--:|
|<img src="https://github.com/DasanKim/ios-bank-manager/assets/106504779/454afaa7-a01f-4dc8-b729-c2a9bf58aa79.gif" width="500">|

</br>

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

### 2️⃣ Enumeration의 rawValue와 property
콘솔창에서 `입력받은 값`을 구분하기 위하여 `Menu Enumeration`을 사용하였습니다. `Enumeration`을 활용하는 여러가지 방법 중, `rawValue`와 `property`를 활용하는 방법에 대하여 고민을 하였습니다. 입력값 1과 2가 무엇을 뜻하는지 알 수 있도록 표현하기 위하여 `property`를 활용하는 방법을 선택하였습니다.

⚠️ **문제점** <br>
 - **enum의 rawValue 활용**
    - `rawValue`를 통하여 `Menu 인스턴스`를 생성하여, 1과 2 이외의 입력값에 대하여 `guard`문의 `else`에서 예외를 처리합니다.
    - 입력된 숫자와 Menu의 case값을 맞추기 위하여 각 `rawValue`에 1과 2를 할당하였습니다.
    - 하지만 아래와 같이 작성하면 `rawValue`가 `메뉴 번호`를 나타내는 것인지 **직관적으로 알기 힘들다는 단점**이 있었습니다.

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

✅ **해결방법** <br>
- **enum의 property 활용**
    - 위의 한계를 극복해보고자 `enum` 내에 `number`라는 `property`를 생성하여, 입력되는 값이 메뉴 번호임을 알 수 있도록 나타내었습니다.
    - 1과 2 이외의 입력값에 대한 처리는 `switch`문의 `default`에서 처리합니다.

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

<br>

## 📚 참고 링크
- [🍎 Apple Docs: enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations#Initializing-from-a-Raw-Value)
- [🌐 Apple forums: How do I unittest a command line application?
](https://developer.apple.com/forums/thread/52211)
- [🌐 Blog: How to Unit Test Swift CLI applications in XCode](https://dev.to/sokol8/how-to-unit-test-cli-application-in-swift-5f5o#solution-1)
- [🌐 Wikipedia: Magic number](https://en.wikipedia.org/wiki/Magic_number_(programming))


<br>
