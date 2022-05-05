# 🏦 은행 창구 매니저

>프로젝트 기간 2022.04.25 ~ 2022.05.06
>
>팀원 : [dudu](https://github.com), [Eddy](https://github.com/kimkyunghun3) / 리뷰어 : [또치](https://github.com/TTOzzi)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)

## 프로젝트 소개

은행 창구 매니저 만들기!

![](https://i.imgur.com/LtcGejF.gif)

## UML
![](https://i.imgur.com/VEDUGMV.png)

## 개발환경 및 라이브러리
![swift](https://img.shields.io/badge/swift-5.5-orange)
![xcode](https://img.shields.io/badge/Xcode-13.0-blue)
![iOS](https://img.shields.io/badge/iOS-14.0-yellow)

## 키워드

`git flow` `Queue` `LinkedList` `TDD` `Protocol Oriented Programming` `추상화` `GCD` `DispatchQueue` `DispatchSemaphore` `DispatchGroup` `Thread` `Timer` `OperationQueue` `Closure` `Trailing Closure`

## 고민한점

- test 코드와 실제 코드의 커밋 단위
- 이미 검증된 매서드를 다른 매서드의 테스트에서 사용하는것
- 구조체가 참조타입을 프로퍼티로 가지고 있는 경우
- 구조체의 mutating 키워드
- Thread.sleep()
- private 매서드 테스트 여부
- STEP2의 비지니스 로직 테스트 방법
- testcode 메서드 테스트 하는 단위
- Delegate를 weak으로 선언하는 부분
- bank 클로저 속 bank, bankWindow delegate 채택
- 항상 weak self를 써도 되는지
- 동일 로직의 연산 프로퍼티 vs 메서드 vs extension의 차이
- 세마포어 global Thread 로직 부분를 분리할 수 있을까?
- Enum namespace 요소별 분리를 어느정도로 해야하는지?
- lazy var 사용
- 파일 한 곳에 여러 extension를 사용이 괜찮을까?
- 데이터 전송 방식 Delegate, Closure 각각의 장단점
- 후행 클로저의 실제 작동 방식 과 multiple 후행 클로저의 개념

### 자세한 고민 보기

#### [STEP1](https://github.com/yagom-academy/ios-bank-manager/pull/144)
#### [STEP2](https://github.com/yagom-academy/ios-bank-manager/pull/154)
#### [STEP3](https://github.com/yagom-academy/ios-bank-manager/pull/163)
#### [STEP4](https://github.com/yagom-academy/ios-bank-manager/pull/174)

## 배운개념

#### CFAbsoluteTimeGetCurrent() 을 사용해서 코드의 실행시간을 측정할 수 있는 법

`CFAbsoluteTimeGetCurrent()` 메서드의 공식문서 정의는 아래와 같다.
> Returns the current system absolute time.

현재 시스템의 절대적인 시간을 리턴함으로써 이를 활용해서 시간 측정을 했다.
클로저를 활용해서 중간에 호출 될 것을 정하고 시작 시간과 끝나는 시간을 정하고 이를 뺀 값이 실제 
중간 target()의 실행시간으로 측정이 가능하게 되었다.

```swift 
private func checkTime(target: () -> Void) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    target()
    let endTime = CFAbsoluteTimeGetCurrent()
    return (endTime - startTime)
}
```

#### enum과 rawValue 활용한 유저 입력 처리

enum의 rawValue를 활용해서 유저의 입력을 처리할 수 있도록 구현했다.
이렇게 사용함으로써 유저의 입력을 단순 숫자로 판단하는것이 아니라 rawValue에 적절한 케이스로
매칭되기 때문에 가독성도 올라가고 실제 다른 옵션이 추가되어도 enum부분만 변경해주면 되기 때문에 
변경에 용이하게 대처가 가능해진다.

```swift
// 선언부
enum Banking: CaseIterable {
    case deposit
    case loan
}

extension Banking {
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }

    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

// 호출부 
private func inputUserOption() -> MenuOption {
    guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces),
          let userSelection = MenuOption(rawValue: userInput) else { return .invalidInput }

    return userSelection
}
```

#### Protocol을 이용한 추상화

Protocol를 이용하면 사용할 메서드나 프로퍼티를 모아서 추상화 타입을 만들고, 
이를 채택하는 객체에서 실제로 구현하는 식으로 사용한다
이런식으로 실제 타입을 추상화 시켜서, 더욱 유연한 코드를 작성할 수 있다
또한 Protocol + extension를 사용하면 프로퍼티나 매서드의 기본 구현이 가능하고, 사용하는 곳에서는 이를 호출만 하게할 수 있다.

```swift 
protocol BankWindow: AnyObject {
    func receive(_ customer: Customer)
    var delegate: BankWindowDelegate? { get set }
}

class BankLoanWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .loan

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(self, customer: customer)
        work()
        delegate?.customerWorkDidFinish(self, customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}

class BankDepositWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .deposit

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(self, customer: customer)
        work()
        delegate?.customerWorkDidFinish(self, customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}
```


#### DispatchQueue, Group, Semaphore

- DispatchGroup 사용법
    - 여러 작업을들 하나의 group으로 묶을 수 있다
    - group.wait()으로 그룹의 작업들이 모두 끝날때까지 기다릴 수 있다
    - group.notify()로 그룹의 작업이 끝날때 알림을 줄 수 있다

```swift
let group = DispatchGroup()

DispatchQueue.global().async(group: group) {
    print("task1")
}

DispatchQueue.global().async(group: group) {
    print("task2")
}

DispatchQueue.global().async(group: group) {
    print("task3")
}

group.notify(queue: .main) {
    print("모든 작업이 끝났다!")   
}

/*
task1
task2
task3
모든 작업이 끝났다!
*/

```

#### OperationQueue

- BlockOperation 사용법
- OperationQueue에 Operation 추가하는 법
- waitUntilAllOperationsAreFinished() 사용법

실행중인 연산이나 큐들이 끝날 때까지 현재 쓰레드가 블록이 되긴 하지만 프로젝트에서는 메인 쓰레드를 막기에 사용할수는 없었다!
```swift 
DispatchQueue.global().sync {
    loanQueue.waitUntilAllOperationsAreFinished()
    depositQueue.waitUntilAllOperationsAreFinished()
}
```

- addOperation은 굳이 weak self 안해도 됨
addOperation가 실행되고 큐에서 제거되게 되자마자 참조 사이클이 없어지기 때문에 wek self를 사용할 필요가 없다.

ex)
```swift
let myQueue = OperationQueue()
myQueue.addOperation {
    print("작업 추가1")
}
myQueue.addOperation {
    print("작업 추가2")
}

myQueue.waitUntilAllOperationAreFinished()
```

#### Timer 사용법

타이머를 사용해서, 일정주기로 같은 코드를 반복실행하는 법을 배웠다

```swift
// 타이머 생성하는법
if timer == nil {
    timer = Timer.scheduledTimer(timeInterval: Const.timeInterval, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
}

// 타이머가 반복될때마다 실행될 함수
@objc private func startTimer() {
    seconds += Const.timeInterval
}

// 타이머 종료하는법
timer?.invalidate()
timer = nil


```

#### closure를 활용한 데이터 전달

closure를 사용해서, 원하는 시점에 특정 코드가 실행되게 하는 법을 배웠다

ex)

```swift
// 매서드 정의
func work(start: () -> (), end: () -> ()) {
    start()
    //작업..
    end()
}

// 매서드 호출하는 부분
work {
    print("작업을 시작했습니다")
} end: {
    print("작업이 끝났습니다")
}
```

#### UUID 활용한 식별

```swift
UUID().uuidString
```
을 사용해서 객체의 고유한 identity를 구분할 수 있는법을 배웠다

예를 들어 이를 아래의 메서드에서 활용할 수 있었다.
대기스택뷰에 고객들이 들어가게 되며 각각의 고객에 대한 customerViews에서 하나씩을 구분하여 이를 filter를 통해 뺴낸 다음 대기스택뷰에서 제거하는 방식에 사용했다.

```swift
func customerWorkDidStart(_ bank: Bank, id: String) {
    DispatchQueue.main.async {
        guard let customerViews = self.bankView.waitStackView.arrangedSubviews as? [CustomerView] else { return }

        guard let targetView = customerViews.filter({ customerView in
            customerView.customer.id == id
        }).first else { return }

        targetView.removeFromSuperview()
        self.bankView.workStackView.addArrangedSubview(targetView)
    }
}
```
