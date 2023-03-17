# 은행 창구 매니저

---
# 은행 창구 매니저 프로젝트 🏦
> 은행에서 예금, 대출 업무를 원하는 여러 고객을 여러 은행원이 1:1로 매칭되어 업무를 처리하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#팀원-소개)
2. [타임 라인](#타임라인)
3. [UML](#UML)
4. [실행화면](#실행화면)
5. [트러블 슈팅](#트러블-슈팅)
6. [Reference](#Reference)
7. [팀 회고](#팀-회고)

## 팀원 소개

| 혜모리 | 레옹아범 |
|:----:| :----: |
|<div width="130" height="200"><img src="https://github.com/hyemory/ios-bank-manager/blob/step3/images/hyemory.png?raw=true" width="130" height="130"/></div>|<div width="130" height="200"><img src="https://github.com/hyemory/ios-bank-manager/blob/step3/images/leon.jpeg?raw=true" width="130"></div>|
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/hyemory) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/fatherLeon) |

## 타임라인

|날짜|진행 내역|
|:-:|:-:|
|2023.3.6.(월)|`Console App` : LinkedList, Queue 구현 및 테스트 진행|
|2023.3.7.(화)|`Console App` : Customer, Bank 타입 구현|
|2023.3.8.(수)|`Console App` : 전체 코드 리팩토링|
|2023.3.9.(목)|`Console App` : 네이밍 수정 및 일부 메소드 추가 구현|
|2023.3.10.(금)|GCD 학습 및 프로젝트 회고|
|2023.3.13.(월)|`UI App` : 레이아웃 구현|
|2023.3.14.(화)|`Console App` 수정사항 반영 및 리팩토링 <br/> `UI App` : 버튼 동작 구현|
|2023.3.15.(수)|`UI App` : 전반적인 기능 구현|
|2023.3.16.(목)|`UI App` : 오류 수정 및 리팩토링|
|2023.3.17.(금)|프로젝트 회고 및 수정사항 반영|

## UML

<details>
<summary><Big>Class Diagram 보기</Big></summary>
    
![](https://github.com/hyemory/ios-bank-manager/blob/ee4c63b9a41fea10ca442e8764f5bfe2a1e6ea87/images/ClassDiagram.png?raw=true)
    
</div>
</details>

</br>

---

## 실행화면

|Console 앱 <br/> 1: 기능 실행 / 2: 앱 종료|
|:-:|
|![](https://github.com/hyemory/ios-bank-manager/blob/step4/images/콘솔앱실행화면.gif?raw=true)|

|10명 추가 후 업무 완료|업무 중 고객 추가|업무 완료 + 실행 중 초기화|
|:-:|:-:|:-:|
|![](https://github.com/hyemory/ios-bank-manager/blob/85a28dd979b668b84b27b239a1d9f01ba8927e0a/images/addCustomer_10.gif?raw=true)|![](https://github.com/hyemory/ios-bank-manager/blob/85a28dd979b668b84b27b239a1d9f01ba8927e0a/images/addCustomer_30.gif?raw=true)|![](https://github.com/hyemory/ios-bank-manager/blob/85a28dd979b668b84b27b239a1d9f01ba8927e0a/images/reset.gif?raw=true)|



## 트러블 슈팅

### 1️⃣ Unit test 오류

#### ❓ 문제점

Unit test 시 접근 수준이 internal인 타입에 접근하기 위해 아래와 같이 프로젝트를 import하였습니다.

``` swift
@testable import BankManagerConsoleApp
```

그러나 Unit test를 돌리니 아래 이미지와 같은 오류가 발생했습니다.

![](https://github.com/hyemory/ios-bank-manager/blob/step3/images/error.png?raw=true)

#### 📖 해결법

* 현재 `Command Line Tool` 환경에서 구현 중인데 `testable`의 경우 iOS MacOS 등등 UI환경을 개발할 경우에만 사용가능한 것을 알았습니다.
* 따라서, `Target Membership`을 통하여 유닛테스트를 진행하였습니다.

### 2️⃣ 하나의 node 실행 후 동작을 0.7초 멈추는 방법 고민(Sleep)

#### ❓ 문제점
* Serial큐에 sync작업 결정 후 하나의 작업 당 0.7초씩 기다리는 것에 대해 고민했습니다.
```swift
func sleep(_: UInt32) -> UInt32
```
* 가장 먼저 생각난게 위 메소드였지만 UInt32라서 정수형만 받는 문제 때문에 다른 함수를 사용하였습니다.


#### 📖 해결법
```swift
class func sleep(forTimeInterval: TimeInterval)
```

* `Thread`에 구현된 타입메소드를 사용하여 각각의 Task마다 0.7초씩 시간을 기다리도록 만들어 주었습니다.
* Serial큐를 사용하여 쓰레드가 하나며 main쓰레드가 아니므로 멈추어도 큰 문제가 없었고 sync동기를 사용하여 작업이 끝날때까지 기다리므로 아래와 같이 구현하였습니다.

```swift
private static func work(for customer: Customer) {
    let workQueue = DispatchQueue(label: "WorkQueue")

    let queueItem = DispatchWorkItem {
        print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 시작")
        Thread.sleep(forTimeInterval: customer.desiredBanking.time)
        print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 완료")
    }

    workQueue.sync(execute: queueItem)
}
```

### 3️⃣ 캡쳐리스트의 강한순환참조 문제

#### ❓ 문제점
```swift
DispatchQueue.main.async { [self] in
    workingStackView.removeLabel(customer: customer)
}
```

* 위와 같은 코드가 있을 경우 캡쳐리스트가 `[self]` 이므로 강한참조이므로 강한순환참조 문제가 발생할것 같다는 우려가 있었습니다.

#### 📖 해결법
* 만약 `DispatchWorkItem`을 사용하여 클로저를 프로퍼티로 가지고 있다면 강한순환참조 문제가 발생할 수도 있지만, 위 코드와 같이 메소드의 인자로 클로저를 줄 경우 곧바로 실행되므로 강한순환참조 문제는 일어나지 않는다는 것을 배웠습니다.
* 또한 GCD에서 캡쳐리스트를 통한 참조는 단순히 강한순환참조를 해결하는 것이 아닌 객체의 생명주기를 생각하며, 사용해야한다는 것을 배웠습니다.


### 4️⃣ 타이머 시작 시간이 0으로 세팅되지 않는 문제

#### ❓ 문제점
``` swift
var date = Date()
```

- Date의 이니셜라이저를 Label에 넣어주니 타이머가 현재 시간부터 시작되는 현상을 발견했습니다. 

#### 📖 해결법
``` swift
private func configureTimer() {
    if timer != nil { return }

    var date = Date(timeIntervalSince1970: 0)

    timer = DispatchSource.makeTimerSource(queue: .main)
    timer?.schedule(deadline: .now(), repeating: .milliseconds(BankOption.timerMilliSecond))

    timer?.setEventHandler(handler: { [self] in
        date = date.addingTimeInterval(BankOption.timerSecond)

        workTimeLabel.text = "업무시간 - \(date.applyDateFormatter())"
    })

    timer?.resume()
    isRunningTimer = true
}
```

- Date의 이니셜라이저 `timeIntervalSince1970`를 0으로 설정하니 해결되었습니다. (1970년 1월 1일 00:00:00)

### 5️⃣ 초기화 버튼 클릭 시 기존 작업 정지

#### ❓ 문제점
* 요구사항에 따라 초기화 버튼을 클릭 시 기존의 작업들이 전부 사라지는 기능을 구현해야 했습니다.
* 초기화 버튼 클릭시 기존의 작업들은 전부 사라져도 이미 쓰레드 내에서 실행중 혹은 실행예정이던 작업들은 사라지지 않고 이후 `업무중` 뷰에 라벨로 표시가 되는 문제가 있었습니다.
* `DispatchQueue`에는 현재 쓰레드에 들어가 있는 작업을 삭제하는 방법, 쓰레드 삭제 등의 방법이 구현되어있지 않았습니다.

#### 📖 해결법
```swift
private static func work(for customer: Customer) {
    let workQueue = DispatchQueue(label: "WorkQueue")

    let queueItem = DispatchWorkItem(qos: .userInitiated) {
        if isRunningWork {
            NotificationCenter.default.post(name: .workingNoti, object: customer)
            Thread.sleep(forTimeInterval: customer.desiredBanking.time)
            NotificationCenter.default.post(name: .completeNoti, object: customer)
        }
    }

    workQueue.sync(execute: queueItem)
}
```

* 상태 변수(Flag)를 추가하여 해당 변수가 `False`일 경우 초기화 버튼을 눌렀다고 판단하여 `Thread.sleep`을 동작하지 않도록 구현하였습니다.
* 위 방법으로 구현을 할시 초기화 버튼을 누를 경우 `업무중`뷰에 라벨이 추가되지도 않을 뿐더러 이후 작업과 같이 동작하지 않도록 구현하였습니다.

## Reference

- [애플 공식문서 - timeIntervalSince(_:)](https://developer.apple.com/documentation/foundation/date/1779636-timeintervalsince)
- [애플 공식문서 - sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [애플 공식문서 - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
- [애플 공식문서 - DispatchWorkItem](https://developer.apple.com/documentation/dispatch/dispatchworkitem)
- [애플 공식문서 - TimeInterval](https://developer.apple.com/documentation/foundation/timeinterval)
- [애플 공식문서 - QOS 우선순위 문제](https://developer.apple.com/documentation/xcode/diagnosing-performance-issues-early)
- [애플 공식문서 - DispatchSourceTimer](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer)
- [애플 Documentation Archive - Data Formatters](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW10)
- [야곰닷넷 - Concurrency Programming](https://yagom.net/courses/%EB%8F%99%EC%8B%9C%EC%84%B1-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-concurrency-programming/)
- [GCD의 순환참조](https://medium.com/@almalehdev/you-dont-always-need-weak-self-a778bec505ef)


## 팀 회고

<details>
<summary> 팀 회고 내용 보기 </summary>

### 우리팀이 잘한 점
- 매일 성실하게 프로젝트를 진행하여 시간 내에 프로젝트를 마친 점
- 코드 컨벤션을 잘 협의하고 지킨 점
- 적절한 네임스페이스를 활용하였다는 점

### 우리팀 개선할 점
- 타입프로퍼티와 타입메소드의 무분별한 사용
- 다양한 시도를 하지 못했다는 점

### 서로 칭찬하기
- 레옹아범 -> 혜모리
    - 2주간 바쁜일정속에서도 항상 시간약속 잘 지키시고 꾸준하셨습니다!!👍
    - 프로젝트 진행 과정 중 사소한 부분도 꼼꼼하게 체크해주셔서 프로젝트 진행이 한결 편했던것 같습니다. 감사합니다🙇

- 혜모리 -> 레옹아범
    - 너무 잘하셔서 따라가느라 바빴습니다 👍 문제 해결능력도 너무 뛰어나시고 이해력이 좋으셔서 새로운 기능을 반영하는 것도 빠르게 잘 하셨습니다. 
    - 꼼꼼하시고 똑똑하셔서 이번에 많이 배워갑니다. 감사합니다! 🙇🏻‍♀️
    
</details>

