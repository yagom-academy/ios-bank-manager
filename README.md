# 🏦 은행 창구 매니저 
> 프로젝트 기간: 2022/04/25 ~ 2022/05/06
> 
> 팀원: [Safari](https://github.com/saafaaari), [Donnie](https://github.com/westeastyear)
> 
> 리뷰어: [린생](https://github.com/jungseungyeo)

## 🔎 프로젝트 소개



## 👀 PR
[STEP 1](https://github.com/yagom-academy/ios-bank-manager/pull/148)

[STEP 2](https://github.com/yagom-academy/ios-bank-manager/pull/157)

[STEP 3](https://github.com/yagom-academy/ios-bank-manager/pull/165)

## 🛠 개발환경 및 라이브러리
- [![swift](https://img.shields.io/badge/swift-5.0-orange)]()
- [![xcode](https://img.shields.io/badge/Xcode-13.1-blue)]()
- [![iOS](https://img.shields.io/badge/iOS-15.0-red)]()


## 🔑 키워드
- `GCD`
    - `DispatchGroup`
    - `DispatchSemaphore`
    - `DispatchQueue`
- `Nested Types`
- `Queue`
- `LinkedList`
- `Protocol`
- `associatedtype`
- `Generic`
- `UnitTest`
- `Test Double`
- `DI(Dependency Injection)`
- `Protocol Oriented Programming`
- `OperationQueue`


## ✨ 구현내용
- `LinkeList`가 채택할 `Listable`프로토콜 구현
- `Queue`의 역할을 할 양방향`LinkedList` 자료구조 구현
- `LinkeList`, `Queue` UnitTest 진행
- `GDC`를 이용한 비동기 은행 업무 처리 로직 구현
- `CFAbsoluteTimeGetCurrent()`를 이용한 로직 동작 시간 표시
- `OperationQueue`를 이용한 전체 은행 업무 비동기 로직 구현



## 📖 학습내용
- `Protocol`과 `associatedtype`를 이용한 제네릭 프로토콜 구현과 사용법에 대한 이해
- 의존성 주입과 의존성 분리에 대한 이해
- 테스트를 위한 `Mock`타입에 대한 구현 방법과 사용법
- `P.O.P` 프로그래밍 페러다임 이해
- `Dispatch Framework`의 종류 및 구현 방법과 사용법
- `OperationQueue`의 구현 방법과 사용법
- `Thread`를 관리하는 방법


## 🤔 STEP별 고민한 점 및 해결한 방법 
## [STEP 1]
### 1. 프로토콜 내에서 제네릭타입을 사용하기 위한 associatedtype사용

> - 프로토콜 내에서는 제네릭 타입을 명시할 수 없었기 때문에, 자료를 찾던중 associatedtype을 알게 되어 프로토콜내에서 이를 활용하여 타입을 명시해 주어 해결하였습니다.
```swift
protocol Listable {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    func append(_ value: Element)
    func removeFirst() -> Element?
    func removeAll()
}
```

---

## [STEP 2]
### 1. 저희가 원하는 코드부분에서, 런타임 시작과 끝의 시간을 계산하여 총 걸린 시간을 구하기 위해 고민하였습니다.
> - 처음에는, 고객의 수에 0.7초(고객당 업무처리 시간)를 곱해주는 방식을 생각하였으나, 실제로 걸리는 시간을 측정하는 로직으로 구현하자는 의견이 있었습니다.
> 
> - 구글링 후에, `CFAbsoluteTimeGetCurrent()`라는 `Foundation` 내장 함수를 알게 되었고, 
```swift
let startWorkTime = CFAbsoluteTimeGetCurrent()

// 고객 업무 처리 로직 //

let finishWorkTime = CFAbsoluteTimeGetCurrent() - startWorkTime
```
> - 위와 같이 고객 업무를 처리하는 로직을 감싸는 위치에 코드를 작성하여 런타임의 실제 시간을 계산하였습니다.

### 2. 총 걸린 시간을 구한 후, 원하는 소수점자리에서 내림과 불필요한 소수점자리를 자르기 위해 고민하였습니다.
```swift
private extension Double {
    func customFloor() -> String {
        let digit: Double = pow(10, 1)
        return String(format: "%.2f", floor(self * digit) / digit)
    }
}
```
> - `Double`타입을 확장하여 위와 같은 로직으로 구현하였습니다.
>
> - 기존의 내림(floor)메서드가 있었지만, 원하는 자리에서 내림을 하기 위해서는 커스텀을 해야 했기에, `customFloor`를 구현하여 해결하였습니다.

### 3. Thread.sleep을 사용하지 않는 방향을 고민했습니다.

```swift
func processTask(for customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.numberTicket)번 고객 업무 완료")
    }
```
> - 위와 같이 `Thread.sleep`메소드를 이용하여 쓰레드를 직접 멈춰 두 `print`문 사이 시간차를 두었습니다. 
> - 하지만, `Thread.sleep`를 이용하는 방법은 메인 쓰레드를 일시적으로 멈춰 버리기 때문에 비동기 작업에서 타이밍 이슈를 발생 시킬 수 있어서 

```swift
func processTask(for customer: Customer) {
        let taskGroup = DispatchGroup()
        guard let taskTime = sortTaskTime(customer) else { return }
        
        startTask(customer)
        taskGroup.enter()
        taskQueue.asyncAfter(deadline: .now() + taskTime) {
            finishTask(customer)
            taskGroup.leave()
        }
        taskGroup.wait()
    }
```

> - 위와 같이 `GCD`를 활용하여 문제를 해결했습니다.

### 4. 불필요하게 많이 생성되는 쓰레드를 해결하는 방법에 대해 고민했습니다.

```swift
while !bankWaitingQueue.isEmpty {
    guard let customer = bankWaitingQueue.dequeue() else { return nil }
            
    DispatchQueue.global().async(group: group) {
        bankWindows.wait()
        self.bankClerk.processTask(for: customer)
        bankWindows.signal()
    }
}

```
> - 위 처럼 비동기 로직을 구현할 경우 지정해준 은행원 수 만큼 쓰레드가 생성되는 것이 아닌 고객 수 만큼 쓰레드가 생성돠는 것을 볼 수 있었다.
> - 고객수 만큼 스레드가 생성되었던 이유는, `bankWindows.wait()` 코드의 위치 때문이었습니다.
> -  이전에는 `DispatchQueue.global().async` 내부에 있어서 메인에서 기다리는 것이 아닌, 이미 `async`가 읽힌 후 쓰레드가 만들어지고 각 쓰레드가 `wait()`을 읽는 구조로 되어있어서 결과적으로 고객수 만큼 쓰레드가 만들어지는 현상이 발생했습니다.

```swift
 while !bankWaitingQueue.isEmpty {
    guard let customer = bankWaitingQueue.dequeue() else { return nil }
            
    bankWindows.wait()
    DispatchQueue.global().async(group: group) {
        self.bankClerk.processTask(for: customer)
        bankWindows.signal()
    }
}
```

> - 때문에 `bankWindows.wait()`의 위치를`DispatchQueue.global().async`밖으로 이동시킴으로서 메인이 `wait()`를 읽고, 쓰레드가 작업을 완료한 뒤 메모리에서 지워진 후 다시 쓰레드를 만들어 결과적으로 은행원 수 만큼 쓰레드를 만들 수 있었습니다.

---

## [STEP 3]

### 1. [STEP 2]때 사용하였던 `DispatchSemaphore`를 활용하여 [STEP 3]에서도 사용하려고 하였으나, 예금업무 `DispatchSemaphore`와 대출업무 `DispatchSemaphore`의  각 로직에 있는 서로의 `wait()`메서드가 메인스레드에게 읽혀서, 서로의 로직이 서로에게 영향을 끼지고 있다는 것을 알게 되었습니다.
> -  (ex: 시작은 같이 하는데 서로의 `wait()`메서드로 인한 쓸데없는 딜레이가 발생!!)

```swift
// BEFORE

switch task {
    case .deposit:
        depositWindow.wait() // <- 서로의 로직에 영향 🚨🚨
        DispatchQueue.global().async(group: group) {
            self.bankClerk.processTask(for: customer)
            depositWindow.signal()
        }
     case .loan:
        loanWindow.wait() // <- 서로의 로직에 영향 🚨🚨
        DispatchQueue.global().async(group: group) {
            self.bankClerk.processTask(for: customer)
            loanWindow.signal()
        }
}
```
 
> -  각 예금창구와 대출창구는 앞사람의 업무가 끝나면 다음사람의 업무가 시작되어야 하기에 `DispatchSemaphore`를 활용하기 보다는 `OperationQueue`를 활용하여 서로다른 `Queue에서` 업무를 수행하도록 코드를 작성하였습니다.
> - `OperationQueue`의 `maxConcurrentOperationCount()`에 각 업무에 배정된 은행원의 수(= 사용할 쓰레드 수)를 지정하여 반복되는 횟수만큼 쓰레드가 늘어나는 현상도 해결 할 수 있었습니다.

```swift
// AFTER

switch task {
    case .deposit:
        depositWindowQueue.addOperation {
            self.bankClerk.processTask(for: customer)
         }
    case .loan:
        loanWindowQueue.addOperation {
            self.bankClerk.processTask(for: customer)
        }
    }

// 중략...

// 최대 은행원 수 (= 사용할 쓰레드 수)
func assignClerkCount(at deposit: OperationQueue, and loan: OperationQueue) {   
    deposit.maxConcurrentOperationCount = depositClerkCount     
    loan.maxConcurrentOperationCount = loanClerkCount
}

```
