# 🏦 은행 창구 매니저

- 은행 창구 시뮬레이션입니다.
- 사용자의 입력을 받아 은행을 개점하면 10명~30명의 손님이 방문합니다.
    - 손님의 업무는 예금업무 혹은 대출업무로 랜덤하게 지정됩니다.
- 예금업무를 처리하는 은행원은 2명, 대출업무를 처리하는 은행원은 1명입니다.
    - 예금업무를 처리하는 은행원은 업무처리에 0.7초가 소비되고, 대출업무를 처리하는 은행원은 업무처리에 1.1초를 소비합니다.
    - 세명의 은행원은 동시에 업무를 시작합니다.
    - 각 은행원은 손님마다 업무시작과 업무마감을 출력합니다. 
- 모든 고객의 업무가 끝나면 업무마감을 알리고 총 걸린 시간을 출력합니다. 

## 📖 목차
1. [팀 소개](#-팀-소개)
2. [기능 소개](#-기능-소개)
3. [Diagram](#-diagram)
4. [폴더 구조](#-폴더-구조)
5. [타임라인](#-타임라인)
6. [프로젝트에서 경험하고 배운 것](#-프로젝트에서-경험하고-배운-것)
7. [트러블 슈팅](#-트러블-슈팅)
8. [참고 링크](#-참고-링크)

## 🌱 팀 소개
 |[inho](https://github.com/inho-98)|[써니쿠키](https://github.com/sunny-maeng)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/107384230?v=4">|

## 🛠 기능 소개
|<img src="https://i.imgur.com/Qfi8qrR.gif" width=400>|<img src="https://i.imgur.com/zEMB0T0.png" width=350>|
|:-:|:-:|
|**1 입력시 실행화면**|**잘못된 입력과 2 입력시 실행화면**|

## 👀 Diagram
|<img width=900, src="https://i.imgur.com/401PAu7.png)">|
|---|

## 🗂 폴더 구조
```
BankManagerConsoleApp
├── BankManagerConsoleApp
│   ├── main
│   ├── Customer
│   ├── BankClerk
│   ├── Bank
│   ├── BankManager
│   ├── BankingType
│   ├── Queue
│   │   ├── Node
│   │   ├── LinkedList
│   │   └── Queue
│   └── Protocol
│       └── Servable
├── LinkedListTest
│   └── LinkedListTest
└── QueueTest
    └── QueueTest
```

## ⏰ 타임라인

### 👟 Step 1
|날짜|구현 내용|
|--|--|
|22.10.31|`Node`&`LinkedList`&`Queue`타입 구현, 유닛 테스트 작성, `Cocoapods`를 이용한 `SwiftLint`적용|
|22.11.2|`gitignore`파일 추가, 소스코드가 담긴 `Pods`파일 삭제|
<details>
<summary>Details - 구현 내용과 기능 설명 </summary>

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
|날짜|구현 내용|
|--|--|
|22.11.2|`Customer`&`Bank` 타입 구현 및 내부 로직 수정|
|22.11.3|`BankManager`타입 구현 및 `Bank`의 기능 옮기기, 각 타입의 네임스페이스 구현 및 접근 제어 수정|
|22.11.4|`BankManager`에서 `CustomerQueue`대신 `Customer`만 전달하도록 수정,`String)(format:)`이용하여 네임스페이스 구현방법 수정|
<details>
<summary>Details - 구현 내용과 기능 설명</summary>
    
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

### 👟 Step 3
|날짜|구현 내용|
|--|--|
|22.11.7|`BankingType`&`DepositBankClerk`&`LoanBankClerk`타입 구현 및 `BankClerk`프로토콜 구현|
|22.11.8|`Bank`와 `BankManager`로직 변경 및 `main`실행부 구현, </br> `BankClerk`->`Servable`프로토콜로 변경 `DispatchGroup` 적용, `Date()`를 이용한 업무 시간 출력 구현|
|22.11.9|`BankingType`을 랜덤하게 생성하는 로직 변경, `Bank`의 함수 네이밍수정|

<details>
<summary>Details - 구현 내용과 기능 설명</summary>
    
### 1️⃣ `Servable`
- 은행에서 손님을 응대할 때 필요한 특징과 기능을 모아둔 프로토콜 입니다. 일처리하는 시간을 나타내는 `Double`타입과 은행 창구를 나타내는 시리얼큐인 `DispatchQueue`타입의 프로퍼티를 가지고 있습니다.
    - `serve(customer: Customer, group: DispatchGroup)`: 전달받은 손님에 대해서 비동기로 업무를 처리합니다.
    
### 2️⃣ `BankClerk`
- `Servable`프로토콜을 채택하고 있어, 프로토콜이 제공하는 기본 구현들을 사용할 수 있습니다.`BankingType`을 프로퍼티로 가지고, 자신의 은행업무 타입과 일치하는 손님을 상대하는 역할을 합니다.
### 3️⃣ `BankingType`
- 은행업무의 종류를 나타내기 위한 열거형입니다.
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
    ☑️ String(format:)을 이용해 변수를 포함한 네임스페이스 구현하기 </br></br>
- 동시성 프로그래밍 이해 및 구현 (Concurrency Programming)</br>
    ☑️ GCD(Grand Central Dispatch)활용해 멀티 스레드 환경 구현하기</br>
    ☑️ 동기(Synchronous)와 비동기(Asynchronous) 동작의 이해와 적용</br>
    ☑️ Race Condition(경쟁 상황) 해결하기 - `SerialQueue` 활용 / `DispatchSemaphore`활용</br></br>
- POP (Protocol Object Programming)</br>
    ☑️ Protocol의 Extension에 기본구현(Defalult Implementation)하기</br>
    ☑️ Protocol 채택으로 특정 타입에 기능 부여하기</br> 

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
    
### 5️⃣ `RaceCondition`해결방법 -`DispatchSemaphore` / `serialQueue`
- `BankClerk` 3명이 `Queue`에 담긴 손님(업무)을 동시에 처리하게 하기위해서 `GCD`를 이용해 멀티쓰레드환경을 구현해주었습니다. 
- 이 과정 중에 하나의 데이터(`CustomersQueue`)에 동시에 접근하여 생기는 `RaceCondition`을 해결하기 위해서 여러가지 시도를 해보았습니다.</br></br>
- ✅ 👉 **`BankClerk`프로퍼티에 `serialQueue`사용**
    - RaceCondition을 해결하는 방법 중 하나인 `Async`상황에서 `SerialQueue`를 이용해 해결하는 방법을 적용했습니다.
    - 3명의 은행원들이 각자의 은행업무에 맞는 손님을 줄세워 차례대로 응대하기 위해 은행원의 프로퍼티로 본인의 작업대를 의미하는 `counter`를 추가하여 `DispatchQueue`로 만들었습니다. 
    - 이 때, 은행원은 한번에 한명의 손님을 처리할 수 있도록 `serial`큐로 초기화합니다.
    - Bank는 은행원들에게 `Async`하게 손님들을 배분 해 여러명의 은행원들이 동시에 고객을 처리하도록 합니다.
    - 은행원들은 본인의 `counter`에 줄서있는 직원을 한명씩 처리하는데 이 작업을 세명이 동시에 진행합니다.
        ```swift
         while !customers.isEmpty {
            bankClerks.forEach { bankClerk in
                guard let customer = customers.dequeue() else { return }

                bankClerk.serve(customer: customer, group: group)
                ...
            }
        }

        func serve(customer: Customer, group: DispatchGroup) {
            counter.async(group: group) { //counter는 자신의 시리얼 큐입니다.
                //업무 시작 및 종료 출력
            }
        }
        ```
- **☑️ 👉 `DispatchSemaphore`사용**
    <details>
        <summary>details</summary>

    - 동시에 처리할 수 있는 손님이 은행원 인원과 같기 때문에 `쓰레드 수 = 은행원 인원` 이라고 생각했습니다. 
    - `DispatchSemaphore`의 `value = 은행원 인원` 으로 지정하여 은행원 수만큼만 동시진행 될 수 있도록 구현했었습니다.
        ```swift
        struct Bank {
            let cumstomers: Queue<Customer> = Queue()
            let depositBankeClerks: [DopositBankClerk]// 2명
            let loanBankClerks: [LoanBankClerk]  // 1명 

            private mutating func startBanking() {
                let depositSemaphore = DispatchSemaphore(value: depositBankeClerks.count) // 2
                let loanSemaphore = DispatchSemaphore(value: loanBankClerks.count) // 1
                
                while !customers.isEmpty {
                    guard let customer = customers.dequeue() else {
                        return
                    }

                    DispatchQueue.global().async { [self] in
                        switch customer.bankingType {
                        case .deposit :
                            depositSemaphore.wait()
                         👉 DepositBankClerk.serveCustomer(number: customer.waitingNumber)  //손님 업무 시작과 끝프린트 출력하는 함수
                            depositSemaphore.signal()
                        case .loan:
                            loanSemaphore.wait()
                         👉 LoanBankClerk.serveCustomer(number: customer.waitingNumber) //손님 업무 시작과 끝프린트 출력하는 함수
                            loanSemaphore.signal()
                        }
                    }
                }
            }
        }

        struct DepositBankClerk {
            static func serveCustomer(number: Int) {
                // 손님 업무 시작과 끝을 Print하는 코드
            }
        }
        ```
    - 😵채택하지 않은 이유😵
        - 1) BankClerk의 인스턴스를 활용하지 않기 때문이었습니다.
            - BankClerk타입을 구현해놓고, `serveCustomer(number:)`로 손님을 처리하는 함수를 사용할 때, 은행원 각자의 인스턴스 메서드를 사용하지 못해서 의도한 방향과 다르다고 생각했습니다.
            - BankClerk의 인스턴스 메서드 대신 타입메서드를 사용하거나, 처리속도가 같기 때문에 BankClerk의 한명의 인스턴스 메서드를 이용해 구현 할 수 있지만, 추후에 예를들어, 같은 예금처리를 하는 BankClerk두 명의 처리속도가 서로 달라진다고 할 때 적용이 어려워지기 때문에 BankClerk의 각자의 인스턴스가 처리하는게 맞다고 생각했습니다.
        - 2) 1)의 문제로 애초에 BankClerk 타입 구현을 하지않고 (인스턴스를 생성할 일이 없게 되고), Bank 내부에서 각 은행원의 인원수를 Int로 갖는 프로퍼티를 구현하는 방법도 생각했었습니다. 하지만 객체지향 프로그래밍과 맞지 않다고 생각했습니다. </br></br>  
</details>

- **☑️ 👉 `serialQueue`사용 & `customers Queue` 분류없이 직접 처리하기**
    <details>
        <summary>details</summary>
    
    - 채택한 코드에서는 손님이 담겨있는 `Queue`를 은행업무 종류에 따라 `depositQueue`와 `loanQueue`로 다시 분류해서 `Queue`에 담아준 후 타입이 같은 은행원이 손님처리를 하는 로직인데 손님분류 없이 손님의 은행업무타입이 섞여있는 원래의 `Queue`에서 바로 손님처리를 할 수 있는 코드를 구현하고 싶었습니다. 
    - 처음엔 `bankClerk` 이 담긴 `Array`에 `forEach`를 사용해 업무타입을 `Switch`문으로 구분해서 손님을 처리하도록 구현해주었었습니다. 예금은행원 두명이 공평하게 반씩 차례로 손님을 처리하지 않고 중간에 대출손님이 껴있으면 순서가 꼬이는 문제가 있었습니다. 그래서 순서에맞게 손님을 처리하기 위해 `bankClerk Array`에서 한 은행원씩 차례로 불러줘야했습니다. 0부터 +1씩 올라가는 변수에 은행직원 인원보다 커지면 다시 0으로 돌아가도록 설정한 변수를 선언하고 `Array index`로 사용해 은행원이 번갈아가며 손님을 처리할 수 있도록 구현했었습니다.
        ```swift
        func serveCustomer() {
            let depositMaximun = depositBankClerk.count - 1
            let loanMaximum = loanBankClerk.count - 1
            var depositPossible: Int = 0 {
                didSet(oldValue) {
                    depositPossible = oldValue > depositMaximun ? 0 : oldValue
                }
            }
            var loanPossible: Int = 0 {
                didSet(oldValue) {
                    loanPossible = oldValue > loanMaximum ? 0 : oldValue
                }
            }
            
            while !customers.isEmpty {
                guard let customer = customers.dequeue() else {
                    return
                }

                switch customer.bakingType {
                case .deposit:
                    depositBankClerk[depositPossible].call(customer: customer)
                    depositPossible += 1
                case .loan:
                    loanBankClerk[loanPossible].call(customer: customer)
                    loanPossible += 1
                }
            }
        }

        struct banker {
            func call(customer: Customer) {
                counter.async(group: group) {
                    // 손님 업무 시작과 끝을 Print하는 코드
                }
            }
        }
        ```
    - 😵채택하지 않은 이유😵
        - 이 시도는 `customers Queue`를 `BankingType`별로 분류해 다시 두개의 `Queue`(예금별, 대출별)를 생성하는 작업을 하지 않기 위해 시도해본 코드였는데, 작성 후에 비교해보니 `Queue`를 분류해서 처리하 코드가 더 깔끔하고 보기 좋은 것 같다고 판단해서 채택하지 않았습니다.  
    </details>


### 6️⃣ `Servable`프로토콜과 익스텐션의 활용(POP)
- 은행원의 업무를 `손님을 응대할 수 있는`기능이라 판단했고, 이 기능이 코드를 작성하는 중간에 재사용되기도 하여 프로토콜로 분리하였고, `extension`을 통해 기본 구현을 추가했습니다. 이 프로토콜 내에는 은행원이 손님을 응대하는 과정에 필요하다고 생각한 요소들을 포함하였습니다.
- `counter: DispatchQueue`: 은행 창구를 나타내면서, 코드 실행중에는 비동기로 작업을 처리하기 위한 요소입니다. 은행원은 한번에 한명의 손님을 처리해야 하고, 순서가 중요하기 때문에 해당 큐를 `serial`로 초기화 하였습니다.
- `serve(customer:, group:)`: 매개변수로 받은 손님을 자신의 시리얼 큐로 비동기 처리한 후, 고객과 업무종류를 출력하고, 처리하는 기능을 합니다.
    ```swift
    protocol Servable {
        var processingTime: Double { get }
        var counter: DispatchQueue { get }
        func serve(customer: Customer, group: DispatchGroup)
    }

    extension Servable {
        func serve(customer: Customer, group: DispatchGroup) {
            counter.async(group: group) {
                print("\(customer.waitingNumber)번 고객 \(customer.bankingType.name)업무 시작")
                ...
            }
        }
    }
    ```

### 7️⃣ `Command Line Tool`에서 `main`스레드의 런루프가 종료되는 문제
- 프로젝트를 실행할때, `DispatchQueue.main.async`가 작동되지 않고, 다른 스레드의 비동기 작업도 끝까지 기다리지 않고 프로그램이 종료되는 문제가 있었습니다. 찾아보니 `iOS`에서는 `main run loop`를 자동으로 설정해 주지만, `macOS`의 `CLT`환경에서는 그렇지 않아서 코드가 끝나기 전에 종료되었습니다.
- 이를 해결하기 위해 처음에는 `Runloop.main.run(until:)`메서드를 활용했지만, 매개변수에 필요한 시간값이 미리 계산할 수 없는 문제가 있었습니다.
- 최종적으로 사용한 코드는 기다려야 하는 작업들을 `DispatchGroup`으로 묶어서 해당 그룹을 기다리는 `group.wait()`메서드를 이용해서 의도하는 결과를 출력할 수 있었습니다.
    ```swift
    let group = DispatchGroup()

    matchClerk(to: &customers.deposit, of: .deposit, group: group)
    matchClerk(to: &customers.loan, of: .loan, group: group)
    group.wait()
    ```

### 8️⃣ 은행 업무시간을 계산하기 위한 `Date()`와 `timeIntervalSinceNow`
- 은행 업무에 소요된 시간을 계산해야 했습니다. 고민한 부분은 "업무 시작 시간을 언제로 볼것인가" 였습니다. `Bank`의 인스턴스를 만드는 시점에 초기화할 수도 있지만, 저희가 구현한 기능 중 손님을 외부에서 받는 `receive(customer)`메서드와 손님을 업무종류에 따라 분류하는 `sortCustomer()`메서드 중간이 업무 시작시간으로 적합하다 판단하여 해당 시점을 기준으로 합니다. 
- 총 업무 시간은 `DispatchGroup`으로 지정한 업무들이 종료되는 것을 기다리는 `group.wait()`이후에 `Date`의 `timeIntervalSinceNow`프로퍼티를 이용하여 계산하였습니다.

### 9️⃣ `BankingType`을 랜덤으로 생성하는 방법
- 손님마다 은행업무 종류를 랜덤하게 생성하기 위한 방법으로 처음에는 `rawValue`와 `BankingType(rawValue: Int.random(1...2)`를 이용하여 구현하였습니다.
- `rawValue`를 이용하지 않는 방법을 고민하다가 `CaseIterable`의 `allCases`를 사용했습니다. </br></br>
- **코드 변경 내용** </br>
    ☑️ 수정 전 
    - `rawValue`를 이용한 방법입니다.
    ```swift
    for count in 1...customerCount {
        guard let bankingType = BankingType.init(rawValue: Int.random(in: 1...2)) else { return }

        let customer = Customer.init(waitingNumber: count, bankingType: bankingType)
        bank.receive(customer: customer)
    }
    ```
    ✅ 수정 후
    - `CaseIterable`의 `allCases`와 `randomElement()`를 이용한 방법입니다.
    ```swift
    for count in 1...customerCount {
        guard let bankingType = BankingType.allCases.randomElement() else { return }
            
        let customer = Customer.init(waitingNumber: count, bankingType: bankingType)
        bank.receive(customer: customer)
    }
    ```

## 🔗 참고 링크

[공식문서]
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Protocol Oriented Programming](https://developer.apple.com/videos/play/wwdc2015/408/)
- [sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [Date](https://developer.apple.com/documentation/foundation/date)
- [timeIntervalSinceNow](https://developer.apple.com/documentation/foundation/date/1780473-timeintervalsincenow)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)

[그 외 참고문서]
- [Thread.sleep and DispatchQueue.asyncAfter](https://www.advancedswift.com/delay-function-sleep-thread-swift/)
- [블로그-String(format:)](https://beepeach.tistory.com/53) 
- [블로그(날진)-[iOS] 차근차근 시작하는 GCD — 1~17](https://sujinnaljin.medium.com/ios-%EC%B0%A8%EA%B7%BC%EC%B0%A8%EA%B7%BC-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-gcd-grand-dispatch-queue-1-397db16d0305)
- [야곰닷넷 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming)
- [코드스쿼드-조성규POP 특강](https://youtu.be/9gkzHUsQiUc)
