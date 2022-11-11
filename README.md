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

**동시성 프로그래밍을 은행업무에 적용하여 구현하였습니다.**

대출담당 은행원 1명과 예금담당 은행원 2명을 생성한 후 
랜덤으로 예금 또는 대출 업무를 보러온 고객이 추가 되었을 때
고객의 대기순번에 따라 고객의 상태를 대기중/업무중으로 나눠 순차적으로 업무를 처리해줌

<br>

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![macOS](https://img.shields.io/badge/macOS_Deployment_Target-10.15-blue)]()

<br>

## 🧑 팀원
|Ayaan|Dragon|som|
|:---:|:---:|:---:|
|<img src= "https://i.imgur.com/Unq1bdd.png" width ="200"/>|<img src = "https://i.imgur.com/LI25l3O.png" width=200 height=200>| <img src = "https://i.imgur.com/eSlMmiI.png" width=200 height=200>|


<br>

## 🕖 타임라인

### Step 1
- 2022.10.31
    - Cocoapod을 통한 SwiftLint 적용
    - gitignore 설정
    - Node 구현
    - Queue 구현
- 2022.11.01
    - DoublyLinkedList 구현
    - SwiftLint 규칙 설정
    - LinkedList 구현

### Step 2
- 2022.11.02
    - BankingService 구현
    - Person 구현
    - Banker 구현
        - 고객의 업무를 처리해주는 역활
    - Customer 구현
        - 은행 업무를 소유하고 있는 Type
    - Bank 구현
        - 은행업무에 대한 역활
    - Console 구현
        - console에 대한 역활
    - BankServiceMaker 구현
- 2022.11.03
    - Person 삭제
    - BankingService 리펙토링

### Step 3
- 2022.11.04
    - Queue Protocol화
    - CustomerQueue 구현
    - DispatchQueue를 이용해 비동기 구현
- 2022.11.07
    - LinkedList 버그 수정
- 2022.11.08
    - Bank 의존성 주입

### Step 4
- 2022.11.08
    - ButtonStackView 구현
    - BankStateStackView 구현
    - CustomerQueueStackView 구현
        - CustomerScrollView 구현
    - MainStackView 구현
    - 요구사항에 맞게 Main View UI 구성 및 Auto Layout 설정
- 2022.11.09
    - StopWatch 구현
    - '고객 10명 추가' 버튼 기능 구현
    - '초기화' 버튼 기능 구현
    - 업무 완료시 StopWatch Pause 구현
- 2022.11.10
    - StopWatch 리펙토링
    - Banker 기능 분리
    - Main VC 기능 분리


<br>

## 💾 파일구조
```
[BankManager]
 ├── README.md
 ├── BankManagerConsoleApp
 │   ├── BankManagerConsoleApp.xcodeproj
 │   ├── BankManagerConsoleApp.xcworkspace
 │   └── BankManagerConsoleApp
 │       ├── main.swift
 │       ├── Console.swift
 │       ├── Bank.swift
 │       ├── Person
 │       │   ├── Banker.swift
 │       │   └── Customer.swift
 │       ├── BankingService
 │       │   └──BankingService.swift
 │       └── Queue
 │           ├── Queue.swift
 |           ├── LinkedList.swift
 │           ├── Node.swift
 │           └── CustomerQueue.swift
 |   
 └── BankManagerUIApp
     ├── BankManagerUIApp.xcodeproj
     ├── BankManagerUIApp.xcworkspace
     └── BankManagerUIApp
         ├── Model
         │   ├─ Bank.swift
         │   ├─ BankManager.swift
         │   ├─ CustomerLabelMaker.swift
         │   ├─ NotificationName.swift
         │   ├─ BankingService
         │   │  └── BankingService.swift
         │   ├─ Person
         │   │  ├── Banker.swift
         │   │  ├── Customer.swift
         │   │  └── CustomerSettingDelegate.swift
         │   ├─ StopWatch
         │   │  ├── StopWatch.swift
         │   │  ├── StopWatchDelegate.swift
         │   │  └── TimeCalculator.swift
         │   └─ Queue
         │      ├── CustomerQueue.swift
         │      ├── Queue.swift
         │      ├── LinkedList.swift
         │      └── Node.swift
         ├── View
         │   ├─ MainStackView.swift
         │   ├─ ButtonStackView.swift
         │   ├─ StopWatchLabel.swift
         │   ├─ BankStateStackView.swift
         │   ├─ CustomerScrollView.swift
         │   ├─ CustomerQueueStackView.swift
         │   └─ CustomerLabel.swift
         ├── Controller
         │   └─ MainViewController.swift
         └── Base.lproj
             ├── Main.storyboard
             └── LaunchScreen.storyboard

```

<br>

## 📊 UML
![](https://i.imgur.com/1bSMBYf.jpg)

<br>

## 💻 실행 화면

### Console

|정상적으로 실행한 경우|잘못된 숫자를 입력한 경우|
|:---:|:---:|
|<img src = "https://i.imgur.com/0iPrNZx.gif" width=300 height=300>|<img src = "https://i.imgur.com/dTBGXcj.gif" width=300 height=300>|


### UI

| 업무 진행 후 초기화 | 업무 진행 중 초기화 | 업무 종료 후 다시 업무 진행 |
| :---: | :---: | :---: |
|<img src = "https://i.imgur.com/iVpFsGA.gif" >|<img src = "https://i.imgur.com/RZkST1s.gif">|<img src = "https://i.imgur.com/RxCq0RU.gif" >|

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

- **무작위의 BankingServicce를 가진 상태의 고객들을 어떻게 분리할 것인가**
    - CustomerQueue를 loanQueue, depositQueue 2개로 만들어 고객들을 정렬
      CustomerQueue에서 BankingService에 맞는 가장 빠른 순서를 가진 고객을 dequeueFirst하는 메서드를 추가적으로 구현 
      → Queue의 특성인 FIFO를 고려하여 1번이 더 적절하다고 판단하여 구현하였습니다.

- **Completion 사용**
    - DispatchQeueue의 global()에서 async로 은행원이 업무를 처리한 후 다음 업무를 어떻게 처리해야할지 많은 고민을 했습니다.
        1. Delegate와 같은 패턴을 사용하여서 은행원이 업무가 끝나면 끝났음을 알리고 다음 고객을 전달받는 방식
        2. Completion으로 @escaping 클로저를 통해서 업무가 끝난 후 다음 작업을 이어서 수행하는 방식
    - Completion을 통해서 하나의 Task가 종료된 후 다음 Task를 이어서 수행하도록 구현하여 업무가 이어져서 처리되게 구현했습니다.

- **Semaphore 사용**
    - async로 처음에 구현했을 때, dequeue된 Customer가 여러 스레드에서 동시에 접근하여 Thread Unsafe한 오류가 있었습니다.
    - Race condition을 해결하면서 동시에 접근할 수 있는 스레드의 수를 제어해주는 Semaphore를 CustomerQueue에서 dequeue하는 시점에 사용해주었습니다.

- **DispatchGroup을 통한 `wait()`**
    - deposit 담당과 loan 담당 은행원(3명)이 처리할 수 있는 고객 수는 각각 1명으로 한정되어 있기 때문에, DispatchGroup으로 구현하여 수행이 끝나기를 기다리는 메서드 wait()으로 구현했습니다.

- **MainStackView의 역할**
    - MVC패턴을 생각하여 구조를 어떻게 잡을지 고민하다가, MainStackView 안에 들어가는 View(ButtonStackView, BankStateView 등)를 어떻게 처리해줘야할지에 대해 고민했었습니다
    - 그래서 1차적으로, MainStackView에서 안에 들어갈 View들의 모두 연결한 후 MainStackView에 단일로 연결해주는 구조를 잡다보니 MainViewController에서 MainStackView 안에 있는 View에 접근하는 것이 매우 유연하지 못하다는 느낌과 실제로 그렇다는 것을 깨닫게 되었습니다.
    - 그러하여, View를 MainStackView에서 관리하지 않고 자주 접근하게 될 MainViewController에서 관리하는 게 유연한 구조가 될 것 같다고 판단하였습니다.
    - 최종 코드에서는 MainViewController에서 View를 관리하는 식으로 변경하였습니다.

- **StopWatch**
    - 원래는 Timer을 사용하여 StopWatch를 구현하려고 했지만, Timer에는 일시정지 관련 메서드가 없어 DispatchSourceTimer로 구현하게 되었습니다.

- **NotificationCenter 사용**
    - STEP4의 요구사항인 '대기중/업무중'을 구분하여, '대기중 -> 업무중 -> 업무완료'순으로 Label을 추가/삭제해야하는 동작을 어떻게 구현할 지 고민했습니다.
    - NotificationCenter를 활용해 대기번호 넘겨주면서 고객들을 '대기중/업무중/업무완료'로 구분해주는 식으로 요구사항을 해결했습니다.

- **고객 추가와 은행 업무 시작의 분리**
    - 기존 코드는 고객 추가 후 은행 업무를 바로 시작하는 흐름으로 코드가 동작했습니다. 이러한 흐름은 UI에서 10명의 고객을 추가하게 되면 은행원이 계속해서 증가하는 문제가 발생했습니다.
    - BankManager에 Banker의 State에 따라 다르게 작동하도록 구현하였으며, 이를 통해 해당 문제를 해결했습니다. 하지만 Customer 대기열에서 임의의 은행 업무 고객이 종료된 후 다시 고객을 추가하게 되면 종료된 업무는 업무 전체가 하나의 group으로 묶여 wait()상태여서 다시 수행되지 않는 문제가 발생했습니다.
    - 업무별로 DispatchQueue.global()에 async하게 Task를 수행하도록 구현하였으며, 이를 통해 문제를 해결했습니다.

- **모든 업무가 종료되어 Complete를 알리는 방법**
    - 업무별로 DispatchQueue.global()에 async하게 Task를 수행하면 하나의 업무가 종료되면 모든 업무가 Complete된 것 처럼 타이머가 멈추는 문제가 발생했습니다.
    - Task에 Completeion을 구현하여 해당 문제를 해결했으나 코드에 깊이가 깊어지고 의미없는 메서드를 구현해야되는 문제가 발생했습니다.
    - 업무별로 DispatchQueue.global()에 async하게 Task를 보낼때 하나의 group으로 묶고 해당 noti()를 이용하여 group이 종료되고 Complete작업을 수행하도록 구현하여 해당 문제를 해결했습니다.

<br>

## 📚 참고 링크
- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) <br>
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html) <br>
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) <br>
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720) <br>
- [Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html) <br>
- [Swift Language Guide - Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) <br>
- [iOS - DispatchSourcetimer](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer) <br>
- [iOS - DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore) <br>
- [iOS - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue) <br>
- [iOS - NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter)
