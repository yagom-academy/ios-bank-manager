# 🏦 은행 창구 매니저 🏦

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [파일구조](#-파일구조)
6. [UML](#-UML)
7. [실행화면](#-실행-화면)
8. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
9. [참고링크](#-참고-링크)

<br>

## 👋 소개

추후 작성 예정

<br>

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![macOS](https://img.shields.io/badge/macOS_Deployment_Target-10.15-blue)]()

<br>

## 🧑 팀원
|Ayaan|Dragon|som|
|:---:|:---:|:---:|
|<img src= "https://i.imgur.com/Unq1bdd.png" width ="200"/>|<img src = "https://i.imgur.com/LI25l3O.png" width=200 height=200>| <img src = "https://i.imgur.com/Q2htdu3.png" width=200 height=200>|

<br>

## 🕖 타임라인
- Step 1
    - 2022.10.31
        - Cocoapod을 통한 SwiftLint 적용
        - gitignore 설정
        - Node 구현
            - 양방향 Node
        - Queue 구현
            - LinkedList를 이용하는 Queue
    - 2022.11.01
        - LinkedList 구현
            - 양방향 Node를 이용하는 LinkedList
        - SwiftLint 규칙 설정
        - 리뷰 내용을 바탕으로 전반적인 리펙토링
- Step 2
    - 2022.11.02
        - BankingService 구현
            - BankingService Protocol
                - loan, savingAccount, CreditCardIssuance Struct Type에서 BankingService Protocol 채택
        - Person 구현
            - Person Protocol
                - Banker, Customer Type에서 Person Protocol 채택
        - Banker 구현
            - 고객의 업무를 처리해주는 역활
        - Customer 구현
            - 은행 업무를 소유하고 있는 Type
        - Bank 구현
            - 은행업무에 대한 역활
        - Console 구현
            - console에 대한 역활
        - BankServiceMaker 구현
            - 임의의 BankingService를 생성해서 반환해주는 역활

<br>

## 💾 파일구조
```
[BankManager]
 ├── BankManager.swift
 ├── README.md
 ├── BankManagerConsoleApp
 │   ├── BankManagerConsoleApp.xcodeproj
 │   ├── BankManagerConsoleApp.xcworkspace
 │   ├── Podfile
 │   ├── Podfile.lock
 │   ├── BankManagerConsoleApp
 │   │   ├── main.swift
 │   │   ├── Console.swift
 │   │   ├── Bank.swift
 │   │   ├── Person
 │   │   │   ├── Person.swift
 │   │   │   ├── Banker.swift
 │   │   │   └── Customer.swift
 │   │   ├── BankingService
 │   │   │   ├── BankingService.swift
 │   │   │   ├── BankingServiceMaker.swift
 │   │   │   ├── CreditCardIssuance.swift
 │   │   │   ├── Loan.swift
 │   │   │   └── SavingAccount.swift
 │   │   └── Queue
 │   │       ├── Queue.swift
 │   │       ├── LinkedList.swift
 │   │       └── Node.swift
 │   ├── NodeTests
 │   │   └── NodeTests.swift
 │   ├── LinkedListTests
 │   │   └── LinkedListTests.swift
 │   ├── QueueTests
 │   │   └── QueueTests.swift
 │   └── Pods
 │       ├── Pods.xcodeproj
 │       ├── Manifest.lock
 │       ├── Headers
 │       ├── SwiftLint
 │       │   ├── swiftlint
 │       │   └── LICENSE
 │       └── Target Support Files
 │           ├── Pods-BankManagerConsoleApp
 │           │   ├── Pods-BankManagerConsoleApp-acknowledgements.markdown
 │           │   ├── Pods-BankManagerConsoleApp-acknowledgements.plist
 │           │   ├── Pods-BankManagerConsoleApp-dummy.m
 │           │   ├── Pods-BankManagerConsoleApp-Info.plist
 │           │   ├── Pods-BankManagerConsoleApp-umbrella.h
 │           │   ├── Pods-BankManagerConsoleApp.debug.xcconfig
 │           │   ├── Pods-BankManagerConsoleApp.modulemap
 │           │   └── Pods-BankManagerConsoleApp.release.xcconfig
 │           └── SwiftLint
 │               ├── SwiftLint.debug.xcconfig
 │               └── SwiftLint.release.xcconfig
 └── BankManagerUIApp
     ├── BankManagerUIApp.xcodeproj
     ├── BankManagerUIApp
     │   ├── AppDelegate.swift
     │   ├── SceneDelegate.swift
     │   ├── ViewController.swift
     │   ├── Info.plist
     │   ├── Base.lproj
     │   │   ├── Main.storyboard
     │   │   └── LaunchScreen.storyboard
     │   └── Assets.xcassets
     │       ├── Contents.json
     │       ├── AppIcon.appiconset
     │       │   └── Contents.json
     │       └── AccentColor.colorset
     │           └── Contents.json
     ├── BankManagerUIAppTests
     │       ├── BankManagerUIAppTests.swift
     │       └── Info.plist    
     └── BankManagerUIAppUITests
             ├── BankManagerUIAppUITests.swift
             └── Info.plist
```

<br>

## 📊 UML
 ![](https://i.imgur.com/5oo2jw7.png)

<br>

## 💻 실행 화면
|정상적으로 실행한 경우|잘못된 숫자를 입력한 경우|
|:---:|:---:|
|<img src = "https://i.imgur.com/UQHDxjI.gif" width=300 height=300>|<img src = "https://i.imgur.com/U4Ofx7a.gif" width=300 height=300>|

<br>

## 🎯 트러블 슈팅 및 고민****
- **pod install🥵**
  - M1 환경에서 pod install 명령어를 실행했을 때, install이 안 되는 오류가 있어 시간이 오래 걸렸습니다.
    ```
    sudo arch -x86_64 gem install ffi
    arch -x86_64 pod install
    pod install
    ```
    해당 명령어를 순서대로 입력하니 제대로 install이 되어 오류를 해결했습니다.

- **딜레이를 주는 방법**
  - 처음에 `sleep()` 메서드로 구현하려고 했으나, 0.7이 `Double` 타입인 관계로 구현하지 못 했습니다. `asyncAfter`로 구현해볼까 고민도 했지만, 아직 동시성 프로그래밍을 적용하지 않은 관계로, `usleep()` 메서드로 구현하게 되었습니다.
  - `usleep()`의 정수는 micro초로 나타내기 때문에, 70000이라는 값을 넣어주어 구현했습니다.

- **UML 설계**
  - UML 설계가 익숙하지 않아 코드 작성전에 미리 설계해본 UML과 코드를 작성하며 요구사항에 맞추다보니 UML 구조를 드문드문 변경하게 되었습니다.

- **오버 엔지니어링**
  - 과도하게 추상화를 했으며, 이로 인해 오버 엔지니어링을 하게 되는 문제가 발생했습니다.
  - 요구사항에 충족하게 추상화를 진행하여 해당 문제를 해결하였습니다.

<br>

## 📚 참고 링크
- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) <br>
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html) <br>
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
