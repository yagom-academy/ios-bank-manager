# 은행창구 매니저
> 은행을 방문한 고객들의 업무를 여러명의 은행원이 처리하도록 만든 콘솔앱입니다.
>
> 프로젝트 기간: 2023.03.06 - 2023.03.17
> 

## 팀원
| 무리 | 리지 |
| :--------: |  :--------: | 
| <Img src = "https://i.imgur.com/RoWuqsN.jpg" width="200" height="200"/>      |<Img src ="https://user-images.githubusercontent.com/114971172/221088543-6f6a8d09-7081-4e61-a54a-77849a102af8.png" width="200" height="200"/>
| [Github Profile](https://github.com/parkmuri) |[Github Profile](https://github.com/yijiye)

## 목차
1. [타임라인](#타임라인)
2. [프로젝트 구조](#프로젝트-구조)
3. [실행화면](#실행화면) 
4. [트러블 슈팅](#트러블-슈팅) 
5. [핵심경험](#핵심경험)
6. [참고 링크](#참고-링크)


# 타임라인 
- 2023.03.06 : LinkedList를 이용하여 Queue 구현, UnitTest 
- 2023.03.07 : Bank, Client 구현
- 2023.03.08 : BankClerk 구현, Bank, Client refactoring
- 2023.03.09 : DispathQueue 적용
- 2023.03.10 : refactoring, README.md 작성


<br/>

# 프로젝트 구조
<details>
    <summary><big>UML</big></big></summary>

<img src="https://i.imgur.com/iztFWFI.png" width="1000">

</details>

<br/>


# 실행화면
<img src="https://i.imgur.com/jF0aH41.gif">


# 트러블 슈팅
## 1️⃣ STEP3의 요구사항 중 `세 명의 은행원`에 대한 해석
> 은행에는 3명의 은행원이 근무합니다(예금담당 2명, 대출담당 1명)

- 은행에는 은행원이 세 명 근무하도록 안내되어있었습니다. `BankClerk`타입을 구현 해 놓은 후라서 "세 개의 global 스레드 안에 각각 BankClerk 인스턴스를 만들어주면 되지 않을까?" 생각을 했습니다. 
- 저희가 만들어 놓은 로직에서는 은행원이 직접 손님들의 대기열을 dequeue하지 않고, 은행 내부에서 dequeue한 손님들을 목적(대출 or 예금)에 따라 은행원에게 보내주도록 구현해놓았습니다. 
이 상태에서 위 처럼 생각 후 비동기 스레드를 구현하니 예금목적 손님들은 예금을 담당하는 두 명의 은행원 스레드를 돌게되는 등의 오류가 발생했습니다.
- BankClerk의 인스턴스로 은행원의 실체를 만드는 것이 아니라, 은행원을 하나의 스레드로 생각 하고 서비스를 제공하는 BankClerk의 인스턴스 한개를 전역변수로 구현하였습니다. 그리고 **접근하는 스레드의 수 (=은행원)** 를 `Semaphore`로 제한함으로써 총 3명의 은행원이 일을 처리하도록 구현하였습니다.
```swift
// Bank.swift
private var bankClerk = BankClerk()
private let loanBankClerk = DispatchSemaphore(value: 1)
private let depositBankClerks = DispatchSemaphore(value: 2)

private func dispatchQueue(_ currentClient: Client) {
    let depositService = DispatchWorkItem() {
        depositBankClerks.wait()
        bankClerk.service(to: currentClient)
        depositBankClerks.signal()
    }
    let loanService = DispatchWorkItem() {
        loanBankClerk.wait()
        bankClerk.service(to: currentClient)
        loanBankClerk.signal()
    }

    if currentClient.purposeOfVisit == .deposit {
            DispatchQueue.global().async(execute: depositService)
    } else {
        DispatchQueue.global().async(execute: loanService)
    }
}
```

## 2️⃣ 스레드 실행 순서 고민
- 은행원을 스레드로 생각하여 `DispatchQueue.global().async` 로 3명의 은행원에서 고객들을 비동기적으로 처리하도록 구현하였는데, 메인스레드가 아닌 다른 스레드에서 작업을 처리하여 작업이 끝나기 전에 메인스레드에 있는 `notifyTaskCompletion` 메서드가 실행되어 함수 내부의 print문이 출력되는 오류가 있었습니다.
실행 순서 문제를 해결하고자 `DispatchGroup`을 전역상수로 두고`DispatchQueue.global().async`를 group로 묶어준 후 `group.wait()` 메서드를 사용하였습니다. 이때, 시간을 계산하고 print문이 출력되어야 하므로 doTask() 일이 끝나는 곳에서 `group.wait()`메서드를 실행하였습니다.

```swift
// Bank.swift
private let group = DispatchGroup

mutating func doTask() {
    for _ in 1...waitingLine.count {
        guard let currentClient = waitingLine.dequeue() else { return }
        dispatchQueue(currentClient)
    }

    group.wait()
}

private func dispatchQueue(_ currentClient: Client) { 
    // ...
    if currentClient.purposeOfVisit == .deposit {
        DispatchQueue.global().async(group: group, execute: depositService)
    } else {
        DispatchQueue.global().async(group: group, execute: loanService)
    }
}
```

# 핵심경험

<details>
    <summary><big>✅ LinkedList를 이용한 Queue 구현</big></summary>
    
### removeAll() 구현
- `removeAll()` 의 기능은 enqueue된 값을 모두 삭제하는 것이라 생각하였습니다. 처음 생각한 점은 값을 하나씩 삭제를 해줘야하나? 고민하였는데, 연결리스트의 특성상 노드가 다음 값의 주소값과 연결되어 있으므로 head와 tail을 nil로 변환하면 가르키는 주소값이 사라지게 되고 결국 swift의 ARC가 자동으로 메모리를 해제한다는 점을 고려하여 다음과 같이 구현하였습니다.
    
```swift
 mutating func removeAll() {
    self.head = nil
    self.tail = nil
    count = 0
}
```
    
### append 구현
- 처음 appen 구현시 조건문을 if로 사용하여 return 을 구현하지 않아 append 기능에 문제가 있었습니다. 
    
수정 전 코드
```swift
 mutating func append(_ data: T) {
    if isEmpty {
        self.head = Node(data: data)
        self.tail = head
        count += 1
    }
```
- 비어있을 때, head에 새로운 Node를 주고 Node가 head이자 tail이 되도록 한 후 코드를 빠져나오도록 return 값을 주면서 빠른 종료를 위해 guard문으로 변경하였습니다.
    
수정 후 코드
```swift
 mutating func append(_ data: T) {
    guard !isEmpty else {
        self.head = Node(data: data)
        self.tail = head
        count += 1
    
        return
    }
```
    
### count 추가
- step2를 진행하면서 count의 기능이 필요하다 생각하여 count를 추가하였습니다. 그러나 LinkedList를 swift에서 기본으로 제공하는 타입이 아니므로 count를 세는 것을 직접 구현해야 했습니다. 따라서 enqueue 되면서 count를 하나씩 증가하고, dequeue 될 때 count가 하나씩 감소하며 removeAll 하면 count가 다시 0이 되도록 직접 구현하였습니다.
</details>


<details>
    <summary><big>✅ 시간 측정</big></summary>
    
- 은행원 1명이 1명의 고객을 처리하는데 걸리는 시간 조건이 있었고, 그 시간을 측정하여 하루동안 일한 시간을 print 하는 미션이 있었습니다. 저희는 그 시간을 측정하기 위해 `usleep()`을 사용하여 정해진 시간만큼 일을 처리하고 그 합을 `CFAbsoluteTimeGetCurrent()` 메서드를 이용하여 해결하였습니다.
```swift
mutating func checkTaskTime() -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        doTask()
        
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", timeOfTask)
        
        return totalTime
    }
```
    
추가적으로 같은 기능을 하는 Thread.sleep()과 sleep()에 대해 좀 더 찾아보았습니다.
    
```swift
// sleep
static func sleep(_ duration: UInt64) async

// Thread.sleep
@_unavailableFromAsync(message: "Use Task.sleep(until:clock:) instead.") 
class func sleep(forTimeInterval ti: TimeInterval)
```
- 두 메서드 모두 정해진 시간만큼 업무 수행을 중지 시키는 메서드로 가장 큰 차이로는 static 타입 메서드인 것과 class 타입 메서드 인 점이 있습니다.
Thread.sleep()이 Foundation FrameWork의 Thread class에 정의된 메서드로, swift에 더 최적화되어 있으나 기능적으로 차이는 없다는 것을 알게되었습니다.
    
</details>

<br/>

# 참고 링크
- [AppleDeveloper : sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [AppleDeveloper : DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue/)
- [AppleDeveloper : global()](https://developer.apple.com/documentation/dispatch/dispatchqueue/2300077-global)
- [AppleDeveloper : wait()](https://developer.apple.com/documentation/dispatch/dispatchworkitem/2016085-wait)
- [AppleDeveloper : DispatchGroup](https://developer.apple.com/documentation/dispatch/dispatchgroup)
- [야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
