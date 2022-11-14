

# 🏦 Bank Manager 

- Kyo와 Wonbi가 만든 Bank Manager App입니다.

## 📖 목차
1. [팀 소개](#-팀-소개)
2. [GroundRule](#-ground-rule)
3. [Code Convention](#-code-convention)
4. [실행 화면](#-실행-화면)
5. [Diagram](#-diagram)
6. [폴더 구조](#-폴더-구조)
7. [타임라인](#-타임라인)
8. [기술적 도전](#-기술적-도전)
9. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
10. [일일 스크럼](#-일일-스크럼)
11. [참고 링크](#-참고-링크)


## 🌱 팀 소개
 |[Wonbi](https://github.com/wonbi92)|[Kyo](https://github.com/KyoPak)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/88074999?v=4">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src= "https://user-images.githubusercontent.com/59204352/193524215-4f9636e8-1cdb-49f1-9a17-1e4fe8d76655.PNG" >|

## 🤙 Ground Rule

[Ground Rule 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/1.-Ground-Rule)

## 🖋 Code Convention

[Code Convention 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/2.-Code-Convention)

## 🛠 실행 화면
- 중간에 대기가 없어지는 경우는 초기화 버튼을 클릭한 상황입니다.

|**실행 화면**|**스크롤 실행 화면**|
|:---:|:---:|
|<img width = 450, src = "https://i.imgur.com/lgiEti4.gif">|<img width = 450, src = "https://i.imgur.com/rhPWtGb.gif">|


## 👀 Diagram

### 🧬 Class Diagram
![](https://i.imgur.com/NBLKk1m.png)

 
## 🗂 폴더 구조
> BankManagerConsoleApp 내부에 Model 코드 존재 <br>
> BankManagerUIApp 내부에 View, ViewController 코드 존재
```
BankManagerConsoleApp
├── Models
│   ├── Bank
│   │   ├── Bank.swift
│   │   ├── BankManager.swift
│   │   └── Banker.swift
│   ├── Client.swift
│   └── Data Structure
│       ├── ClientQueue.swift
│       ├── LinkedList.swift
│       └── Node.swift
├── Protocol
│   ├── ClientQueueable.swift
│   └── Queueable.swift
└── main.swift
```

```
BankManagerUIApp
├── AppDelegate.swift
├── SceneDelegate.swift
├── Info.plist
├── Base.lproj
│   └── LaunchScreen.storyboard
├── Controllers
│   └── BankViewController.swift
└── Views
    └── MainView.swift
```

## ⏰ 타임라인

### 👟 Step 1
- Model 구현
    - ✅ Linked-list 자료구조의 이해 및 구현
    - ✅ Queue 자료구조의 이해 및 구현 
    - ✅ Generics 개념이해 및 적용
- UnitTest 
    - ✅ `Node`, `LinkedList`, `ClientQueue`에 대한 UnitTest 작성
    - ✅ Code Coverage 100% 
- 의존성관리도구 도입
    - ✅ 의존성 관리도구 CocoaPods 선택
    - ✅ SwiftLint 적용
    
<details>
<summary> 
펼쳐보기
</summary>
    
#### 1️⃣ Node
- `data`
    - Node의 내부 값을 의미하는 프로퍼티입니다. 
- `next`
    - Node의 연결되어있는 다음 Node를 가르키는 프로퍼티입니다.
- `nodeData`
    - Node 내부의 data 프로퍼티를 반환하는 연산 프로퍼티입니다.
- `nextNode`
    - Node와 연결되어있는 다음 Node를 반환하는 연산 프로퍼티입니다.
- `setupNext(node:)`
    - Node의 연결되어있는 Node를 설정해주는 메서드입니다.


#### 2️⃣ LinkedList
- `head: Node<Element>?`
    - 첫번째 Node를 가르키는 프로퍼티입니다.
- `tail: Node<Element>?`
    - 마지막 Node를 가르키는 프로퍼티입니다.
- `count: Int`
    - 리스트의 데이터 갯수를 나타내는 프로퍼티입니다.
- `headData`
    - 첫번째 Node의 data를 반환하는 연산 프로퍼티입니다.
    - 값이 없을 경우 nil을 반환합니다.
- `currentCount`
    - List의 데이터 갯수를 반환하는 연산 프로퍼티입니다.
- `append(data:)`
    - List에 새로운 값을 추가하는 메서드입니다.
- `removeFirst()`
    - List의 첫번째 값을 지우고 그 값을 반환하는 메서드입니다.
- `removeAll()`
    - List의 모든 값을 지우고 초기화하는 메서드입니다.
    
#### 3️⃣ ClientQueue
- `peek`
    - Queue의 첫번째 요소를 반환하는 연산 프로퍼티입니다.
- `isEmpty`
    - Queue가 비어있는 상태인지를 Bool값으로 반환해주는 연산 프로퍼티입니다.
- `enqueue(_)`
    - Queue에 요소를 넣었을 때 호출하는 메서드입니다.
- `dequeue()`
    - Queue에 첫번째 요소를 Remove하는 메서드입니다.
- `clear()`
    - Queue의 모든 요소를 Remove하는 메서드입니다.

</details>

### 👟 Step 2
- Model 구현
   - ✅ Queue의 활용
- POP 사용
   - ✅ 타입 추상화 및 일반화
   - ✅ DI, DIP 구현을 통해 Bank와 ClientQueue사이의 의존성 관리
- Timer 사용
   - ✅ Timer을 사용하여 실제 메서드가 처리되는데 걸리는 시간 측정
    
<details>
<summary> 
펼쳐보기
</summary>
    
#### 1️⃣ Bank
- `bankWorker`
    - 은행 업무를 실행하는 은행 직원 프로퍼티입니다.
- `clientQueue`
    - 은행 고객을 받는 대기열입니다.
    - step1에서 구현한 Queue를 사용합니다.
- `bankManager`
    - 은행의 총 고객수와 은행의 총 업무시간을 체크하는 프로퍼티입니다. 
- `openBank()`
    - Bank 개점을 하는 메서드입니다. 
    - 내부에서 은행일을 진행하는 메서드를 순차적으로 호출합니다.
- `updateClientQueue()`
    - `clientQueue` 대기열에 고객을 추가하는 메서드입니다.
    - 10~30명의 고객을 랜덤하게 대기열에 추가합니다.
- `startBankWork()`
    - `bankWorker`가 고객의 업무를 처리하는 메서드입니다.
    - `bankWorker`가 업무를 처리할 동안 `bankManager`가 업무시간을 체크합니다.
- `endBankWork()`
    - `bankManager`가 업무가 끝난 후 총 고객 수와 업무시간을 정산하여 출력해주는 메서드입니다.


#### 2️⃣ BankWorker
- `startWork(client:)`
    - BankWorker의 업무시작과 업무종료를 알리고 usleep을 이용한 0.7초간의 정지가 포함된 메서드입니다.


#### 3️⃣ BankManager
- `clientCount`
    - 총 Client가 몇 명인지에 대한 프로퍼티입니다.
- `totalWorkTime`
    - 전체 업무 시간에 대한 프로퍼티입니다.
- `workStartTime`
    - 현재 시작 지점의 시간을 저장할 프로퍼티입니다.
- `addClientCount()`
    - Client의 수를 증가시키는 메서드입니다.
- `resetWorkTime()`
    - 현재 시작 지점의 시간을 초기화 하는 메서드입니다. 
- `addWorkTime()`
    - 1명의 Client의 업무가 종료될때마다 totalWorkTime에 합산하는 메서드입니다. 
- `printWorkFinished()`
    - 업무가 마감되었을 때 호출되는 메서드입니다.
- `resetData()``
    - 영업 마감 후 내부 프로퍼티들을 초기화해주는 메서드입니다.


#### 4️⃣ Client
- `waitingTicket`
    - 몇 번 고객인지를 알려주는 프로퍼티입니다.

#### 5️⃣ Queueable+Extension
- Queueable Extension
    - Step 1의 ClientQueue와 내부 로직 동일합니다.
- Queueable
    - `associatedtype Element`을 가지는 프로토콜입니다.
    - `LinkedList`타입의 `list`프로퍼티 구현을 요구합니다.

#### 6️⃣ ClientQueueable
- 해당 프로토콜은 Queueable을 채택받고 Queueable의 `Element`를 `Client`로 제한 시킵니다.

</details>
    
### 👟 Step 3
- DispatchQueue를 이용한 비동기 구현
    - ✅ DispatchGroup 활용
    - ✅ Custom DispatchQueue 활용
    - ✅ DispatchSemaphore 활용
- DIP, DI 적용
    - ✅ Protocol을 이용한 타입 추상화 및 일반화
    - ✅ Protocol과 Default Implementation을 이용한 DIP(의존성 역전 법칙) 적용

<details>
<summary> 
펼쳐보기
</summary>
    
#### 1️⃣ Bank
- `divideWork`
    - 고객의 방문 목적에 따라 각각의 업무를 진행하도록 고객을 분리하는 메서드입니다.
    - 각 업무는 비동기로 이루어집니다.
#### 2️⃣ Banker
- 기존 이름인 `BankWorker`를 `Banker`로 교체하였습니다.
- 이제 `Bankerable`을 채택합니다.
#### 3️⃣ BankManager
- 이제 `BankManagable`을 채택합니다.
#### 4️⃣ BankManagable
- 다음 메서드를 필수 구현해야 하는 프로토콜입니다.
    - addClientCount()
    - resetWorkTime()
    - addWorkTime()
    - printWorkFinished()
#### 5️⃣ Bankerable+
- startWork(client:)
    - 업무시작과 업무종료를 알리고 업무에 따라 적절한 시간을 대기하는 로직이 포함된 메서드입니다.
- selectWork(purpose:)
    - 업무에 따라 얼만큼 시간을 정지할지 선택하는 메서드입니다.

</details>

### 👟 Step 4
- 프로젝트 관리
    - ✅ Xcode 프로젝트 관리 구조의 이해와 응용
    - ✅ 동시성 프로그래밍 중 UI 요소 업데이트의 주의점 이해
- UI 구현
    - ✅ Custom View 구현
    - ✅ Stack View 활용
- Model 리팩토링
    - ✅ Operation Queue 사용
    - ✅ Timer 사용
    

<details>
<summary> 
펼쳐보기
</summary>
    
#### 1️⃣ `MainView`
- view를 그리기 위한 UI Components 와 오토레이아웃 제약조건을 설정하는 메서드를 구현하였습니다.
- `setupStackView()`
    - 만들어진 Component들이 들어있는 StackView에를 `MainView`의 SubViwe로 추가하고 오토레이아웃을 적용하는 메서드입니다.
- `setupScrollView()`
    - '대기중'과 '업무중'을 표현하기 위한 Label을 담는 StackView를 ScrollView에 추가하고 오토레이아웃을 적용하는 메서드입니다.
#### 2️⃣ `BankViewController`
- `addNotification()`
    - 고객의 업무의 시작과 끝을 알리는 `NotificationCenter`를 추가하는 메서드입니다.
- `addButtonTarget()`
    - 고객추가와 초기화 버튼을 클릭시 동작되는 Action을 추가한 메서드입니다.
- `addClient()`
    - 고객추가 버튼을 누르면 `bank`의 고객을 10명 추가하고 업무를 진행시키는 메서드입니다.
- `resetData()`
    - bank내부의 Data를 초기화 하고 모든 대기중, 업무중인 StackView를 비어주는 메서드입니다.
- `makeClientLabel(_:)`
    - 대기중 StackView에 갈때 쌓일 Label들을 만드는 메서드입니다.
- `handlingStackView(noti:)`
    - `NotificationCenter`가 고객업무의 시작과 끝을 알리면 실행되는 메서드입니다.
    - 업무 유형을 분별해, 어떤 StackView의 레이블을 핸들링 할지 결정합니다.
- `handleLabel(by:noti:)`
    - StackView에 있는 레이블과 `NotificationCenter`를 통해 전달받은 정보를 비교해 해당 레이블을 옮기거나 제거하는 메서드입니다.
- `addToWorkingStackView(_:)`
    - 업무중 StackView에 label을 추가해주는 메서드입니다.
- `makeTimer()`
    - 0.001초마다 업무시간 Label을 업데이트 하는 타이머를 활성화 시키는 메서드입니다.
    - 타이머의 tolerance는 0.0001 입니다.
- `makeTimeLabel(count:)`
    - 업무시간 Label에 들어가는 시간을 00:00:000 과 같은 형식으로 변환해주는 포멧터를 적용하는 메서드입니다.
- `pauseTimer(_:)`
    - 대기중인 고객이 없고, 업무중인 고객이 없는 경우를 만족할때, Timer가 정지되게끔 동작하는 메서드입니다. 
- `resetTimer()`
    - 타이머를 비활성화 시키고, 시간 카운트와 업무시간 Label을 초기화하는 메서드입니다.
    
</details>
    


## 🏃🏻 기술적 도전
### ⚙️ LinkedList 
<details>
<summary> 
펼쳐보기
</summary>
    
<img width = 400, src = "https://i.imgur.com/mIhEeC7.png">

- Linked List는 Array와 자주 비교되는 대표적인 자료 구조 중 하나입니다. 
- 메모리에 각각의 원소를 순차적으로 저장하는 Array와 달리, Linked List는 데이터와 링크로 구성된 노드를 이용하여 메모리에 저장된 순서와 상관없이 연결된 데이터 구조를 말합니다.
- Linked List는 구조상 데이터 삽입 및 삭제 속도가 빨라 FIFO가 필요한 환경에서 Array보다 성능적으로 유리합니다.<br><br>
- 💡 이번 프로젝트에서는, 은행에 방문한 고객의 업무를 선입선출(FIFO)방식으로 처리하기에 Array보다 Linked List가 더 적절하다 판단되어 이 자료구조를 적용시켜 보았습니다.

</details>    

### ⚙️ POP  
    
<details>
<summary> 
펼쳐보기
</summary>
        
```swift
protocol Queueable { }
extension Queueable { 
    // Default Implementaion
}

struct ClientQueue: Queueable { ... }
```
- POP를 사용하게 된다면 구조체, 열거형의 타입들도 상속과 유사한 기능의 확장을 이룰 수 있습니다. 또한 기능의 분리도 할 수 있게 됩니다.<br><br>
- 💡 POP를 사용하기 전, Queue라는 자료구조를 `ClientQueue`로 한정하는 느낌이 들었습니다. 
- 추후에 또 다른 Queue를 프로젝트에서 사용할 수도 있을 것 같아 확장성을 위해서 `Queueable`이라는 프로토콜을 만들었고 프로토콜 extension을 사용하여 default 로직들을 구현 해주었습니다. 그리고 `ClientQueue`를 `Queueable` 프로토콜을 채택하는 방향으로 구현하였습니다.

</details>
        
### ⚙️ DIP, DI를 사용하여 의존성 관리 
    
    
<details>
<summary> 
펼쳐보기
</summary>
        
```swift
protocol ClientQueueable: Queueable where Element == Client { }
struct ClientQueue: ClientQueueable { ... }
struct Bank<Queue: ClientQueueable> { 
    private var clientQueue: Queue
    init(..., queue: Queue) {
        self.clientQueue = queue
        ...
    }
}
    ... }
```
- DIP란 상위 모듈이 하위 모듈을 의존하면 안된다는 OOP SOLID법칙 중 하나입니다.<br><br>
- 💡 위에서 POP를 생각하여 구현한 후에 의존성의 문제를 발견할 수 있었습니다. Bank 구조체 내부에서 `ClientQueue`에 대한 의존이 크다고 판단하여 의존성을 `ClientQueueable`프로토콜로 분리 시키고 외부에서 인스턴스를 주입하는 방향으로 구현하였습니다.
- 결과적으로 `Bank`는 `ClientQueueable`에 의존성이 생기고 `ClientQueue` 또한 `ClientQueueable`에 의존성이 생기기 때문에 적절한 의존성 분리를 하였다고 생각됩니다.
        
</details>

### ⚙️ 의존성 관리 도구 사용 
    
<details>
<summary> 
펼쳐보기
</summary>

<img width = 300, src = "https://i.imgur.com/SN4RfiI.jpg">

- CocoaPods은 Swift 및 Objective-C Cocoa 프로젝트에 널리 사용되는 의존성 관리 도구(dependency manager)입니다.
- 의존성 관리 도구를 사용하면 앱에서 사용하는 서드파티 의존성(dependencies)을 쉽게 추가, 제거, 업데이트와 관리를 할 수 있습니다.<br><br>
- 💡 이번 프로젝트에선 코드 컨벤션을 쉽게 고쳐주는 SwiftLint 서드파티를 사용하기 위해 CocoaPods을 사용했습니다.
- CocoaPods은 가장 많이 사용하는 의존성 관리도구이기 때문에 사용하면서 많이 사용하는 이유를 느낄 수 있을 거라고 생각했습니다.
- 또한, 의존성 관리도구에 대한 경험이 두 팀원 모두 적어 사용하기가 비교적으로 쉽다는 CocoaPods을 선택하였습니다. 

</details>

### ⚙️ Timer

<details>
<summary> 
펼쳐보기
</summary>
    
```swift
let timer: Timer?
    
timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { 
// 시간을 UI에 그리는 로직
}
    
timer.tolerance = 0.0001
```
- `Timer` 클래스는 특정 시간 간격이 경과한 후 실행되어 지정된 메시지를 대상 개체에 보내는 객체입니다.
- `Timer`를 활용하여 원하는 시간에 미리 설정해둔 코드블럭을 실행시키거나, 특정 간격으로 반복적으로 실행시키는 것이 가능합니다.
- `tolerance`프로퍼티를 이용해 Timer가 이벤트를 발생시키는 것에 여유를 허용하므로써 시스템이 전원 관리와 반응성을 최적화 할 수 있습니다.
- `tolerance`값을 설정하지 않아도 프로그램은 어느정도 여유를 허용하지만, Apple 공식 문서에서 권장하는 tolerance 값은 최소 원래 간격의 10% 이상입니다.<br><br>
- 💡 이번 프로젝트에선 0.001초마다 UI의 업무시간을 업데이트하여 은행의 총 업무시간을 실시간으로 표현해주도록 구현해 보았습니다. 여기서 `tolerance`는 0.001초의 10%인 0.0001입니다.

</details>    
    
### ⚙️ OperationQueue

<details>
<summary> 
펼쳐보기
</summary>

```swift
private let depositQueue = OperationQueue()

depositQueue.maxConcurrentOperationCount = 2
    
depositQueue.addOperation {
    // 업무를 진행하는 메서드
}
```
- `Operation`은 GCD를 객체지향적으로 재탄생시킨 것입니다. Operation을 사용하면 동시성 프로그래밍과 관련된 모든 작업들은 Operation이라는 객체로서 만들어지게 됩니다.
- `Operation`과 `OperationQueue`에서는 객체지향적으로 설계를 했기 때문에 좀 더 세부적인 스케쥴링이 가능한 장점이 있습니다.<br><br>
- 💡 기존 GCD를 사용한 로직에서 초기화버튼을 클릭시, `DispatchQueue`의 Thread의 작업을 취소하는 로직이 필요했습니다.
- `DispatchQueue`의 Thread 작업을 취소하기 위해서 `cancel()`과 `exit()`라는 메서드를 알아보았고, `DispatchQueue`의 Thread 작업을 취소하기 위해서는 `DispatchWorkItem`를 사용해야만 했습니다. 
- 하지만, `DispatchWorkItem`을 사용하게되면 클로저의 캡처리스트를 사용을 할 수가 없었기 때문에 작업관리가 쉬운 Operation Queue로 변경하였습니다.

</details>
    
    
## 🏔 트러블 슈팅 및 고민
### 🚀 DIP, DI 적용시 제네릭 처리
    
<details>
<summary> 
펼쳐보기
</summary>

**문제 👻**
- 가장 초기 POP를 진행후 DIP, DI를 사용하였을 때, 제네릭을 적용한 프로토콜의 타입을 명확히 선언해주지 않아 문제가 발생하였습니다.
```swift
extension Queueable {
    typealias Element = Client
    ...
}
```
- 문제는 `Queueable`프로토콜의 Element를 특정 타입으로 고정을 시켜야했었는데 위의 코드 처럼 고정을 시키게 된다면 확장성을 고려하여 만든 `Queueable`프로토콜이 특정 타입으로 밖에 사용이 될 수 없다는 것이었습니다. 

**해결 🔫**
```swift
protocol ClientQueueable: Queueable where Element == Client { }
```
- `ClientQueueable`이라는 프로토콜을 추가로 구현하여 해결하였습니다.
- `ClientQueueable`에서 `Queueable`을 채택하고 Element를 Client로 받게끔 구현하였습니다.
- 이렇게 한다면 기존의 `Queueable` 프로토콜은 여전히 여러 타입으로 사용이 가능하게끔 구현할 수 가 있었습니다.

</details>

### 🚀 기능분리
    
<details>
<summary> 
펼쳐보기
</summary>

**문제 👻**
- `Bank`, `BankWorker`, `BankManager`, `Client` 각각의 객체가 어떤 작업을 수행하고, 그 작업들의 기능 분리를 어디까지 해주어야 할지 결정하는데 문제가 있었습니다.
- 프로젝트에서 필수적으로 구현하라 요청받은 것은 은행원과 고객 뿐이었지만, 은행은 그외에 다른 일들도 처리해야 했습니다.

**해결 🔫**
- 각각의 객체가 하는 일을 OOP개념에 맞춰 기능 분리를 진행 해 보았습니다. 
- 전체적인 흐름을 담담하는 로직들은 `Bank`에서 구현을 하였습니다.
- 업무 처리는 `BankWorker`가 수행하고, `Client`가 차례대로 번호표를 가지는 방식으로 기능 분리를 해보았습니다.
- 또한 방문한 고객의 수, 업무시간 등을 체크하는 등 부가적인 로직들을 `BankManager`에서 구현하였습니다. 

</details>

### 💭 Node의 타입
    
<details>
<summary> 
펼쳐보기
</summary>
    
```swift
// Node
final class Node<Element> {
    private var data: Element
    private var next: Node<Element>?
}

// LinkedList
struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    mutating func append(data: Element) {
        let node: Node<Element> = Node(data: data)
        if count == 0 {
            head = node
        } else {
            tail?.setupNext(node: node)
        }
        
        tail = node
        count += 1
    }    
    
    mutating func removeFirst() -> Element? {
        let removedItem = head
        head = head?.nextNode
        count -= 1
        return removedItem?.nodeData
    }
}
```
**고민 🤔**
- Node의 타입을 Class와 Struct 중 무엇이 더 적합한지에 대해서 고민하였습니다.
- `Node` 내부에서 `next`라는 `Node`타입 프로퍼티를 설정해줘야했고, `LinkedList`에서 `append(data:)`, `removeFirst()` 하는 과정에서 `head`와` tail`의 참조값을 지속적으로 바꿔줘야 했기 때문에 `Class가 더욱 적합하다`고 생각했습니다.

</details>
    
### 💭 Queue와 LinkedList의 관계
    
<details>
<summary> 
펼쳐보기
</summary>

**고민 🤔**
- 저희가 처음 코드를 작성할 때, LinkedList에 필요한 Node를 구현한 후 LinkedList를 구현하였습니다. 그 다음 프로젝트의 요구사항인 ClientQueue를 구현하였습니다.
이 ClientQueue를 구현하는 과정에서, LinkedList와 로직이 똑같아서 그냥 메서드의 이름만 바꿔주는 듯한 느낌을 받았습니다.

- 하지만 분리를 함으로써 `ClientQueue`에서 `Node`의 구조나 내부 데이터 값을 알 수 없게 때문에 `LinkedList`와 `ClientQueue`를 구분하지 않았을까 생각을 해보았습니다.
- 또한, ClientQueue가 가지고 있는 LinkedList로 데이터의 연결이 가능하다는 것을 알았고, 추후에 다른 기능으로의 확장성이 더 높아질 수 있다고 생각하였습니다.

</details>


    
### 💭 구조체 mutating 메서드와 클로저의 캡쳐에 대한 고민
    
<details>
<summary> 
펼쳐보기
</summary>

**고민 🤔**
1️⃣ 왜 mutating 메서드 내부에서 클로저 사용시 캡처리스트를 해야하는지 생각해보았습니다.
`mutating` 키워드를 사용하면 메서드가 자신의 어떠한 값이 변경될 수 있다는 뜻이고,
컴파일러의 입장에서 `@escaping` 클로저는 `mutating` 메서드의 호출이 끝난 이후에도 값을 참조하고 변경할 수 있으므로 오류를 발생시킵니다.
그러므로 캡쳐 리스트를 사용해 캡쳐가 할 시점을 명시해줌으로써 오류 해결한다고 생각합니다.
2️⃣ 클로저 내부에 `mutating` 메서드를 호출할 수 없는 이유에 대한 것도 생각해보았습니다.
`@escaping` 클로저가 외부의 값을 캡쳐해올 때 그 값은 상수로 캡쳐를 해오기 때문에
`mutating` 메서드가 붙은 메서드를 호출하려고 하면 상수로 선언된 구조체의 값을 변경할 수 있은 메서드를 호출하는 것이므로 클로저 내부에서 `mutating` 메서드를 호출하려고 하면 컴파일 오류가 발생합니다.   

</details>
    
### 🚀 Scroll View 오토레이아웃 세로 StackView 적용 ➡️ 가로 StackView 적용

<details>
<summary> 
펼쳐보기
</summary>

**문제 👻**
- 초기에 오토레이아웃을 상단 부를 잡고 `대기중 label`과, `ScrollView`, 내부의 `StackView`를 설정하고 이 3가지 Component를 잡을 큰 `StackView`를 생각하였습니다. 그리고 업무중 도 마찬가지로 오토레이아웃 설정을 하려했습니다.
- 하지만 이렇게 StackView를 설정하게 될 경우 내부적으로 `ScrollView`의 오토레이아웃을 설정할 때 내부의 제약조건을 불필요하게 걸어주어야 했습니다.
    
**해결 🔫**
- 더 편하게 오토레이아웃 제약을 주기 위해서 상단, 중단, 하단부를 각각의 Horizontal StackView로 잡아서 보다 편하게 해결할 수 있었습니다.
</details>
    
    
### 🚀 Waiting에서 Working으로 `Label` 이동
    
<details>
<summary> 
펼쳐보기
</summary>

**문제 👻**
- 대기중에서 업무중으로 변경 될 때, UI상에서 대기중의 `Label`은 업무중으로 이동시켜야했고, 업무중의 Label은 삭제를 해야했습니다.

**해결 🔫**    
- 이런 이벤트들을 실시간적으로 받기 위해서 `Notification`을 사용하였습니다.
- 그리고**대기중인 상태인지 업무중인 상태인지를 식별할 수 있는 값과 해당 label을 식별할 수 있는 client 객체**를 Controller에게 전달하는 로직을 구현하였습니다.
```swift
NotificationCenter.default.post(name: .client,
                                object: client,
                                userInfo: ["WorkState" : WorkState.start])
// 실행할 메서드 및 로직
NotificationCenter.default.post(name: .client,
                                object: client,
                                userInfo: ["WorkState" : WorkState.done])
```    
</details>

### 🚀 StackView에서 삭제가 돌 Label을 찾는 로직 구현

<details>
<summary> 
펼쳐보기
</summary>
    
**문제 👻**
- 대기중에서 업무중으로 변경 될 때, UI상에서 대기중의 `Label`은 업무중으로 이동시켜야했고, 업무중의 Label은 삭제를 해야했습니다.

**해결 🔫**    
- `StackViwe`쌓인 `Label`들 중 업무가 끝나서 삭제가 필요하거나, 대기중에서 삭제가 될 `Label`을 찾는 로직이 필요하였습니다.
- 복잡했던 logic들을 고차함수를 이용하여 점점 가독성을 높혔고, 최종적으로 고차함수와 `Label tag`를 이용하여 코드 line수를 줄여나갔습니다.
```swift
guard let labels = stackView.arrangedSubviews as? [UILabel],
let targetLabel = labels.filter({ $0.tag == ticketNumber }).first else { return }
targetLabel.removeFromSuperview()            
```
</details>   
    
### 🚀 Timer 비동기 문제

<details>
<summary> 
펼쳐보기
</summary>    
    
**문제 👻**
```swift
private func makeTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
        // UI를 업데이트 하는 로직 ..
    }
}

// 초기화 버튼을 누르면 다음 메서드가 실행    
private func resetTimer() {
    timer?.invalidate()
    mainView.timeLabel.text = "업무시간 - 00:00:000"
}
```
- 초기화 버튼을 누르면 `Timer`가 작업을 추가하는 걸 멈추도록 `invalidate()` 메서드를 호출하도록 구현 하였습니다.
- 하지만 초기화 버튼을 누르는 시점이 `Timer`가 만든 코드 블럭의 처리가 완료되지 않은 시점일 경우, UI가 제대로 초기화 되지 않는 문제가 있었습니다.

**해결 🔫**
```swift
private func resetTimer() {
    timer?.invalidate()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
        self.mainView.timeLabel.text = "업무시간 - 00:00:000"
    }
}
```
- 이는 초기화 버튼을 누를 때, 타이머가 생성한 코드블럭이 아직 작동중이어서 생기는 문제점이었습니다. 
- 이를 해결하기 위해, UI를 초기화 하는 로직을 0.001초 후에 실행되도록 하여 초기화 버튼을 누르는 시점이 `Timer`의 코드블럭이 실행되는 중이더라도 제대로 초기화가 되도록 구현하였습니다.

</details>
    
## 📝 일일 스크럼

[일일 스크럼 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/3.-Bank-Manager-Scrum)

## 🔗 참고 링크

[공식문서]

- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)
