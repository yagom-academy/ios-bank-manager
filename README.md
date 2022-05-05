# 은행 창구 매니저 프로젝트
> 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
팀원 : [@Lingo](https://github.com/llingo) [@Cathy](https://github.com/cathy171) / 리뷰어 : [@Steven](https://github.com/stevenkim18)

## 목차

- [키워드](#키워드)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 2](#step-2)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 3](#step-3)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [그라운드 룰](#그라운드-룰)
    + [활동시간](#활동시간)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## 키워드
- `연결 리스트` `Queue(큐)`
- `Generics`
- `XCTest`
- `Sync` `Async`
- `DispatchQueue`
- `DispatchSemaphore`
- `Timer`
- `GCD`

---

## UML
![](https://i.imgur.com/PP9V2wZ.png)

---

## [STEP 1]
### 고민 및 해결한 점

**💡 Xcode의 Command Line Tools로 만들어진 App에 XCTest를 추가하는 과정에서 `target x86_64...; found: arm64` 에러가 발생했습니다.**  

![](https://i.imgur.com/B5gK6Jy.png) 

<img width="400px" src="https://i.imgur.com/vCrXVEh.png"/> <br/>

저희는 인텔 맥과 M1 맥 사이에서 발생한 문제라고 생각했고 다음과 같은 시도를 해보았습니다.

1. Build Setting의 `Always Embed Swift Standard Library`설정 값 변경
2. x86_64 와 arm64 관련 설정 값 변경을 시도
3. Build Phase의 Compile Source 항목에 테스트할 코드를 추가

1, 2번의 방법으로는 문제를 해결할 수 없었으며 3번의 방법으로 해결할 수 있었습니다. 3번의 방법은 BankManagerConsoleAppTest 타겟에서 사용하는 BankManagerConsoleApp 파일들의 Target Membership를 추가하는 것과 같다는 것을 알 수 있었고 추가한 후 testable를 제거했더니 문제가 해결할 수 있었습니다.

<img width="400px" src="https://i.imgur.com/9qaVHjm.png"/> <br/>
<img width="400px" src="https://i.imgur.com/AeiwbrX.png"/>

### 조언 받고 싶은 점
**💡 `Swift Lint`에서 `line_length`가 적용되지 않는 현상**  
```
disabled_rules:
  - multiple_closures_with_trailing_closure

excluded:
  - Pods
  
opt_in_rules:
  - closure_spacing
  - force_unwrapping
  - implicitly_unwrapped_optional
  - legacy_multiple
  - operator_usage_whitespace

line_length: 99
indentation: 2
```
위와 같이 `swiftLint` 파일에 `line_length`를 99줄로 설정해주었는데 적용이 되지 않았습니다. 기본적인 설정이 120줄로 되어있는데 저희가 임의적으로 설정을 해주고 싶을 때는 어떻게 설정해야하는지 궁금합니다.

**💡 프로젝트 요구조건에는 Queue를 구현하기 위해 LinkedList를 구현하도록 되어있는 것에 대하여**  
Queue를 구현하기 위해 LinkedList를 구현하도록 되어있고 요구사항에 맞게 LinkedList를 구현했습니다. 
저희가 구현하면서 `Node -> LinkedList -> Queue`가 아닌 `Node -> Queue`로 바로 구현해도 될 것 같다는 얘기가 나왔었는데 LinkedList를 생략하고 구현해도 되는지 궁금합니다.

---

## [STEP 2]
### 고민 및 해결한 점
**BankManager, Bank의 Client를 생성하는 역할과 책임에 대하여**  
Client를 생성해주는 역할을 BankManager와 Bank 중 어디에 부여할지 고민을 하였고 BankManager에 부여하기로 하였습니다. 

**BankManager에서 재귀함수를 사용하지 않고 재시작을 하는 것에 대해**  
기존에는 BankManager의 start 메서드의 `재시작`을 구현하기 위해 재귀함수를 사용했었습니다. 재귀함수는 호출될때마다 스택에 계속 쌓게되어 스택오버플로우 가능성이 있다고 생각했고 이를 해결하기 위해 다음과 같은 방법을 고민했습니다.

1. 꼬리 재귀 최적화 방법
2. 반복문을 사용하여 종료하는 사용자 입력이 올때 반복문을 탈출하는 방법

![](https://i.imgur.com/6O2DhCB.png)

`꼬리 재귀 최적화`는 Swift 컴파일러가 제공하는 최적화이며 메서드가 불릴때마다 스택에 쌓는 것을 방지할 수 있었습니다. 하지만, DEBUG 모드에서는 최적화 설정이 되어있지 않기 때문에 사용하지 않기로 결정했고 반복문을 통한 `재시작`을 할 수 있도록 구현했습니다.

**매직리터럴을 방지하기 위한 네임스페이스 설정에 대하여**  
코드의 유지보수와 가독성을 높이기 위해 각 파일에서 `Constants` `Message` `Menu` 열거형을 사용하여 매직 넘버와 매직리터럴을 제거해주었습니다.

**네이밍**
각 메서드가 하고있는 역할에 맞게 메서드 네이밍을 수정하였습니다.

```swift
// 예시)
execute -> executeBankTask
close -> displayCloseMessage
```

### 조언 받고 싶은 점
**타입 간의 의존성 사이클에 대하여**  
타입 간의 의존성 사이클이 발생하면 A가 변경될때 (A->B->C)로 영향을 끼치기 때문에 좋지 못한 설계라고 들었던 적이 있는데 아래와 같이 `Bank -> Client, Bank -> BankTask -> Client`와 같은 경우는 사이클이 생기지 않기 때문에 괜찮은 설계인지 더 개선해야하는 설계인지 궁금합니다!

![](https://i.imgur.com/xfR0TXj.png)

**재시작을 구현하기 위해 반복문을 사용한 것에 대하여**  
반복문을 통해 재시작을 구현하면서 생긴 이중 들여쓰기를 제거하기 위해 아래의 코드처럼 start 메서드를 구현했습니다. while문의 `{}`안이 비어있게 되어 보기 좋지 않은 것 같은데 더 좋은 방법이 있을지 궁금합니다.
```swift
func start() {
  while selectMenu() {}
}

private func selectMenu() -> Bool {
  displayMenu()
  guard let input = readLine(),
        let menu = Menu(rawValue: input)
  else { return true }

  switch menu {
  case .open:
    let bank = Bank(limit: Constants.limit)
    createClients().forEach { bank.addClient($0) }
    bank.open()
    return true
  case .exit:
    return false
  }
}
```

---

## [STEP 3]
### 고민 및 해결한 점
**기능 확장성에 대하여**  
기존에는 예금, 대출에서 새로운 업무를 추가할 때마다 연관된 다른 객체에도 영향을 주었기 때문에 기능을 확장하기 좋지 않은 설계였습니다. 이번 STEP3에서는 최대한 영향을 주지 않는 방법에 대해 고민했고 프로토콜을 사용하여 의존성을 외부에서 주입받고 역전시켜 문제를 해결할 수 있었습니다.

기존)

![](https://i.imgur.com/l1XqQDv.png)

개선)

![](https://i.imgur.com/GIAaIPG.png)

**하드코딩 제거**  
각 파일마다 열거형을 사용해서 하드코딩을 피하도록 하였습니다.

```swift
//BankDepositTask
private enum Constants {
  static let time = 0.7
  static let taskName = "예금"
}

//BankLoanTask
private enum Constants {
  static let time = 1.1
  static let taskName = "대출"
}
```

**업무 소요시간을 지연시키기위해 Timer 사용**  
```swift 
print(String(format: Constants.start, clientNumber))
Thread.sleep(forTimeInterval: Constants.time)
print(String(format: Constants.finished, clientNumber))
```

기존에는 위와 같이 `Thread.sleep`을 사용하여 시간을 지연시켰는데 해당 스레드의 Run loop가 작동중일 때 스레드가 멈춰버릴 수 있다는 문제가 있을 것 같아서 아래와 같이 `Timer`를 사용하도록 변경하였습니다.

```swift
func execute(_ client: Client) {
  let clientNumber = client.waitingNumber
  logger.log(.taskStart(number: clientNumber, taskName: Constants.taskName))
  Timer.scheduledTimer(withTimeInterval: Constants.time, repeats: false) { _ in
    logger.log(.taskFinish(number: clientNumber, taskName: Constants.taskName))
  }
  RunLoop.current.run()
}
```

**세마포어 (Semaphore)**  
공유 자원에 대한 접근을 제한할 수 있는 세마포어 개념을 학습하고 이번 프로젝트에는 은행원을 `DispatchSemaphore`의 자원으로 생각하여 구현했습니다. 세마포어의 `wait()`와 `signal()`사용과 사용 위치에 따른 차이점에 대해 고민했습니다.

**소요 시간 측정 방법**  
기능이 실행하는데 걸리는 시간을 측정하는 방법을 고민했고 재사용성을 위해 클로저를 파라미터로 받아 측정한 기능을 담아주는 방법으로 구현했습니다.

```swift
private func measureTaskTime(_ block: () -> Void) -> Double {
  let start = CFAbsoluteTimeGetCurrent()
  block()
  let end = CFAbsoluteTimeGetCurrent()
  return end - start
}
```

**Logger 객체에 대하여**  
실제 앱이나 프로그램이 동작할 때 콘솔에 직접 출력하면 안된다고 생각했고 실행 로그를 출력하는 역할을 Logger 객체가 담당하도록 분리했습니다. 

```swift
// Logger
final class Logger {
  ...

  func log(_ messageType: MessageType) {
    print(messageType.description)
  }
}
```

```swift
final class Logger {
  ...
    
  private var savedLog = [String]()

  func log(_ messageType: MessageType) {
    savedLog.append(messageType.description)
  }
}
```



### 조언 받고 싶은 점

**스레드가 고객의 수만큼 증가하는 것에 대하여**  
아래의 반복문의 `clientQueue`를 dequeue하고 async로 해당 작업을 넘기기 때문에 Client 수만큼 스레드가 증가하는 문제가 있었습니다.

```swift
private func executeBankTask() {
  let group = DispatchGroup()
  while let client = clientQueue.dequeue() {
    DispatchQueue.global().async(group: group) {
      client.taskType.semaphore.wait() // <---
      client.taskType.execute(client)
      client.taskType.semaphore.signal()
    }
  }
  group.wait()
}
```

<img width="400px" src="https://i.imgur.com/VTkKe7v.png"/> <br/>

위의 문제를 해결하기 위해 DispatchQueue에 작업을 보내기 전 `wait()`를 걸어주어 스레드가 세마포어 자원 수만큼만 생성되도록 할 수 있었습니다. 

하지만, 세마포어가 사용되어 `대출` 은행원 자원이 wait 상태일때 메인스레드도 더이상 진행되지 않기 때문에 `예금` 은행원 자원이 남아있는데도 불구하고 dequeue 자체가 되지 않는 문제가 있었습니다. 혹시 좋은 방법이 있을 지 궁금합니다.🤔 🙇🏻

```swift
private func executeBankTask() {
  let group = DispatchGroup()
  while let client = clientQueue.dequeue() {
    client.taskType.semaphore.wait() // <---
    DispatchQueue.global().async(group: group) {
      client.taskType.execute(client)
      client.taskType.semaphore.signal()
    }
  }
  group.wait()
}
```

**Logger 객체의 UML 연관관계 표시에 대해**  
BankLoanTask, BankDepositTask, Bank, BankManager 에서 Logger를 사용하고 있는데 UML을 작성할 때 이렇게 여러 곳에서 사용되는 객체를 표시할 때는 어떻게 표시해주면 좋을지 여쭤보고 싶습니다.

![](https://i.imgur.com/ioIuXft.png)

---

## 🪧 그라운드 룰

## 활동시간
### 📚 공통
**스크럼(수요일 제외)** : 10시 ~ 11시
- 전날 공부한 것을 공유
- 모르는 내용을 서로 묻기

### 세션 있는 날 (월/목)
- 세션 후) 17시 ~ 18시
- 식사 후) 20시 ~ 22시+

### 세션 없는 날 (화/수/금)
- 식사 후) 13시 ~ 18시
- 식사 후) 20시 ~ 22시+

---

## 코딩 컨벤션
**Swift 코드 스타일**
- 코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

**커밋 규칙**
- 커밋 제목은 최대 50자 입력
- 본문은 한 줄 최대 72자 입력

**커밋 제목 규칙**
- 제목 끝에 마침표(.) 금지, 한글로 작성

**커밋 메세지**
```
기능(feat): 새로운 기능 구현.
버그(fix): 버그, 오류 해결.
리팩토링(refactor): 코드 리팩토링 / 전면 수정이 있을 때 사용합니다
형식(style): 코드 형식, 정렬, 주석 등의 변경 (코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
문서(docs): 문서 수정 / README나 WIKI 등의 문서 개정.
기타(chore): 코드 수정, 내부 파일 수정
```

**브랜치 이름 규칙**
`STEP1`, `STEP2`, `STEP3`