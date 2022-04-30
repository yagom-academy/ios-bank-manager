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


## ✨ 구현내용
- `LinkeList`가 채택할 `Listable`프로토콜 구현
- `Queue`의 역할을 할 양방향`LinkedList` 자료구조 구현
- `LinkeList`, `Queue` UniTest 진행


## 📖 학습내용
- `Protocol`과 `associatedtype`를 이용한 제네릭 프로토콜 구현과 사용법에 대한 이해
- 의존성 주입과 의존성 분리에 대한 이해
- 테스트를 위한 `Mock`타입에 대한 구현 방법과 사용법
- `P.O.P` 프로그래밍 페러다임 이해
- `Dispatch Framework`의 종류 및 구현 방법과 사용법


## 🤔 고민한 점 및 해결한 방법 
### [STEP 1]
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

### [STEP 2]
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

