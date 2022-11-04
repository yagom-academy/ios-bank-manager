# 🏦 은행 창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [Tree](#-tree)
3. [타임라인](#-타임라인)
4. [고민한 점](#-고민한-점)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Mangdi`와 `mene` 가 만든 은행 창구 매니저 앱입니다.
- Queue에 들어있는 고객을 동기 / 비동기로 처리합니다.
- **KeyWords**
  - `Data Type`
      - `Linked-list`, `Queue`
  - `Concurrency`
      - `GCD`, `sync`, `async`

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
[![sindresorhus's SwiftLint config](https://img.shields.io/badge/SwiftLint-0.49.1-green.svg)](https://github.com/realm/SwiftLint)

## 🧑🏻‍💻 팀원
|<img src="https://avatars.githubusercontent.com/u/49121469" width=160>|<img src = "https://avatars.githubusercontent.com/u/84453688?v=4" width=160>|
|:--:|:--:|
|[Mangdi](https://github.com/MangDi-L)|[Mene](https://github.com/JaeKimdev)|

## 🌲 Tree

```
└── BankManagerConsoleApp
    ├── BankManagerConsoleApp
    │   ├── Bank.swift
    │   ├── BankManager.swift
    │   ├── Customer.swift
    │   ├── CustomerQueue.swift
    │   ├── Node.swift
    │   └── main.swift
    └── BankManagerConsoleApp.xcodeproj
        ├── project.pbxproj
        └── project.xcworkspace
            ├── contents.xcworkspacedata
            ├── xcshareddata
            │   ├── IDEWorkspaceChecks.plist
            │   └── swiftpm
            └── xcuserdata
```
 
## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>
    
- **221031**
    - 코코아팟 설치 및 SwiftLint 라이브러리 적용 후 warning이 뜨지않도록 swiftLint rule 수정
    - Node & CustomerQueue 타입 구현하고 CustomerQueue Unit Test
    - Step1 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-bank-manager/pull/218)
- **221101**
    - 리뷰 내용 반영하여 리팩토링
    - Node 타입의 front와 rear에 접근제어자 설정하고 테스트 코드 수정
    - CustomerQueue dequeue 메서드 조건문에 옵셔널 활용하도록 리팩토링

</details>
    
<details>
<summary>Step 2 타임라인</summary>   
    
- **221102**
    - Node & CustomerQueue 파일 ConsoleApp으로 복사
    - Customer타입 구현
    - BankManager의 selectMenu, addCustomer, processTask메서드 구현
    - 한번 실행한 후에 다시 1번을 선택했을 때 작동하지 않던 오류 수정
    - Bank와 BankManager의 역할분리 및 n명의 매니저가 대응하도록 수정
    - Step2 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-bank-manager/pull/229)
    - 리뷰 내용 반영하여 리팩토링
    - Bank 타입의 addCustomer 메서드 forEach 사용하도록 리팩토링
    
</details>
 
<details>
<summary>Step 3 타임라인</summary>

- 내용
    - 상세
  
 </details>
 
## 👀 고민한 점

### Step 1

- 맨처음 클론했을때 ios-bank-manager 폴더 안에 `BankManagerUIApp`과 `BankManagerConsoleApp` 폴더가 있었습니다. 이중에 어느 폴더로 Step1을 시작할지 고민했습니다.
    - BankManagerConsoleApp에는 스위프트파일 하나만 덩그러니 있고 BankManagerUIApp에는 프로젝트를 진항할때 일반적으로 존재하는 스토리보드나 viewController 파일들이 있길래 UIApp폴더에 작성했습니다.
- `SwiftLint` 설치 시, 어떤 패키지 매니저를 이용할지 고민했습니다.
    - `스위프트매니저`로 라이브러리를 관리할까 생각했는데 호환성문제와 자잘한 버그들이 여전히 존재한다 들었습니다. 때문에 맨 처음으로 사용해보는 초보자 입장에서, 제일 원조적이고 잘 작동하는 `코코아팟`으로 채택해서 사용했습니다.
- UItest 작성 시 `String Literal`을 제거하기 위해서 테스트 데이터를 상수로 선언하고 XCTAssertEqual로 비교할 때 사용해 주었습니다.

### Step 2

- Bank 타입에서 은행을 열었을 때 처리할 작업을 나타내는 메서드 네이밍을 `open`으로 하려고 하다가 `open`이 시스템 예약어라서 다른 이름을 사용하기 위해 `openUp`이라는 이름으로 설정해 주었습니다.
- UIApp에서 만들었던 파일을 ConsoleApp으로 가져오는 방법을 고민해 보았습니다.
- `BankManager` 타입의 `allocateCustomer `메서드에서 모든 고객을 처리한 후 처리시간이 노출될 때 소숫점 2자리까지만 노출되도록 `String(format: "%.2f")`을 적용해 주었습니다.

### Step 3

- 내용
    - 상세
        
## 📱 실행 화면

|<img src = "https://i.imgur.com/QmFU5kM.gif)" width=640>|![](https://i.imgur.com/tPDmxV1.png)|![](https://i.imgur.com/Nis2Mpo.png)|
|:--:|:--:|:--:|
|대기열에 들어있는 고객을<br>순서대로 처리합니다|2번 선택시<br>프로그램 종료|예외 처리 |

## ❓ 트러블 슈팅

### Step 1

<details>
    <summary>`SwiftLint` 적용을 위해 코코아팟 설치 시 Ruby version문제로 설치되지 않았습니다.</summary>

![](https://camo.githubusercontent.com/3325a7de9480141339aa46fafb2e70068eb250812bc8aeb4a94b669f9251c0b9/68747470733a2f2f692e696d6775722e636f6d2f34666a4a4e61582e706e67)
    `xcode-select`도 이미 깔려있었고, `brew`를 이용해서도 권한 문제로 설치가 되지 않아 root 권한을 주고 Ruby 최신 버전을 설치해보려고 했지만 너무 위험하다는 메세지와 함께 설치가 되지 않았습니다. 모든 소프트웨어 업데이트와 `xcode-select` 재설치를 통해 해결하였습니다.
    
</details>

### Step 2

<details>
    <summary>UIApp에서 만들었던 파일을 ConsoleApp으로 가져오는 방법을 고민해 보았습니다.</summary>
    
UIApp에서 만든 Node, CustomerQueue파일을  
ConsoleApp으로 복사하기위해 파일을 끌어서 놨는데  
ConsoleApp의 Node, CustomerQueue파일의 내용을 변경할때 UIApp에서의  
Node, CustomerQueue내용이 같이 변경된다는점을 발견했습니다.  
이를 해결하기 위해여 아래와 같이 진행했습니다.  

<img src="https://i.imgur.com/ZCu8pbB.png" width=400>  

finder에서 consoleApp폴더에 복사붙여넣기한상태로,finder에서는 붙여넣기한 파일들이 보이지만 아래사진에서 Xcode에는 반영이 안된걸 알수있습니다.  

<img src="https://i.imgur.com/Livq2wW.png" width=400>  

(적용이 안된상태)  

<img src="https://i.imgur.com/7TRXOZx.png" width=600>  

그래서 finder에 추가한 파일들을 그대로 끌어다가 놓으면 이런 창이 뜨게 됩니다.  
여기서 Copy Items if needed를 꼭 체크해주고  

<img src="https://i.imgur.com/fM0mOjf.png" width=400>  

finish를 눌러 파일이 잘 들어온걸 확인할수있었습니다.  
이제 더이상 AppUI의 파일과 내용을 공유하지않았습니다.  
    
</details>

### Step 3

- 내용
    - 상세


## 🔗 참고 링크

[Swift Language Guide - Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)  
[Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)  
[WWDC2016 - Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)  
[야곰 닷넷 - 오토 레이아웃 정복하기](https://yagom.net/courses/autolayout/)  

---

[🔝 맨 위로 이동하기](#-은행-창구-매니저)
