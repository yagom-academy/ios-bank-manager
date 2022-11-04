

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

[Ground Rule 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/Ground-Rule)

## 🖋 Code Convention

[Code Convention 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/Code-Convention)

## 🛠 실행 화면
|**실행 화면**|
|---|
|<img width = 300, height = 600, src = "https://user-images.githubusercontent.com/59204352/199897630-26888271-e159-45e0-ba11-935a15eb8161.gif">|
 


## 👀 Diagram

### 🧬 Class Diagram
![](https://i.imgur.com/3xFD1CQ.png)

 
## 🗂 폴더 구조
> BankManagerConsoleApp: 앱을 구동하는 부분<br>
> BankManagerConsoleAppTests: 앱 내부 로직의 Unit Test 부분
```
BankManagerConsoleApp
├── BankManagerConsoleApp
│   ├── main
│   ├── Extension
│   │   └── Queueable+
│   ├── Protocol
│   │   ├── Queueable
│   │   └── ClientQueueable
│   └── Models
│       ├── Bank
│       │   ├── Bank
│       │   ├── BankWorker
│       │   └── BankManager
│       ├── Client
│       └── Data Structure
│           ├── Node
│           ├── LinkedList
│           └── ClientQueue
└── BankManagerConsoleAppTests
    ├── NodeTests
    ├── LinkedListTests
    └── ClientQueueTests
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

## 📝 일일 스크럼

[일일 스크럼 바로가기](https://github.com/KyoPak/ios-bank-manager/wiki/Bank-Manager-Scrum)

## 🔗 참고 링크

[공식문서]

- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)
