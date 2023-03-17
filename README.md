# 은행창구 매니저

## 프로젝트 소개 💰
> 은행을 방문한 고객들의 업무를 여러명의 은행원이 동시에 처리하도록 구현한 앱 
>
> 프로젝트 기간: 2023.03.06 - 2023.03.17

## 목차 :book:

| <center>순서</center> |
|---|
| [팀원 👀](#팀원-) |
| [프로젝트 구조 🚧](#프로젝트-구조-)|
| [타임라인 ⏰](#타임라인-) |
| [실행화면 🎬](#실행화면-) |
| [트러블슈팅 🚀](#트러블슈팅-) |
| [Reference 📑](#Reference-) |

## 팀원 👀

|<center>[kokkilE](https://github.com/kokkilE)</center>| <center> [vetto](https://github.com/gzzjk159)</center> | 
|--- | --- |
|<img width="200" src=https://i.imgur.com/4I8bNFT.png>|<img width="200"  src=https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg> |

## 프로젝트 구조 🚧

<details> <summary><big>Class Diagram 🗺</big></summary> 

### ConsoleApp
<img src= "https://i.imgur.com/AweJ1PX.png" width=1000>
 
### UIApp
<img src="https://i.imgur.com/EZ8ZxEf.png" width=1000>
    
</details>

</br>

<details><summary><big>File Tree 🌲</big></summary> 

### ConsoleApp

```swift
BankManagerConsoleApp
├── BankManagerConsoleApp
│   ├── BankManager.swift
│   ├── Bank.swift
│   ├── BankClient.swift
│   ├── Banker.swift
│   ├── LinkedList.swift
│   ├── Node.swift
│   ├── Queue.swift
│   └── main.swift        
└── QueueTests
    └── QueueTests.swift
```

### UIApp 
```swift

BankManagerUIApp
├── Application
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Controller
│   │   └── BankManagerViewController.swift
│   ├── Info.plist
│   ├── Model
│   │   ├── Bank.swift
│   │   ├── BankClient.swift
│   │   ├── Business.swift
│   │   ├── LinkedList.swift
│   │   ├── Node.swift
│   │   └── Queue.swift
│   ├── Namespace
│   │   └── Event.swift
│   ├── Resources
│   │   ├── Assets.xcassets
│   │   └── LaunchScreen.storyboard
│   └── View
│       ├── ClientLabel.swift
│       ├── ClientStackView.swift
│       └── TimerStackView.swift
├── BankManagerUIAppTests
│   ├── BankManagerUIAppTests.swift
│   └── Info.plist
└── BankManagerUIAppUITests
    ├── BankManagerUIAppUITests.swift
    └── Info.plist
```
    
</details>

</br>

## 타임라인 ⏰

| <center>STEP | <center>날짜   | <center>타임라인 |
| ----- | -------------- | --- |
| STEP1 | **2023.03.06** | - Node, LinkedList 타입 구현 </br> - queue 구현 </br> - QueueTests 구현 |
| STEP2 | **2023.03.07** | - Bank, BankTeller, BankCustomer 구현 </br> - BankCustomer BankClient로 네이밍 수정 </br> - BankClient 타입 변경 </br> - BankTeller requiredtime 프로퍼티 추가 |
| STEP2 | **2023.03.08** | - Int, Double Extension 생성 </br> - NumberFormatter 적용 함수 생성 |
| STEP2 | **2023.03.10** | - BankTeller Banker로 네이밍 수정 </br> - 타입의 프로퍼티에 타입 명시 </br> - bank타입 변경 </br>- NumberFormatter 적용 삭제 |
| STEP3 | **2023.03.12** | - Business타입 생성 </br> - DispatchQueue타입 생성(동시성 구현) </br> - dispatchClient 메서드 구현 |
| STEP4 | **2023.03.14** | - mainStackView 구현 </br> - 고객 추가 및 초기화 Button구현 </br> - 대기중 및 업무중 Label 구현 </br> - 대기중 및 업무중 ScrollView 구현 </br> - 고객정보 custom View 구현 </br> - Timer Label 구현 |
| STEP4 | **2023.03.15** | - mainStackView 구현 </br> - Notification으로 정보 전달 구현 |
| STEP4 | **2023.03.16** | - Timer 작동 구현 </br> - DispatchQueue에서 OperationQueue로 변경 </br> - 초기화 버튼 작동 구현 </br> - main 스토리보드 삭제|

</br>

## 실행화면 🎬

### ConsoleApp

|<center>은행 개점 후 <br> 업무 처리</center>|<center>종료</center>|
| -- | -- |
|<img src="https://i.imgur.com/i6TDiV0.gif" width=300>|<img src="https://i.imgur.com/SQrlnjO.gif" width=300>|

### UIApp

| <center>초기 화면에서<br>고객 10명 추가</center>|<center>업무가 끝난 화면에서<br>고객 10명 추가</center>|<center>업무가 끝나기 전<br>고객 여러명 추가</center>|
| -- | -- | -- |
|<img src="https://i.imgur.com/r5dCVCc.gif" width=200>|<img src="https://i.imgur.com/8Ke19nY.gif" width=200>|<img src="https://i.imgur.com/Ssrp5C5.gif" width=200>|

|<center>업무 종료 전 초기화</center>|<center>업무 종료 후 초기화</center>|
| -------- | -------- |
|<img src="https://i.imgur.com/8kaO9IV.gif" width=200>| <img src="https://i.imgur.com/EcwlKK5.gif" width=200>|

</br>

## 트러블슈팅 🚀

### 1️⃣ Unit Test의 타겟 import 에러
UIApp 환경에서 테스트하던것과 마찬가지로 `@testable import`로 테스트 대상의 타겟을 `import`해서 시험하고자 했으나, 다음과 같은 에러가 발생했다.

<img src="https://i.imgur.com/7N4TEtM.png" width=600>

`BankManagerConsoleApp` 타겟을 인식하지 못하는 것으로 보여 타겟 설정에서 여러 시행착오를 해봤으나 결국 해결하지 못하고, 다음과 같이 테스트 대상 파일에서 Target Membership을 추가하는 방법으로 테스트했다.

<img src="https://i.imgur.com/hY2vjsj.png" width=180>

### 2️⃣ struct, class 타입
타입을 결정할 때 `상속이 필요한지`, `참조 타입의 identifier 특성이 필요한지`를 우선적으로 고려하여, `Node`를 제외한 모든 타입을 struct로 구현했다.

하지만 Bank 타입 내에서는 mutating이 자주 일어나서 프로퍼티의 CoW 장점이 희미해진다는 점을 고려했고,
``` swift
struct Bank {
    private var banker: [Banker] = .init()
    private var clientQueue: Queue<BankClient> = .init()
    private var numberOfClient: Int = 0
    
    mutating func openBank() { ... }
    private mutating func setupClient() { ... }
    private mutating func assignClientsToBankTeller() { ... }
    private mutating func closeBank() { ... }
    private func printClosingMessage() { ... } 
    private mutating func clearNumberOfClient() { ... }
}
```

BankManager 내 bank 프로퍼티가 variable 됨으로써 변경될 수 있는 점을 고려했다. 
``` swift
struct BankManager {
    // BankManager가 bank를 직접적으로 수정 가능하다.
    private var bank: Bank = .init()
    
    mutating func startBankManager() { ... }
    private func printBankMenu() { ... }
    }
}
```

위 두가지 이유로 bank타입을 struct에서 class로 수정하였다.


### 3️⃣ NumberFormat vs String(format:)
총 걸린 시간의 소수점 둘째자리까지 출력하기 위해서 NumberFormatter랑 String(format:) 두 가지 방법을 고민하였다.

- NumberFormatter은 수가 커졌을 때 출력되는 수를 한 눈에 보기 편하다는 장점이 있었지만 수가 작으면 굳이 NumberFormatter를 사용할 이유가 없다는 것과 NumberFormatter가 호출되어 약간의 메모리 낭비가 있다는 단점이 있다. 
- String(format:)은 비교적 간단한 로직으로 작성할 수 있는 장점이 있지만 큰 수를 표시하는데는 한 눈에 알아 보기 힘들다는 단점이 있다.

처음에는 큰 수까지 고려하여 NumberFormatter로 작성하였지만 이번 프로젝트에서 1000단위가 넘어가는 큰 수가 나오지 않는 점과 NumberFormatter를 사용할때 format이 실패했을 때를 대비해 바인딩을 해야한다는 점에서 NumberFormatter 사용을 없애고 String(format:)으로 코드를 수정하였다.

### 4️⃣ 동시성 구현 방법
콘솔 앱에서 구현할 때 `DispatchQueue`를 사용하던 방식을 `OperationQueue`를 사용하는 방식으로 변경하였다. 그 이유는 한번 작업이 `DispatchQueue`에 들어가게 되면 대기중인 작업을 취소할 수 없기 때문이었다. 대기중인 작업을 쉽게 취소하고 정지할 수 있는 `OperationQueue`의 `cancalAllOperations` 메서드를 이용하여 구현하기 위해 `OperationQueue`를 사용하였다.

### 5️⃣ ViewController의 View 분리 기준
`BankManagerViewController`에서 `View`를 그리는 메서드들에 의해 코드 길이가 길어지며 `ViewController`가 많은 역할을 하게 된다. `View`를 그리는 것을 어떻게 분리하면 좋을지 고민했고, 리뷰어인 havi에게 다음과 같은 조언을 받았다. 이번 프로젝트에서 반영되지 않은 부분도 있지만, 리뷰어의 조언을 참고하여 리팩토링을 했다.

- 재사용이 될 가능성이 있는 뷰 => 커스텀뷰
- 역할이 뚜렷하고, 따로 분리되면 좋을거 같이 생긴 뷰 => 커스텀 뷰로 만들어서 뷰컨 파일에 filePrivate으로 구현
- 해당 뷰에만 종속된 버튼이나 레이블 => 그냥 뷰에 그려줌

### 6️⃣ 이벤트 전달 방법
우리는 `Delegate 패턴`과 `Notification`을 활용하는 방법 중 `Notification`을 활용하는 방법을 선택하였다.

- 이 프로젝트에서는 이벤트가 발생했을 때 데이터를 수신하는 객체가 한 군데 뿐이라 Delegate 패턴을 적용하는게 가독성도 좋고 적합할 수 있다고 생각했다.
- 그럼에도 Notification 방식으로 구현한 이유는 Notification 방식은 데이터를 주고받는 객체가 서로의 정보(메서드)를 알 필요가 없기 때문에 타입 간의 의존성이 낮아진다는 점 때문이었다.
- 또한 Delegate 패턴을 적용할 경우, Bank와 viewController가 서로의 Delegate를 프로퍼티로 들고 있어야 하는데, 서로가 서로의 Delegate 프로퍼티를 보유하는 것이 좋은 방향이라고 생각되지 않았다.

</br>

## Reference 📑

- [How do I unittest a command line application?](https://developer.apple.com/forums/thread/52211)
- [WWDC2016](https://developer.apple.com/videos/play/wwdc2016/416/)
- [choosing-between-structures-and-classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes#Use-Structures-When-You-Dont-Control-Identity)
- [Delegate, Notification, KVO 비교](https://you9010.tistory.com/275)
- [야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/)
