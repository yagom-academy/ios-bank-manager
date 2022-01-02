## 프로젝트 7 - 은행 창구 매니저

# 개요

1. 프로젝트 기간: '21.12.20 ~ '21.12.31
2. 캠퍼 : Lily, 숲재
3. 리뷰어 : 그린

# 학습 키워드
1. Step1
- `LinkedList`
- `Queue` 
- `UnitTest` 
2. Step2, Step3
- `Concurrency Programming`
- `Dispatch Group`
- `Dispatch Semaphore`
- `Class versus Struct`
- `Closure`
- `CFAbsoluteTimeGetCurrent`


# STEP1 

## 고민한 점
**1. Queue의 Clear메서드 구현**
```swift
    mutating func removeAll() {
        head = nil
        tail = nil
    }
```
Queue의 `Clear`메서드를 구현하기 위해 LinkedList에 구현 된 `RemoveAll`메서드를 사용하였습니다. 이 과정에서 LinkedList의 head에 nil을 할당하면 tail을 제외한 모든 Node가 deinit이 되는것을 확인할 수 있었습니다. 따라서 head와 tail에 nil을 할당하는 것으로 연결리스트가 가지고 있는 모든 Node를 삭제하는 함수를 구현했습니다. tail만 남아있게 되는 이유는 `LinkedList` 타입에서 참조를 계속 해주고 있기 때문이라고 생각이 되는데, tail변수를 굳이 약한 참조할 필요는 없는 것 같아 그대로 두었습니다.
<br>

**2. Struct와 Class중 어느것을 선택할지** 
`Node`,`LinkedList`와 `Queue`를 구조체와 클래스 중 어떤 타입으로 구현할지 고민했습니다.

`Node`는 `LinkedList`의 `next`프로퍼티로 전달될 때 참조로 전달되는 것이 효율적이라 판단하여 클래스를 선택했습니다.
그리고 `LinkedList`와 `Queue`는 class를 사용해야할 이유가 없는 것 같아서 디폴트로 struct를 사용하라는 애플의 권고에 따라서 struct로 구현했습니다.
<br>

## 궁금한점

**1. Unit Test 네이밍** 
Unit Test의 테스트 네이밍을 어떤 컨벤션을 사용할지 고민해보았습니다.

Should, When을 명시적으로 기재해서 테스트의 조건과 기대 결과를 구분하여 표현했습니다.
When에 뒤따르는 내용은 테스트할 메서드에 대한 내용만 기재해주었습니다. 테스트를 위해 전제되어야하는 선행 코드에 대한 내용은 생략해주었습니다.(아래 코드에서는`queue.enqueue(1)`)

```swift
  func test_Should_returnValueIs1_When_dequeue() {
        queue.enqueue(1)
        let returnValue = queue.dequeue()
        XCTAssertEqual(returnValue, 1)
    }
```
그린이 보시기에 저희가 생각한 네이밍이 적절하다고 생각하시나요? 조언 부탁드립니다.


# STEP2 

## UML 
![](https://i.imgur.com/H7dABci.jpg)



## 고민한 점
**1. BankManager의 역할**
이번 프로젝트는 같은 코드를 공유하는 Console App과 UI App 2개를 만들기 때문에, BankManager는 양쪽에서 모두 쓰일 수 있게 공통적인 기능만 담고 있어야 된다고 생각했습니다. 처음에는 `BankManager`가 main에서 직접 사용되면서 Console App의 실행을 담당 했는데요, `ConsoleManager`라는 별도의 타입을 만들어 Console App의 실행은 전적으로 해당 타입에서 담당하는 것으로 리팩토링 하였습니다. 또한, `ConsoleBundle` name space에서 Console App에서 쓰이는 String을 관리하도록 하여 공통으로 쓰이는 코드에서는 해당 String들을 직접적으로 알지 못하게 하려 했습니다. 다만, 이번 스텝에서는 `Bank`타입과 `BankClerk` 타입에서 `ConsoleBundle`를 직접 사용하는것을 수정하지는 못했습니다.  

<br>


**2. Bank인스턴스 초기화 시점에 대한 고민**
`ConsoleManager`의 `run()` 안에서 
- 1) case가 은행개점일 때 마다 Bank인스턴스를 생성해줄 지
- 2) while구문 전에 Bank인스턴스를 초기화 한 후, 일처리를 한 뒤 인스턴스의 프로퍼티를 초기화해준 후 인스턴스를 재 사용할 지
고민했습니다.

```swift
//1) case가 은행개점일 때 마다 Bank인스턴스를 생성
struct ConsoleManager {
    static func run() {
        while true {
            printMenu()
            switch receiveInput() {
            case ConsoleBundle.Menu.open:
                BankManager.createBank()
                BankManager.openBank()
            case ConsoleBundle.Menu.exit:
                return
            default:
                continue
            }
        }
    }
```


