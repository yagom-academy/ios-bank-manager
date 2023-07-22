
# 🏦 은행 창구 매니저 _ 웰시코딩🐶


## 📖 목차
🍀 [소개](#소개) </br>
👨‍💻 [팀원](#팀원) </br>
⏱️ [타임라인](#타임라인) </br>
👀 [시각화된 프로젝트 구조](#시각화된_프로젝트_구조) </br>
💻 [실행 화면](#실행_화면) </br>
🧨 [트러블 슈팅](#트러블_슈팅) </br>
📚 [참고 링크](#참고_링크) </br>
👥 [팀 회고](#팀_회고) </br>

</br>

## 🍀 소개<a id="소개"></a>
한 명의 직원을 가진 은행이 10 ~ 30명의 고객을 받아 응대하는 프로그램입니다.

</br>

## 👨‍💻 팀원<a id="팀원"></a>
| 🐬Whales🐬 | 🍎Zion🍎 |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/BJF3FzK53.png" width="190"> | <Img src = "https://hackmd.io/_uploads/ry9ZHwRt2.png" width="200"> |
|[Github Profile](https://github.com/WhalesJin) |[Github Profile]() |

</br>

## ⏱️ 타임라인<a id="타임라인"></a>
|날짜|내용|
|:--:|--|
|2023.07.10| - Node 클래스 생성 <br> - LinkedList 구조체 생성 <br> - LinkedList Test 진행 |
|2023.07.11| - Queue 구조체 생성 |
|2023.07.12| - Client 구조체 생성 <br> - BankManager 구조체 생성 <br> - Bank 클래스 생성 |
|2023.07.13| - 업무완료 메세지 로직 추가 <br> - 파일 구조정리 |
|2023.07.14| - usleep 메서드를 Thread.sleep 메서드로 수정 |
|2023.07.15| - WorkType 중첩 열거형 생성 |
|2023.07.20| - WorkType을 BankType으로 네이밍 수정 및 파일 분리 <br> - Bank 클래스의 startTask 메서드가 은행 업무 종류별로 수행할 수 있도록 수정 |

</br>

## 👀 시각화된 프로젝트 구조<a id="시각화된_프로젝트_구조"></a>

### ℹ️ File Tree
    ┌── ios-bank-manager
    │   ├── BankManagerConsoleApp
    │   │   ├── Model
    │   │   │   ├── Queue
    │   │   │   │   ├── Node
    │   │   │   │   ├── LinkedList
    │   │   │   │   ├── Queue
    │   │   │   └── Bank
    │   │   │       ├── BankingType
    │   │   │       ├── Client
    │   │   │       ├── BankManger
    │   │   │       └── Bank
    │   │   └── main
    │   └── Tests
    └── README.md

### 📐 Diagram
<p align="center">
    
<img width = "600" src = "https://hackmd.io/_uploads/BkHhdPDc3.png"> <br>

</p>

## 💻 실행 화면<a id="실행_화면"></a>
<img src = "https://hackmd.io/_uploads/BJQvBwRFn.gif" width = "450">
</br>
<img src = "https://hackmd.io/_uploads/Bk90PKL52.gif" width = "455">


## 🧨 트러블 슈팅<a id="트러블_슈팅"></a>
### 1️⃣ `Escaping closure captures mutating 'self' parameter` Error
🚨 **문제점** <br>
Bank Type을 struct로 설정하여 Closure 내부에서 Capture시 Closure내부의 Bank와 클로저 외부의 Bank가 동일하지 않아 경고 문구가 노출 되었습니다.
<br>

💡 **해결방법** <br>
```swift
DispatchQueue.global().async(group: group) {
                self.bankManger.work(client: client)
                semaphore.signal()
            }
```
현재 `Bank Type`의 `startTask` 로직 내부에서는 `Bank Type`의 내부 변수에 접근하는 `async`로직이 존재합니다. 따라서 `Bank Type`을 `struct`로 설정하게 된다면 `async`가 등록될 때의 `Bank`와 `async block` 내에서 `capture` 될 때에의 `Bank`가 서로 다른 `Bank` 일 수 있습니다. 

그 이유는 일반적으로 클로저 내에서 값을 캡쳐했을 때에는 값 타입이든 참조 타입이든 `Strong Reference` 형태로 값을 참조하지만 값 타입의 경우에는 복사된 값에 대한 주소 값을 참조하기 때문에 `async`로 등록할 때의 `Bank`와 실질적으로 `async block`이 실행될 때의 `Bank`가 같은 `Bank`임을 보장할 수 없기 때문입니다. 

따라서 `Bank`를 `Class` 참조 타입으로 설정하여 참조할 수 있도록 변경했습니다. 또한 `Strong Reference` 참조를 하게된다면 순환참조의 가능성에대해 고민해봤지만 위와 같은 경우에서는 `async block`에서는 `Bank`를 참조하고 있지만 `Bank`에서는 해당 `async block`을 직접적으로 참조하고 있지않으므로 순환참조가 발생하지않기 때문에 `[weak self]`의 캡쳐키워드는 생략했습니다.

<br>

### 2️⃣ `DispatchQueue vs OperationQueue`
🚨 **문제점** <br>
DispatchQueue와 OpeartionQueue 중 어떤 방식으로 문제를 해결할지 고민했습니다.
<br>

💡 **해결방법** <br>
OperationQueue를 활용하여 구현했습니다.

`DispatchQueue`을 활용해 해당 요구사항을 구현하는 방법으로는 `DispatchGroup` 및 `DispatchSemaphore`를 활용하는 방법이 있었고 `OperationQueue`를 활용한다면 `maxConcurrentOperationCount` property 및 `waitUntilAllOperationsAreFinished` 메서드의 활용으로 과제를 해결할 수 있었습니다.

`Thread`생성을 직접적으로 제한할 수 있는 `DispatchSemaphore`을 사용하여 쓰레드의 생성까지 객체지향적으로 접근할 수 있는 `DispatchQueue`를 사용하려 했습니다만, `MainThread`를 멈추지 않고 `Semaphore`를 `wait`하기 위해서는 또 다른 `Thread`가 필요하다는 사실을 알게 되었고 이렇게 구현한다면 원래의 의미가 퇴색된다고 생각했기 때문에 사용하기도 쉽고 `cancel`에 대한 동작도 쉬운 `Operation Queue`를 통해 동작 구현을 완료했습니다.

<details>
    <summary> DispatchQueue 코드 </summary>
    
```swift
private func startTask() {
    let group = DispatchGroup()
    let clientCount = Int.random(in: 10...30)
    let startTime = Date()
    let depositSemaphore = DispatchSemaphore(value: depositBankManagerCount)
    let loanSemaphore = DispatchSemaphore(value: loanBankManagerCount)
    var workSemaphore: DispatchSemaphore

    setUpClientQueue(count: clientCount)

    while !clientQueue.isEmpty {
        guard let client = clientQueue.dequeue() else { break }
        workSemaphore = client.banking == .deposit ? depositSemaphore : loanSemaphore

        workSemaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.bankManger.work(client: client)
            workSemaphore.signal()
        }
    }

    group.wait()
    printTaskResult(clientCount, startTime)
    open()
}
```
</details>
</br>

프로젝트를 진행하다보니 콘솔창의 스레드 동작이 요구사항과 맞지 않게 작동하는 것을 보고 `DispatchQueue`의 한계를 느껴 `Operation`으로 다시 작업의 방향을 바꾸었습니다.

<details>
    <summary> OperationQueue 코드 </summary>
    
```swift
private func startTask() {
    let clientCount = Int.random(in: 10...30)
    let startTime = Date()
    let depositOperationQueue = OperationQueue()
    let loanOperationQueue = OperationQueue()
    var operationQueue: OperationQueue
    var operation: BlockOperation

    depositOperationQueue.maxConcurrentOperationCount = depositBankManagerCount
    loanOperationQueue.maxConcurrentOperationCount = loanBankManagerCount
    setUpClientQueue(count: clientCount)

    while !clientQueue.isEmpty {
        guard let client = clientQueue.dequeue() else { break }

        operation = BlockOperation { self.bankManger.work(client: client) }
        operationQueue = client.banking == .deposit ? depositOperationQueue : loanOperationQueue
        operationQueue.addOperation(operation)
    }

    depositOperationQueue.waitUntilAllOperationsAreFinished()
    loanOperationQueue.waitUntilAllOperationsAreFinished()
    printTaskResult(clientCount, startTime)
    open()
}
```
</details>

물론 같은 결과물을 나타냈겠지만 조금 더 객체지향에 대해서 고민해볼 수 있어서 좋았습니다.

<br>

### 3️⃣ 값 타입이 `Mutating`이 될 때 수정된 값으로 재할당이 이뤄지는가
🚨 **문제점** <br>
값 타입에서 `Mutating` 키워드가 붙을 때 즉, 타입 내부에서의 값이 수정되었을 때 실질적으로 메모리에 메모리에 저장되는 방식을 고민했습니다.
</br>

💡 **해결방법** </br>
`Mutating`을 나타내는 공식문서에서는 
> The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.

위와 같이 표현되어있지만 해당 글만으로는 확실히 `mutating`이 수정된 값을 반드시 재할당하는 지에 대한 답이 충분히 되지 않았습니다. 조금은 애매한 표현이었다고 생각합니다. 따라서 조금더 해당 관련 지식에 확신을 줄 수 있는 자료를 찾아보던 중 https://github.com/apple/swift/blob/main/docs/MutationModel.rst
`swift`의 `openSource`에 나와있는 자료를 찾게 되었고 그 결과
> The implicit self parameter of a struct or enum method is semantically an inout parameter if and only if the method is attributed with mutating. Read-only methods do not "write back" onto their target objects.

`mutating`이 발생하는 `값 타입(struct, enum)`은 명시적으로 `inout` 키워드가 붙는다.

따라서 `inout`의 경우
> In-out parameters are passed as follows:
> 1. When the function is called, the value of the argument is copied.
> 2. In the body of the function, the copy is modified.
> 3. When the function returns, the copy’s value is assigned to the original argument.

해당 순서로 수정된 값을 재할당 하고 있으므로 `값타입(struct, enum)` 또한 수정된 값을 재할당한다는 결론을 얻었습니다.

<br>

### 4️⃣ BankingType 위치
🚨 **문제점** <br>
- 처음 step3 구현을 할 때는 `Client` 타입이 은행 업무를 알고 있어야 한다고 판단하여 `Client` 타입의 중첩타입으로 `BankingType`을 구현하였습니다.
```swift
struct Client {
    enum BankingType: String, CaseIterable {
        case deposit = "예금"
        case loan = "대출"

        var taskTime: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
    }

    let turn: Int
    let banking: BankingType

    init(_ turn: Int, _ bankingType: BankingType) {
        self.turn = turn
        self.banking = bankingType
    }
}
```
<br>

💡 **해결방법** <br>

- 하지만 객체 지향적으로 현실 세계와 접목시켜 생각했을 때, 은행업무를 고객(`Client`)과 은행원(`BankManager`) 모두 알아야한다고 생각했고, `work` 메서드를 구현하는 중에도 필요하다고 생각하여 파일분리를 해서 따로 열거형으로 구현하였습니다.
```swift
enum BankingType: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"

    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
```    

<br>


### 5️⃣ `taskTime`의 위치
🚨 **문제점** <br>
- `taskTime` 프로퍼티는 업무 소요시간으로 객체 지향적으로 두가지 방향을 고민하였습니다.
    - 해당 일을 수행하는 객체는 `BankManager`이므로 `BankManager`가 업무 소요 시간을 가지고 있는 것이 좀 더 객체지향적으로 옳은 설계가 아닐까?
    - 같은 업무라 하더라도 은행별로 절차가 다르기 때문에 정해진 순서대로 일을 하면 `BankManager`가 다르더라도 같은 업무라면 소요 시간이 같을 수 있지 않을까?

<br>

💡 **해결방법** <br>
- 두 가지 의견 다 근거가 충분하다고 생각이 되어 고민하다가 상의 끝에, 현재 프로젝트는 후자로 선택하여 진행하였습니다.
<br>


### 6️⃣ `BankOpenable` 프로토콜의 유무
🚨 **문제점** <br>

- Bank 클래스의 open 메서드는 모든 은행이 가지고 있는 기능이기 때문에 프로토콜 기본 구현을 이용해볼까 고민했습니다.
    ```swift
    // Bank
    protocol BankOpenable {
        func openOrClose()
        func openBanking()
    }

    extension BankOpenable {
        func openOrClose() {
            print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
            let input = readLine()

            switch input {
            case "1":
                openBanking()
            default:
                return
            }
        }
    }

    // main
    let weatherBank: BankOpenable = Bank()
    weatherBank.openOrClose()
    ```
    이렇게 쓰게 된다면 `weatherBank`는 `BankOpenable`에서 구현하라고 명시해주었던 `openOrClose`와 `openBanking` 메서드만 알고 있게되고, 구체적 타입에 의존하는게 아니라 추상적인 프로토콜에 의존할 수 있습니다. 즉, 채택할 수 있는 객체라면 어떤 것이든 대체될 수 있으면 테스터블하고 유연한 코드가 될 수 있습니다.
<br>

💡 **해결방법** <br>

- 하지만 `openOrClose` 메서드가 `openBanking` 메서드를 호출하여 불필요한 `openBanking` 또한 프로토콜이 가지고 있게 되면서 `main`이 `openBanking`을 알고 있어야만 하는 추상화가 덜 된 듯한, 불필요한 접근이 느껴져 프로토콜 구현을 삭제하였습니다.

<br>

### 7️⃣ Semaphore가 Main Thread를 멈출 수 있도록 설계된 경우
🚨 **문제점** <br>
- `DispatchSemapthore`가 의도치 않게 `MainThread`를 멈춤으로써 원하는 동작을 얻지 못했습니다.

```swift
workSemaphore = client.banking == .deposit ? depositSemaphore : loanSemaphore
// Main Thread
workSemaphore.wait()
DispatchQueue.global().async(group: group) {
    self.bankManger.work(client: client)
    workSemaphore.signal()
}
```

먼저 위의 코드의 의도는 반복적으로 등록되는 `async` 동작에 대한 중복코드를 줄이고 생성된 쓰레드의 갯수를 제한하기 위함이였습니다. 하지만 가장 큰 문제는 `semaphore를` `loan과` `deposit을` 번갈아가면서 사용하게 된다는 점입니다. `Capture시` 값을 가져오는 기본 형태는 `Strong Reference` 를 기본으로 하므로 사용하게 될 타이밍에서의 `semaphore가` `loan`인지 `deposit`인지 알 수가 없다는 치명적인 단점이 있습니다. 따라서 상기 이유로 하여금 문제가 발생했습니다.

또한, 첫 시도시 반드시 예금2, 대출1  작업이 동시에 일을 시작하지 않는 단점 또한 가지고 있었습니다. 이러한 단점이 왜 발생하는지 분석 중 `Queue`를 2개로 작업했을 때도 동일한 결과를 나타냈습니다.

```swift
/// Main Thread
if client.banking == .deposit {
    depositSemaphore.wait()
    DispatchQueue.global().async(group: group) {
        self.bankManger.work(client: client)
        depositSemaphore.signal()
    }
} else {
    loanSemaphore.wait()
    DispatchQueue.global().async(group: group) {
        self.bankManger.work(client: client)
        loanSemaphore.signal()
    }
}
```

위의 코드는 첫번째와 같이 `semaphore`를 혼동해서 사용하는 이슈는 발생하지 않습니다만 첫 시도시 종종 예금2, 대출1 이 동시에 작업을 시작하지 않는다는 문제를 가지고 있습니다. 

<br>

💡 **해결방법** <br>

그 이유를 분석한 결과, 현재 생성되는 `process`의 갯수를 막기 위해서 `async Block` 외부에 `semaphore`를 삽입하여 생성되는 `Thread`의 갯수를 제한했습니다. 하지만 첫 작업시 대출, 대출 이 연속적으로 들어올 경우 대출에 대한 `semaphore`가 1로 존재하므로 첫번째 대출에 대한 `Thread`생성 이후 더 대출에 대한 작업할 수 있는 `semaphore`의 수가 존재하지 않아 `MainThread` 자체를 멈춰버려서 다른 작업들이 등록되지 못한다는 사실을 알게되었습니다.

따라서 대출이 연속적으로 들어오는 경우 원하는 동작을 하지 않았고 그 밖의 경우에서는 원하는 동작을 했었습니다.

원초적인 문제를 파악하여 코드를 조금 정리했습니다.

```swift
group.enter()
DispatchQueue.global().async {
    if client.banking == .deposit {
        depositSemaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.bankManger.work(client: client)
            depositSemaphore.signal()
            group.leave()
        }
    } else {
        loanSemaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.bankManger.work(client: client)
            loanSemaphore.signal()
            group.leave()
        }
    }
}

```

우선 처음 집중해본 부분은 `group`에서의 `enter`, `leave`의 사용이었습니다. 하지만 2번째로 언급드렸던 코드처럼 정말 중요하게 이슈의 원인이 되었던 부분은 main을 멈출 수 있는 동작이 존재한다는 점이 었습니다. 따라서 2개의 `async block`을 한번더 `async block`으로 감싸서 대출이 중복으로 들어와서 `wait`되는 상황이 오더라도 `main`이 `wait`하는 것이 아닌 등록된 `Thread`를 `wait`시켜서 이외의 동작들은 또다른 `Thread`에 할당되어 정상동작할 수 있도록 설계했고, 이를 제가 원래 적용했던 코드 스타일로 조금 다듬은 결과

```swift
DispatchQueue.global().async(group: group) {
    if client.banking == .deposit {
        depositSemaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.bankManger.work(client: client)
            depositSemaphore.signal()
        }
    } else {
        loanSemaphore.wait()
        DispatchQueue.global().async(group: group) {
            self.bankManger.work(client: client)
            loanSemaphore.signal()
        }
    }
}

```

원래 사용했던 `group`의 스타일로 변경할 수 있었고 이슈를 해결하여 원하는 동작을 수행할 수 있었습니다.

따라서 `DispatchSemaphore`를 사용할 때 해당 `semaphore`가 `Main Thread`를 `wait` 시킬 수 있는 경우의 수를 생각해보고 사용해야합니다.


<br>

## 📚 참고 링크<a id="참고_링크"></a>

- [🍎Apple Docs: DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)
- [🍎Apple Docs: Thread Sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [🍎Apple Docs: ModifyingValueTypes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods/#Modifying-Value-Types-from-Within-Instance-Methods)
- [🍎Apple Docs: functions - InOutParameters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#In-Out-Parameters)
- [🍎Apple Docs: declarations - InOutParameters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#In-Out-Parameters)
- <Img src = "https://github.com/WhalesJin/ios-bank-manager/assets/124643545/d1df2d8a-6667-438d-9643-aab8a83a4754" width="20"/> [Apple Github: MutationModel](https://github.com/apple/swift/blob/main/docs/MutationModel.rst)
- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [야곰닷넷: 동시성프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/lessons/동시성-프로그래밍/)
- <Img src = "https://hackmd.io/_uploads/ByTEsGUv3.png" width="20"/> [blog: StrongReferenceCycle](https://medium.com/@LeeZion94/strong-reference-cycle-8a88bdd8424b)


</br>

## 👥 팀 회고<a id="팀_회고"></a>
- [팀 회고 링크](https://github.com/WhalesJin/ios-bank-manager/wiki/🏦-은행-창구-매니저_웰시코딩🐶)
