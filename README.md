# 은행창구 매니저

## 프로젝트 소개 🎪
> 은행을 방문한 고객들의 업무를 여러명의 은행원이 동시에 처리하도록 구현한 앱 
>
> 프로젝트 기간: 2023.03.06 - 2023.03.17

## 목차 :book:

| <center>순서</center> |
|---|
| [1. 팀원 👀](#-팀원-👀) |
| [2. 프로젝트 구조 🚧](#-프로젝트-구조-🚧)|
| [3. 타임라인 ⏰](#-타임라인-⏰) |
| [4. 실행 화면 🎬](#-실행화면-🎬) |
| [5. 트러블슈팅 🚀](#-트러블슈팅-🚀) |
| [6. Reference 📑](#-Reference-📑) |


## 팀원 👀

|<center>[kokkilE](https://github.com/kokkilE)</center>| <center> [vetto](https://github.com/gzzjk159)</center> | 
|--- | --- |
|<img width="200" src=https://i.imgur.com/4I8bNFT.png>|<img width="200"  src=https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg> |

## 프로젝트 구조 🚧

<details> <summary><big>Class Diagram 🗺</big></summary> 

<img src= "https://i.imgur.com/AweJ1PX.png" width=1000>
    
</details>

</br>

<details><summary><big>File Tree 🌲</big></summary> 

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
    
</details>

</br>

## 타임라인 ⏰

| <center>STEP | <center>날짜   | <center>타임라인 |
| ----- | -------------- | --- |
| STEP1 | **2023.03.06** | - Node, LinkedList 타입 구현 </br> - queue 구현 </br> - QueueTests 구현 |
| STEP2 | **2023.03.07** | - Bank, BankTeller, BankCustomer 구현 </br> - BankCustomer BankClient로 네이밍 수정 </br> - BankClient 타입 변경 </br> - BankTeller requiredtime 프로퍼티 추가 |
| STEP2 | **2023.03.08** | - Int, Double Extension 생성 </br> - NumberFormatter 적용 함수 생성 |
| STEP2 | **2023.03.10** | - BankTeller Banker로 네이밍 수정 </br> - 타입의 프로퍼티에 타입 명시 </br> - bank타입 변경 </br>- NumberFormatter 적용 삭제 |

</br>

## 실행화면 🎬

|<center>은행 개점 후 <br> 업무 처리</center>|<center>종료</center>|
| -- | -- |
|<img src="https://i.imgur.com/i6TDiV0.gif" width=300>|<img src="https://i.imgur.com/SQrlnjO.gif" width=300>|

</br>

## 트러블슈팅 🚀

### 1️⃣ Unit Test의 타겟 import 에러
UIApp 환경에서 테스트하던것과 마찬가지로 `@testable import`로 테스트 대상의 타겟을 `import`해서 시험하고자 했으나, 다음과 같은 에러가 발생했다.

<img src="https://i.imgur.com/7N4TEtM.png" width=600>

`BankManagerConsoleApp` 타겟을 인식하지 못하는 것으로 보여 타겟 설정에서 여러 시행착오를 해봤으나 결국 해결하지 못하고, 다음과 같이 테스트 대상 파일에서 Target Membership을 추가하는 방법으로 테스트했다.

<img src="https://i.imgur.com/hY2vjsj.png" width=180>

그러나 위 방법은 번거로울 뿐더러 같은 프로젝트 내에 있는 타겟을 인식하지 못하는것은 부자연스럽게 느껴져서, 해결 방법을 찾고 있다.

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

</br>

### NumberFormat vs String(format:)
총 걸린 시간의 소수점 둘째자리까지 출력하기 위해서 NumberFormatter랑 String(format:) 두 가지 방법을 고민하였다.

- NumberFormatter은 수가 커졌을 때 출력되는 수를 한 눈에 보기 편하다는 장점이 있었지만 수가 작으면 굳이 NumberFormatter를 사용할 이유가 없다는 것과 NumberFormatter가 호출되어 약간의 메모리 낭비가 있다는 단점이 있다. 
- String(format:)은 비교적 간단한 로직으로 작성할 수 있는 장점이 있지만 큰 수를 표시하는데는 한 눈에 알아 보기 힘들다는 단점이 있다.

처음에는 큰 수까지 고려하여 NumberFormatter로 작성하였지만 이번 프로젝트에서 1000단위가 넘어가는 큰 수가 나오지 않는 점과 NumberFormatter를 사용할때 format이 실패했을 때를 대비해 바인딩을 해야한다는 점에서 NumberFormatter 사용을 없애고 String(format:)으로 코드를 수정하였다.

## Reference 📑

- [How do I unittest a command line application?](https://developer.apple.com/forums/thread/52211)
- [WWDC2016](https://developer.apple.com/videos/play/wwdc2016/416/)
- [choosing-between-structures-and-classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes#Use-Structures-When-You-Dont-Control-Identity)
