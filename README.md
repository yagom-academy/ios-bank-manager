# 🏦 은행 창구 매니저

- 은행 창구 시뮬레이션입니다.
- 사용자의 입력을 받아 은행을 개점하면 10명~30명의 고객이 방문하고 은행은 고객의 업무를 처리합니다.

## 📖 목차
1. [팀 소개](#🌱-팀-소개)
2. [기능 소개](#🛠-기능-소개)
3. [Diagram](#👀-Diagram)
4. [폴더 구조](#🗂-폴더-구조)
5. [타임라인](#⏰-타임라인)
6. [프로젝트에서 경험하고 배운 것](#✅-프로젝트에서-경험하고-배운-것)
7. [트러블 슈팅](#🚀-트러블-슈팅)
8. [참고 링크](#🔗-참고-링크)


## 🌱 팀 소개
 |[inho](https://github.com/inho-98)|[써니쿠키](https://github.com/sunny-maeng)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/107384230?v=4">|

## 🛠 기능 소개
|<img src="https://i.imgur.com/WovxYqy.png" width=350>|<img src="https://i.imgur.com/zEMB0T0.png" width=350>|
|:-:|:-:|
|**1 입력시 실행화면**|**잘못된 입력과 2 입력시 실행화면**|

## 👀 Diagram
|<img width=800, src="https://i.imgur.com/gifeNor.png">|
|---|

## 🗂 폴더 구조
```
BankManagerConsoleApp
├── BankManagerConsoleApp
│   ├── main
│   ├── Node
│   ├── LinkedList
│   ├── Queue
│   ├── Customer
│   ├── Bank
│   └── BankManager
├── LinkedListTest
│   └── LinkedListTest
└── QueueTest
    └── QueueTest
```

## ⏰ 타임라인

### 👟 Step 1
- `Node` 클래스
- `LinkedList` 구조체
- `Queue` 구조체
<details>
<summary>Details</summary>

#### 1️⃣ Node 
- `Generics` 타입의 데이터를 담을 `data`프로퍼티와 다음 노드 정보를 나타내는 `next`프로퍼티를 생성하였습니다.
#### 2️⃣ LinkedList
- 큐 타입 구현을 위한 `LinkedList`타입을 구현했습니다.
- 첫번째와 마지막 노드를 담는 `head`, `last`프로퍼티를 생성하였습니다.
- 큐에 필요한 기능을 구현하기 위한 메서드들을 가지고 있습니다.
    - `append(datda:)`
    - `removeFirst()`
    - `removeAll()`
#### 3️⃣ Queue
- 다양한 타입의 데이터를 담을 수 있도록 Generics를 이용하였습니다.
- 구현해야할 필수 기능들을 구현했습니다.
    - `isEmpty` 
    - `claer()`
    - `enqueue()`
    - `peek()` : 삭제없이 첫번째 노드의 데이터를 확인합니다.
    - `dequeue()`: 첫번째 노드를 삭제하고, 해당 데이터를 리턴합니다.
</details>

    
### 👟 Step 2
- `BankManager` 구조체
- `Bank` 구조체
- `Customer` 구조체
<details>
<summary>Details</summary>
    
### 1️⃣ `BankManager`
- `Bank`와 `Customer`를 생성하고, 프로그램 실행 및 사용자 입력을 받는 메서드를 가지고 있는 타입으로 전체 실행을 담당합니다.
    - `startManagement()`: 메뉴를보여주고 사용자 입력에 따라 (1)은행문을열거나 (2)종료합니다.
    - `setupBank()`: 은행 객체를 만들고, 은행업무를 진행하기위한 준비 후 은행문을 엽니다.
    - `addCustomer(to bank: Bank)`: 10~30명 사이 고객을 은행에 전달합니다.
    - [enum] `Constant` : BankManager의 네임스페이스입니다.
### 2️⃣ `Bank`
- 고객 큐와 은행 업무처리에 관련된 메서드들을 가지고 있는 타입입니다. 
    - `openBank()`: 은행의 문을 엽니다
    - `receive(customer: Customer)`: 손님을 받아 손님 큐에 추가합니다.
    - `startBanking()`: 은행의 업무를 시작합니다.
    - `serveCustomer(number: Int)`: 손님을 한명씩 응대합니다.
    - `closeBanking()`: 은행 업무의 마감을 알립니다.
    - [enum] `Constant` : Bank의 네임스페이스입니다.
### 3️⃣ `Customer`
- 고객을 나타내는 타입으로 프로그램에서 필요한 대기번호를 프로퍼티로 가지고있습니다.
</details>


## ✅ 프로젝트에서 경험하고 배운 것
- 단방향 `Linked-list` 자료구조의 이해 및 구현 </br>
     ☑️ 단방향 연결리스트를 코드로 구현해보기 </br>
     ☑️ `Generic Type` 이해와 적용하기 </br></br>
- `Queue`의 자료구조의 이해 및 구현 </br>
     ☑️ `Linked List`를 이용한 `Queue` 타입 코드로 구현해보기 </br>
     ☑️ `Generic Type` 개념이해와 적용하기 </br>
     ☑️ 은행 고객(Customer)업무 처리를 Queue에 담아 차례대로 처리하기 </br></br>
- Enum을 이용한 namespace </br>
     ☑️ enum의 인스턴스생성이 불가능한 점을 이용해 `static let`으로 네임스페이스구현하기 </br>
     ☑️ String(format:)을 이용해 변수를 포함한 네임스페이스 구현하기 </br>

## 🚀 트러블 슈팅
### 1️⃣ `Bank`의 역할분리에 따른 `BankManager`타입 구현
- 기존에는 메뉴를 보여주고, 사용자 입력을 받는 기능과 손님을 만드는 기능을 `Bank`타입에서 수행하였습니다.
- 이 기능들은 `Bank`의 역할이 아니라고 생각되어 이를 관리하는 `BankManager`타입을 구현하였습니다.
- `BankManager`는 메뉴를 보여주고, 사용자입력에 따라서 `Bank`와 `Customer큐`를 생성하고 코드진행을 결정합니다.
    ```swift
    struct BankManager {
        mutating func startManagement() {
            //실행 매뉴얼 출력
            print(Constant.options, terminator: Constant.empty)
            //사용자 입력        
            guard let input = readLine() else { return }
            ...
        }
    }
    ```
### 2️⃣ `Bank`와 `Customer Queue`의 분리에 따른 각 인스턴스 생성 방법
- 기존에는 `Bank`타입 내에서 `Queue<Customer>`를 생성하여 자신의 프로퍼티에 전달하는 방식을 이용했습니다.
- 위와 같이 구현하면 `Customer`타입은 `Bank`인스턴스가 있을때만 존재한다는 문제가 있었습니다.
- 따라서 `BankManager`에 10~30명으로 이루어진 손님의 인스턴스를 생성하고, `bank`인스턴스에 전달하는 `addCustomer`메서드를 구현했습니다.
- 손님을 전달받은 `bank`는 자신이 가지고 있는 큐에 손님을 추가합니다.
    ```swift
    struct BankManager {
        private mutating func setupBank() {
            var bank = Bank() //bank인스턴스 생성
            
            addCustomer(to: &bank) //bank에 customer를 전달
            bank.openBank()
        }

        private mutating func addCustomer(to bank: inout Bank) {
        let customerCount = Int.random(in: Constant.customerRange)
        
        for count in 1...customerCount {
            let customer = Customer.init(waitingNumber: count)
            bank.receive(customer: customer)
            }
        }
    }
    ```
### 3️⃣ `bank`내부 메서드 접근제어 설정에 따른 내부 로직 변경
- 기존에는 은행의 작업을 시작하고 끝내는 메서드인 `startBanking`과 `closeBanking`를 타입 외부인 `BankManager`에서 `bank`를 생성한뒤 각각 호출했습니다.
- 두 메서드를 타입 외부에서 호출할 수 있는게 좋지 않은 방향이라고 생각했습니다. 게다가 작업이 끝났음을 알려주는 `closeBanking`메서드를 직접 호출하면 코드를 누락하는 휴먼이슈도 있다고 생각했습니다. 은행의 작업이 끝나면 자동으로 메서드가 호출될수 있는 방법을 고민했습니다.
- 위 두가지 고민을 해결하기 위해 `Bank`타입에 `isOpen`프로퍼티와 `openBank`메서드를 생성하고, `isOpen`프로퍼티에 프로퍼티 옵저버를 적용해 `didSet`값에 따라 은행이 문을 열면 `startBanking`, 마감하면 `closeBanking`이 호출되도록 수정하였습니다. 타입 외부에서는 `openBank`메서드만 호출합니다. </br></br>
- **코드 변경 내용** </br>
    ☑️ 수정 전 
    - 타입 외부에서 메서드 접근이 가능했습니다.
    ```swift
    struct BankManager {
        ...
        private mutating func setupBank() {
            var bank = Bank() 
            
            addCustomer(to: &bank) 
            bank.startBanking()
            bank.closeBanking()
        }
    }
    ```
    ✅ 수정 후
    - `isOpen`프로퍼티를 이용해 외부에서는 `OpenBank` 메서드로만 은행에 접근해도 은행의 업무는 자동으로 시작되고 마감합니다.
    ```swift
    struct BankManager {
        ...
        private mutating func setupBank() {
            var bank = Bank()

            addCustomer(to: &bank)
            bank.openBank()
        }
    }

    struct Bank {
        ...
        private var isOpen: Bool {
            didSet {
                isOpen ? startBanking() : closeBanking()
            }
        }

        private mutating func serveCustomer(number: Int) { ... }
        private func closeBanking() { ... }
    }
    ```
    
### 4️⃣ 네임스페이스에 변수를 포함하기 위한 `String(format:)`
- 네임스페이스를 생성하여 문자열을 묶어서 관리하려 할때, 특정 구문은 변수를 포함하고 있었습니다.
- 기존에는 클로저를 이용하여 원하는 변수를 전달했습니다.
- 리뷰어님의 조언으로 `String(format:, _:)`를 알게되어 적용했습니다.</br></br>
- **코드 변경 내용** </br>
    ☑️ 수정 전 
    - 클로저를 이용해 변수를 포함하는 네임스페이스입니다.
    ```swift
    enum Constant {
        static let startMessage = { ( number: Int ) -> String in
            return "\(number)번 고객 업무 시작"
        }
    }
 
    // 사용
    func serveCustomer(number: Int) {
        print(Constant.startMessage(number))
    } 
    ```
    ✅ 수정 후
    - `String(format:, _:)`을 이용해 변수를 포함하는 네임스페이스입니다.
    ```swift
    enum Constant {
        static let startMessage = "%d번 고객 업무 시작"
    }

    //사용
    private mutating func serveCustomer(number: Int) {
        print(String(format: Constant.startMessage, number))
    }
    ```

## 🔗 참고 링크

[공식문서]
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Protocol Oriented Programming](https://developer.apple.com/videos/play/wwdc2015/408/)
- [sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)

[그 외 참고문서]
- [Thread.sleep and DispatchQueue.asyncAfter](https://www.advancedswift.com/delay-function-sleep-thread-swift/)
- [String(format:)](https://beepeach.tistory.com/53) 
