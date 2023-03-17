# 은행창구 매니저
> 은행을 방문한 고객들의 업무를 여러명의 은행원이 처리하도록 만든 UI앱입니다.
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
4. [이번 프로젝트에서 적용한 기술](#이번-프로젝트에서-적용한-기술)
5. [트러블 슈팅](#트러블-슈팅) 
6. [핵심경험](#핵심경험)
7. [팀 회고](#팀-회고)
8. [참고 링크](#참고-링크)


# 타임라인 
- 2023.03.06 : LinkedList를 이용하여 Queue 구현, UnitTest 
- 2023.03.07 : Bank, Client 구현
- 2023.03.08 : BankClerk 구현, Bank, Client refactoring
- 2023.03.09 : DispathQueue 적용
- 2023.03.10 : refactoring, README.md 작성
- 2023.03.13 : UIApp 프로젝트 Custom View 구현
- 2023.03.14 : UIConsolApp 완료, Custom View autolayout, Model 파일 추가
- 2023.03.15 : 고객 정보 전달(delegate) 및 화면 구현, OperantionQueue 구현 
- 2023.03.16 : 초기화 버튼, Timer 구현
- 2023.03.17 : refactoring, README.md 작성


<br/>

# 프로젝트 구조

<img src="https://i.imgur.com/B46wnSr.png" width="1500">


<br/>


# 실행화면

## ConsoleApp
<img src="https://i.imgur.com/jF0aH41.gif">

## UIApp

|<center>실행화면</center>|<center>설명</center>|
|---|---|
|<img src="https://i.imgur.com/gRoPJF4.gif" width="300">| 1. 앱 시작 후 고객 10명 추가 버튼을 누르면 업무 시간이 증가합니다. </br></br> 2. 고객이 존재하는 상태에서 고객 10명 추가하면 번호가 연결되어 나타납니다.</br></br> 3. 업무 중 초기화 버튼을 누르면 대기중, 업무중에 존재하는 고객들이 모두 사라지고 업무 시간도 초기화됩니다. </br></br> 4. 고객에 대한 업무를 마치게되면 총 걸린 시간이 표시됩니다.|

<br/>

# 이번 프로젝트에서 적용한 기술

- LinkedList & Node
- Queue
- DispatchQueue
- OperationQueue
- 코드로 UI구현
- Canvas
- Delegate Pattern
- Timer
- fmod()


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

### 3️⃣ DispatchQueue와 OperationQueue
- 먼저 STEP3에서는 DispatchQueue를 이용하여 비동기 프로그래밍을 구현했습니다(트러블슈팅1️⃣, 2️⃣). UI 업데이트를 위한 `client`의 정보를 전달을 Delegate를 구현한 후, DispatchQueue에서 Main Thread를 이용하여 UI 업데이트를 구현해보다 `초기화`버튼에 대한 이야기를 하게되었습니다. 이를 위한 DispatchQueue의 Cancel에 대해 고민을 해보다 OperationQueue는 스케쥴링에 용이하다는 점과 리뷰어의 피드백 중 OperationQueue도 사용해보라는 리뷰가 생각나 OperationQueue를 적용시켜보았습니다.

### 4️⃣ Timer 구현
- 프로젝트에서 앱이 시작되는 동안 걸리는 시간을 실시간으로 보여주기 위해 Timer를 사용하였습니다. 시간을 설정하는 부분에서 시행착오가 있었고, 아래와 같이 해결하였습니다.

#### 문제점
- 먼저 client가 10명 추가될때 타이머가 시작되어야 한다고 생각하여 아래와 같이 버튼이 눌리는 곳에서 `Date()`를 사용해 `startTime`을 구현하였습니다.
```swift
final class BankAppViewController: UIViewController {
    var startTime
    // 중략 
    private func addClientButtonTapped() {
        buttonStackView.addClientButton.addTarget(self, action: #selector(addTenClients), for: .touchUpInside)
    }
    
    @objc private func addTenClients() {
        bank.lineUpClient()
        bank.doTask()
        isOpen = true
        self.startTime = Date()
    }
```

- 그리고 타이머가 시작되면 timeInterval을 기준으로 분,초,밀리세컨드로 나눠서 띄우도록 구현했습니다. timeInterval은 현재의 `timeInterval`과 `startTime`을 비교하여 그 차이가 되도록 하였습니다.

```swift
private func setUpTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
    @objc private func timeUp() {
     
        let timeInterval = Date().timeIntervalSince(self.startTime)
        // 분,초,시 계산식 생략
    }
```

- 위와같이 실행하니 `고객 10명 추가` 버튼을 누를때마다 startTime이 초기화되는 문제와 업무가 종료될때 타이머를 멈추게 하는 방법을 찾아야했습니다. 

#### 해결 방안

- 앱의 시작 종료를 `isOpened` 라는 bool 타입 변수를 만들어 구분하였습니다.
`고객 10명 추가` 버튼이 눌렸을 때, 앱이 시작됨과 동시에 `isOpened == true` 로 바뀌면서 시간을 측정하고 업무중인 고객과 대기중인 고객이 없을 때 `isOpened == false`로 바뀌면서 앱이 종료되도록 하였습니다. 
- 이때 `taskTime`을 전역변수로 두어 `isOpened == true`가 되면서 `taskTime += 0.001 `이 증가하고 이를 label에 넣어 화면에 띄웠습니다.
```swift
private func setUpTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
@objc private func timeUp() {
    if isOpened == true {
            taskTime += 0.001
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

<details>
    <summary><big>✅ 비동기로 처리된 작업 UI에 띄우기</big></summary>

- UIKit은 thread safe 하지 않아 Race Condition이 발생할 위험이 있기 때문에 main 스레드에서 띄워줘야 합니다. 그렇다면 ConsolApp에서 구현한 비동기로 처리되는 작업을 어떻게 main 스레드에서 띄워줄 수 있는지 고민하였습니다. 저희는 bank에서 일어나는 데이터의 변화를 전달받고자 delegate를 활용하였습니다. bank에서 ViewController에 전달해주고, ViewController에서 위임하여 UI에 띄워주도록 구현하였습니다.
    
#### 순서
  - ViewController `고객 10명 추가` 버튼 클릭
  - bank.lineUpClient() 실행
     - delegate?.sendData(of: currentClient) : enqueu되는 고객 정보를 넘김
  - bank.doTask() 실행
     - assignToBankClerk() 비동기 처리가 시작되면서 delegate를 통해 전달

```swift
struct Bank {
    
    var delegate: BankDelegate?
    // 생략
    private func assignToBankClerk(_ currentClient: Client) {
        let process = BlockOperation {
            delegate?.startTask(of: currentClient)
            bankClerk.service(to: currentClient)
            delegate?.completeTask(of: currentClient)
        }

        switch currentClient.purposeOfVisit {
        case .deposit:
            depositClerk.maxConcurrentOperationCount = 2
            depositClerk.addOperation(process)
        case .loan:
            loanClerk.maxConcurrentOperationCount = 1
            loanClerk.addOperation(process)
        }
    }
}
```

```swift
protocol BankDelegate {
    func sendData(of client: Client)
    func startTask(of client: Client)
    func completeTask(of client: Client)
}
```

- 전달받은 정보를 viewController가 화면에 업데이트

```swift
extension BankAppViewController: BankDelegate {
    func sendData(of client: Client) {
        //대기중 화면에 고객 정보 띄우기 (코드 생략)
    }
    func startTask(of client: Client) {
        //대기중에 있는 고객을 업무중으로 넘기기 (코드 생략)
    }
    func completeTask(of client: Client) {
        //업무가 완료되면 업무중 고객에서 삭제하기 (코드 생략)
    }
}
```

</details>

<details>
<summary><big>✅ fmod를 이용한 시간 계산</big></summary>
- timer를 작동시키는 메서드로` setUpTimer()`를 구현하고 selector에 들어가는 메서드인 `timeUp()` 메서드 안에서 포맷을 설정하였습니다.
    
```swift
@objc private func timeUp() {
    if isOpened == true {
            taskTime += 0.001
    }
    let timeInterval = taskTime
    let minute = (Int)(fmod((timeInterval/60), 60))
    let second = (Int)(fmod(timeInterval, 60))
    let milliSecond = (Int)((timeInterval - floor(timeInterval))*1000) 
    let minuteLabel = String(format: "%02d", minute)
    let secondLabel = String(format: "%02d", second)
    let milliSecondLabel = String(format: "%03d", milliSecond)
    taskTimerLabel.text = " 업무시간 - \(minuteLabel) : \(secondLabel) : \(milliSecondLabel)"
    }

```
- 이때 `fmod(_,_)`메서드를 활용하였습니다. 이 메서드의 기능은 첫번째 인자를 두번째 인자로 나눴을 때, 딱 맞게 떨어지지 않는 나머지 부분을 반환해주는 것으로 위의 식을 사용하여 초를 기준으로 분, 초, 밀리세컨드 초를 계산하여 반환해주도록 하였습니다.
- 또한 소수점 값은 불필요하다고 생각하여 `Int`로 타입을 맞춰주고, 자릿수를 지정하기 위해 `String(format:,_)`을 사용하였습니다.
    
#### fmod
    
<img src="https://i.imgur.com/1hxxk0d.png" width="400">
    
<br/>

- 예시 코드

```swift
let result = fmod(50.5, 1.7) // 50.5/1.7 = 29 + 나머지, 50.5-49.3(29x1.7) = 1.2
print(result)

/*
 x < y : x 값이 반환
 x >= y : x/y, 몫을 뺀 나머지 (나눠지지 않는 값을 반환) 

예시 ===> 50.5 / 1.7 = 몫(29) + 나머지(1.2)
 */

let timeInterval = 57900.05 // 초
/*
 57900.05 초를 시, 분, 초, 밀리초로 환산하는 계산식
 */

let hour = (Int)(fmod((timeInterval/60/60), 12)) // 1시간 = 3600 초

/*
 시간 12로 하면 => 4시
 시간 24로 하면 => 16시
 */

let minute = (Int)(fmod((timeInterval/60), 60)) // 1400초 = 23분
let second = (Int)(fmod(timeInterval, 60)) // 20초

let milliSecond = (Int)((timeInterval - floor(timeInterval))*1000) // 050
```
</details>
   
    
    
# 팀 회고

<details>

<summary><big>👭 팀 회고</big></summary>

### 우리 팀이 잘 한점
- 시간 약속을 잘 지켜 프로젝트가 원활히 진행됐어요!
- 의견 교환이 활발했어요! 다양한 의견을 내서 여러가지 시도를 해볼 수 있었어요!
- 서로 모르는 부분이 있으면 설명을 잘 해주었어요!
- 어려운 부분을 같이 찾아 해결했어요!

### 우리 팀이 노력할 점
- 어려워했던 부분들을 다른 캠퍼들에게 공유했으면 더 빠르게 이해할 수 있었을 것 같아요!
- 커밋단위를 세세하게 나누면 좀 더 명확했을 것 같아요!
    
### 서로 칭찬할 점
- 리지가 무리에게🫶
어려운 문제를 만났을 때, 적극적으로 찾아보고 해결방법을 공유해주어 프로젝트 하는데 큰 도움이 되었습니다 👍
제가 낸 의견을 모두 반영해주고 이해해주려고 해서 너무 감사했어요 👍
또 서로 토론을 많이해서 무리 덕분에 이번 프로젝트에서 많은 공부를 한 것 같습니다!👯‍♀️🎉

- 무리가 리지에게🫶
시간약속을 잘 지켜주셔서 감사했어요! 중간에 컨디션이 안좋아져서 힘들어하는 저를 위해 배려해주셔서 감사했습니다🥲🫶
또 리지 열정이 너무 멋졌어요...! 그날 프로젝트한 내용 정리까지...👍 진짜 대단해요! 
프로젝트 기간동안 수고하셨습니다🥹!! 다음에 만난다면 더 좋은모습으로 찾아뵐게요(?)🫶
    
</details>

    
# 참고 링크
- [AppleDeveloper : sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [AppleDeveloper : DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue/)
- [AppleDeveloper : global()](https://developer.apple.com/documentation/dispatch/dispatchqueue/2300077-global)
- [AppleDeveloper : wait()](https://developer.apple.com/documentation/dispatch/dispatchworkitem/2016085-wait)
- [AppleDeveloper : DispatchGroup](https://developer.apple.com/documentation/dispatch/dispatchgroup)
- [AppleDeveloper : Timer](https://developer.apple.com/documentation/foundation/timer) 
- [AppleDeveloper : fmod(_ :_ :)](https://developer.apple.com/documentation/accelerate/3804649-fmod)
- [AppleDeveloper : Closure](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)
- [AppleDeveloper : OperationQueue](https://developer.apple.com/documentation/foundation/operationqueue)
- [AppleDeveloper : sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
- [소들이 블로그 : ARC ](https://drive.google.com/file/d/1ReVTf77B8eNqPSUu06HlLyfe9-LN-3XD/view?usp=sharing)


