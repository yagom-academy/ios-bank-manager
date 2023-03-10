# 은행 창구 매니저 프로젝트 🏦
> 은행에서 예금, 대출 업무를 원하는 여러 고객을 여러 은행원이 1:1로 매칭되어 업무를 처리하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#팀원-소개)
2. [타임 라인](#타임라인)
3. [UML](#uml)
4. [실행화면](#실행화면)
5. [트러블 슈팅](#트러블-슈팅)
6. [Reference](#reference)

## 팀원 소개

| 혜모리 | 레옹아범 |
|:----:| :----: |
|<div width="130" height="200"><img src="https://github.com/hyemory/ios-bank-manager/blob/step3/images/hyemory.png?raw=true" width="130" height="130"/></div>|<div width="130" height="200"><img src="https://github.com/hyemory/ios-bank-manager/blob/step3/images/leon.jpeg?raw=true" width="130"></div>|
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/hyemory) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/fatherLeon) |

## 타임라인

|날짜|진행 내역|
|:-:|:-:|
|2023.3.6.(월)|LinkedList, Queue 구현 및 테스트 진행|
|2023.3.7.(화)|Customer, Bank 타입 구현|
|2023.3.8.(수)|전체 코드 리팩토링|
|2023.3.9.(목)|네이밍 수정 및 일부 메소드 추가 구현|
|2023.3.10.(금)|GCD 학습 및 프로젝트 회고|

## UML

![](https://github.com/hyemory/ios-bank-manager/blob/step3/images/BankManager.png?raw=true)

## 실행화면

|STEP 2 Console 앱 <br/> 1: 기능 실행 / 2: 앱 종료|
|:-:|
|![](https://github.com/hyemory/ios-bank-manager/blob/step3/images/step2_%EC%8B%A4%ED%96%89%ED%99%94%EB%A9%B4.gif?raw=true)|

## 트러블 슈팅

### 1️⃣ Unit test 오류

#### 문제점

Unit test 시 접근 수준이 internal인 타입에 접근하기 위해 아래와 같이 프로젝트를 import하였습니다.

``` swift
@testable import BankManagerConsoleApp
```

그러나 Unit test를 돌리니 아래 이미지와 같은 오류가 발생했습니다.

![](https://github.com/hyemory/ios-bank-manager/blob/step3/images/error.png?raw=true)

#### 해결법

* 현재 `Command Line Tool` 환경에서 구현 중인데 `testable`의 경우 iOS MacOS 등등 UI환경을 개발할 경우에만 사용가능한 것을 알았습니다.
* 따라서, `Target Membership`을 통하여 유닛테스트를 진행하였습니다.

### 2️⃣ 동작 0.7초 멈추기(Sleep)

#### 문제점
* Serial큐에 sync작업 결정 후 하나의 작업 당 0.7초씩 기다리는 것에 대해 고민했습니다.
```swift
func sleep(_: UInt32) -> UInt32
```
* 가장 먼저 생각난게 위 메소드였지만 UInt32라서 정수형만 받는 문제 때문에 다른 함수를 사용하였습니다.

#### 해결법

```swift
class func sleep(forTimeInterval: TimeInterval)
```

* `Thread`에 구현된 타입메소드를 사용하여 각각의 Task마다 0.7초씩 시간을 기다리도록 만들어 주었습니다.
* Serial큐를 사용하여 쓰레드가 하나며 main쓰레드가 아니므로 멈추어도 큰 문제가 없었고 sync동기를 사용하여 작업이 끝날때까지 기다리므로 아래와 같이 구현하였습니다.

```swift
let queueItem = DispatchWorkItem {
    print("\(customer.number)번 고객 업무 시작")
    Thread.sleep(forTimeInterval: 0.7)
    print("\(customer.number)번 고객 업무 완료")
}
```

## Reference

- [애플 공식문서 - timeIntervalSince(_:)](https://developer.apple.com/documentation/foundation/date/1779636-timeintervalsince)
- [애플 공식문서 - sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [애플 공식문서 - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
- [애플 공식문서 - DispatchWorkItem](https://developer.apple.com/documentation/dispatch/dispatchworkitem)
- [애플 공식문서 - TimeInterval](https://developer.apple.com/documentation/foundation/timeinterval)
- [애플 Documentation Archive - Data Formatters](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW10)
- [야곰닷넷 - Concurrency Programming](https://yagom.net/courses/%EB%8F%99%EC%8B%9C%EC%84%B1-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-concurrency-programming/)