```swift
// 2) 하나의 Bank인스턴스 재사용
struct ConsoleManager {
    static func run(numberOfBankClerk: Int = 1) {
        BankManager.createBank(bank: Bank(numberOfBankClerk: numberOfBankClerk))
        while true {
            printMenu()
            switch receiveInput() {
            case ConsoleBundle.Menu.open:
                BankManager.openBank()
                BankManager.closeBank() // Bank인스턴스의 프로퍼티를 초기화하는 작업 수행
            case ConsoleBundle.Menu.exit:
                return
            default:
                continue
            }
        }
    }

```
1번 방법으로 구현하면 은행을 개점할 때마다 인스턴스를 초기화하는 비용이 발생하고,
2번 방법으로 구현하면 인스턴스의 몇몇 프로퍼티를 초기화해야하는 작업(위 코드에서는`BankManager.cloaseBank()`이 필요하다고 생각했습니다.

인스턴스를 초기화하는 것보다 `BankManager.cloaseBank()`를 실행하는 것이 좀 더 비용이 들 것이라고 추측해서 저희는 1번 방법으로 구현했습니다.

프로그램의 주축이 되는 인스턴스를 초기화하는 작업을 보통 어떻게 구현하시는지 궁금합니다!
<br>   


# STEP3

## 고민한 점
**1. BankClerk 타입의 사용**
- 시도했던 방법
`distributeClient`메서드에서는 BankClerk객체가 클라이언트 Queue를 순회하며 BankClerk이 가지고 있는 `workType`과 Client의 `workType`이 동일할때만 `remove`메서드를 사용하여 꺼내옵니다. BankClerk 객체를 순회하며 서로 다른 쓰레드에서 비동기적으로 `distributeClient`메서드를 수행하도록 시키는 방법으로 구현했습니다. "예금-예금-예금-대출" 이런 순서로 고객이 존재할때 대출 담당 은행원이 놀고있는 시간을 방지하기 위해서 이렇게 구현하였는데, 고객의 수가 많아지는 경우 탐색 시간이 길어져 불완전한 설계라고 판단하였습니다.(고객이 5만명 정도를 넘어가면 유의미하게 실행시간이 길어지는 것을 확인하였습니다.) 

```swift=
     private func makeBankClerksWork() {
        let group = DispatchGroup()
        for bankClerk in bankClerks {
            DispatchQueue.global().async(group: group) {
                self.distributeClient(to: bankClerk)
            }
        }
        group.wait()
    }

    private func distributeClient(to bankClerk: BankClerk) {
        while !self.clientQueue.isEmpty {
            semaphore.wait()
            var i = 0
            while let client = self.clientQueue.peek(i) {
                if client.workType == bankClerk.workType {
                    break
                }
                i += 1
            }
            if let client = self.clientQueue.remove(at: i) {
                semaphore.signal()
                bankClerk.work(for: client)
                semaphore.wait()
                completedClientCount += 1
                semaphore.signal()
            } else {
            semaphore.signal()
            }
        }
    }

```

- 결정한 방법
DispatchSemaphore의 value를 해당 업무를 할 수 있는 은행원의 수라고 정의하고 아래와 같이 구현했습니다. 각각의 업무마다 DispatchSemaphore를 생성하여 배정된 은행원의 수 만큼 value를 부여했습니다.
```swift
let depositSemaphore = DispatchSemaphore(value: inChargeOfDeposits)
let loanSemaphore = DispatchSemaphore(value: inChargeOfLoan)
let group = DispatchGroup()
        
while let client = self.clientQueue.dequeue() {
    DispatchQueue.global().async(group: group) {
        switch client.bankTask {
        case .deposit:
            depositSemaphore.wait()
            self.makeBankClerkWork(for: client)
            depositSemaphore.signal()
        case .loan:
            loanSemaphore.wait()
            self.makeBankClerkWork(for: client)
            loanSemaphore.signal()
            }
        }
    }
group.wait()
}
```
위와 같은 구현을 통해 기존 방법에서 겪었던 문제는 해결이 되는데, BankClerk타입을 살리면서 위와 같은 구현을 유지하는 방법을 찾는데 실패했습니다. 

# STEP4

## 구현
**Console App과 UIApp의 open해주는 메서드를 각각 만들어주었습니다.**
- 기존 `open()`메서드의 구현내용은 UI에서 필요없는 로직이라 `openForUI()`를 만들어 ViewController의 버튼 selecotr메서드와 연결시켜주었습니다.
- 고객을 추가하는 로직 또한 각 앱이 달라 `receiveClient()` 와 `receiveClient(of number: Int)`를 각각 구현해주었습니다.
<br>

## 고민한 점
**1. `global().async`의 실행 블록내 에서 `global().async`를 할 때 client 순서대로 실행되는 이유**
```swift=
func openForUI() {
        receiveClient(of: 10)
        DispatchQueue.global().async {
                self.allocateClientToBankClerk(inChargeOfDeposits: 2, inChargeOfLoans: 1)
            if self.totalNumberOfClient == self.completedClientCount {
                self.delegate?.closeBusiness(by: self.completedClientCount, workHours: "1")
            }
        }
    }

private func allocateClientToBankClerk(inChargeOfDeposits: Int, inChargeOfLoans: Int) {
        let group = DispatchGroup()
        
        while let client = self.clientQueue.dequeue() {
            DispatchQueue.global().async(group: group) {
                switch client.bankTask {
                case .deposit:
                    self.depositSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    self.makeBankClerkWork(for: client)
                    self.loanSemaphore.signal()
                }
            }
        }
        group.wait()
    }
```
`고객10명 추가`버튼에 연결될 `openForUI()`에서 `global().async`로 `allocateClientToBank`를 호출해주었습니다. 이 경우 `고객 10명 추가`를 연달아 누를 경우, `allocateClientToBank`가 비동기적으로 다중스레드에서 실행될 것이기 때문에 client를 dequeue해주는 동작이나 while문 안의 global().async도 다중 스레드에서 동시적으로 실행되어 결론적으로는 client 순서대로 처리되지 않을 것이라 예상했습니다. 즉, 새치기가 발생하는 것이죠. 그런데 예상과 달리 순서대로 client를 처리해주어서 의문점이 들었습니다. 

**2. 같은 파일을 서로다른 프로젝트에서 공유하는 방법**

콘솔 앱과 UI앱에서 같은 파일을 공유하기 위해서 최상단 디렉토리에 BankManagerShared라는 폴더를 만들고 그 안에 공유하고자 하는 파일을 모두 넣었습니다. 그리고 해당 폴더를 각 프로젝트에 Group 가상 폴더(not reference) 방식으로 추가 해 주었습니다.

<br>
