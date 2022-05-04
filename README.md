# 🏦 은행 창구 매니저
>프로젝트 기간 2022.04.25 ~ 2022.05.06 
>
> 팀원: [OneTool](https://github.com/kimt4580), [Red](https://github.com/cherrishRed) / 리뷰어 :  [린생](https://github.com/jungseungyeo)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 구조](#프로젝트-구조)
- [키워드](#키워드)
- [STEP 1](#step-1)
- [STEP 2](#step-2)
- [STEP 3](#step-3)

## 프로젝트 소개

은행창구 매니저

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()

## 키워드
`Unit Test` `자료구조` `Queue` `Stack` `Protocol` `associatedtype` `Generic` `Test Double` `Struct` `Class` `의존성 관리도구` `cocoapod` `Swift Project Manager` `Home Brew` `Mint` `SwiftLint`

## 자세한 고민 보기
[STEP 1 PR](https://github.com/yagom-academy/ios-bank-manager/pull/145)
[STEP 2 PR](https://github.com/yagom-academy/ios-bank-manager/pull/159)

## [STEP 1]

### 🚀 trouble shooting
- test Unit 의 네이밍
- 구조체와 클래스
- protocol
- Unit Test

#### test Unit 의 네이밍
처음에 test 함수 네이밍을 메서드 테스트용으로 메서드의 이름을 text 함수명으로 바로 사용하였으나, 테스트를 알아보기 힘들다는 것을 알고 give, when, then 형식으로 바꿔서 네이밍을 해주었습니다.
ex) `test_isEmpty` -> `test_append_3번_후에_isEmpty호출_removeAll호출_결과가_true인지`

#### 구조체와 클래스
처음엔 모든 객체를 `struct` 로 구현했습니다. `Node` 객체 내부에서 `Node` 를 가져야하는 문제와, `Queue` 나 `LinkedList` 객체의 메서드가 내부의 정보를 변경하기 때문에 거의 모든 메서드의 `mutating` 이 필요했습니다. 
변경이 자주 일어나는 객체들이라고 판단해서 `class` 를 선택하였고 `final` 키워드를 붙여 컴파일 최적화를 해 주었습니다. 

#### protocol & associatedtype
처음엔 `Queue` 객체의 역할이 `LinkedList` 의 메서드를 호출해 주는 역할 뿐이었습니다.
`LinkedList` 말고도 다양한 자료구조로 `Queue` 를 만들 수 있고 시도해 보라는 리뷰어의 조언을 받아 `Double stack` 으로도 `Queue` 를 구현 하였습니다.

`Queue` 를 생성할 때, 어떤 자료구조로 생성할지 선택할 수 있도록 `Listable` 이라는 `protocol` 을 각 자료구조 객체에 채택해서 사용할 수 있도록 해주었습니다.

```swift
protocol Listable {
    associatedtype Element
    var isEmpty: Bool { get }
    var first: Element? { get }

    func append(value: Element)
    func removeAll()
    func removeFirst() -> Element?
}


final class Queue<List: Listable> {
    let list: List
}

final class LinkedList<T>: Listable {
}

final class DoubleStack<T>: Listable {
    
}
```
프로토콜에서 제네릭을 채택해 주기 위해 `associatedtype` 을 사용했습니다.

#### Unit Test
처음엔 LinkedList를 이용해서 Queue를 구현해 주었고, 그로 인해서 test를 진행할 때 Queue를 검사하면서 LinkedList를 함께 검사했습니다. 하지만 따로 검사를 해주어야 한다는 생각이 들었고, Test Double이라는 것을 공부하여 Mock data를 만들어주어 사용해주었습니다.

### ✏️ 배운 개념
- 의존성 관리 도구 
- target membership과 console app scheme 설정
- Test Double
- 연산프로퍼티와 메서드의 차이점

#### 의존성 관리 도구
프로젝트가 어떤 외부 라이브러리를 사용하고 있는지를 별도로 관리하는 것을 의존성 관리라고 한다.
라이브러리를 많이 사용하게 될 수록 사람이 직접 관리를 하게 되는 것이 오류를 발생할 수 있다. 도구를 적절히 활용하자. 

|도구|장점|단점|
|---|---|---|
|cocoaPod|세팅이 간편. 추가작업 없음. 많은 라이브러리 지원| Rudy gem 필요. 빌드 시간이 길다.pod install or update 시간이 길다.
|carthage|자율성이 높다. 빌드 속도가 빠르다. | 중앙화된 라이브러리 목록 없음. 의존성이 추가될 때마다 해줘야 하는 세팅을 수정해 주어야 한다.코코아팟 보다 지원하는 라이브러리의 수가 적다.
|swift package manger| Apple이 만든 first party depdendency manager. 이미 설치가 되어 있고 가장 편리함 | 코코아팟 보다 지원하는 라이브러리의 수가 적다.|


#### target membership과 console app scheme 설정
<div> 
    <img title="LinkedList" src="https://i.imgur.com/GowdsJk.png" width="200">
    <img title="Queue" src="https://i.imgur.com/tGpQQEC.png" width="200">
    <img title="DoubleStack" src="https://i.imgur.com/yVL0Mn4.png" width="200">        
</div>
<br>
<div> 
    <img title="LinkedListTests" src="https://i.imgur.com/kOTFjyG.png" width="200">
    <img title="DoubleStackTests" src="https://i.imgur.com/q5VDOkW.png" width="200">
    <img title="QueueTests" src="https://i.imgur.com/q5VDOkW.png" width="200">
</div>
<br>
<img title="Scheme" src="https://i.imgur.com/YkCpmxX.png" width="700">

console 환경은 View 환경과 달리 테스트할 파일을 unit test 파일로 target을 설정해 주어야 하고, 동시에 테스트 할 모든 test 파일에 대해서 scheme도 설정되어 있어야 한다는 것을 알았습니다.

#### Test Double
테스트를 위해서 필요한 객체를 말한다.
|종류|내용|
|:--:|:--:|
|Dummy| 객체는 전달 되지만, 사용되지 않는 객체
|Fake|동작하는 구현은 있지만, 실제로는 적합하지 않은 객체
|Stub|테스트에서 호출된 요청에 대해서만 결과를 제공, 이외 내용은 응답하지 않음
|Spy|Stub의 역할과 동시에 호출된 내용에 대한 정보를 기록
|Mock|기존의 객체를 단순화 하여 만든 객체, 내용에 따라 응답 


#### 연산프로퍼티와 메서드의 차이점
연산 프로퍼티와 메서드는 비슷한 용도로 사용할 수 있지만 분명히 차이점이 있습니다.
상황에 따라 잘 사용하면 좋을 것 같습니다.
|  |장점|단점|
|:---:|:--:|:--:|
|연산 프로퍼티|메모리 count를 올리지 않고 접근이 가능|파라미터 사용 불가능| 
|메서드|파라미터를 받을 수 있음|메모리 count가 올라감.|


## [STEP 2]

### 🚀 trouble shooting
- 의존성과 protocol
- 시간 복잡도가 높은 재귀 제거
- Const 의 위치 
- race condition (충돌)

#### 의존성과 protocol
```swift
protocol Manageable {
    func manageBanker()
    func reportOfDay() -> String
}
```
```swift
private func selectMenu(by userChoice: UserChoice) -> Bool {
        switch userChoice {
        case UserChoice.start:
            bank.manageBanker()
            print(Const.finishWork)
            print(bank.reportOfDay())
            return true
        case UserChoice.exit:
            return false
        }
    }
```
처음에 코드를 작성했을 때, BankManager와 Bank의 의존성이 너무 높았습니다. 의존성을 떨어뜨려주어야 한다고 생각했고, 역할 분리의 중요성을 깨달았습니다. 역할에 맞는 메서드를 역할에 따라 명확히 정리해주었더니, Bank에서 사용되는 인스턴스들에 대해서 많은 캡슐화를 할 수 있게 되었고, BankManager에서 사용되는 Bank의 인스턴스들은 protocol로 전달해주어, 의존성을 더 낮춰주었습니다.

#### 시간 복잡도가 높은 재귀 제거
재귀 함수를 작성했을 때, 계속 재귀를 하였고 그로 인해서 스레드 안에 메서드가 계속해서 쌓였습니다. 작성했던 재귀 함수는 시간복잡도가 높으면서 동시에 공간 복잡도도 높았기에, 사용하면 안되는 알고리즘으로 인식하였고, 공간 복잡도를 낮춰주는 방향으로 코드를 다시 작성해주었습니다.


#### Const 의 위치 
`Const` 라는 `enum` 을 생성해 파일을 만들어 전역에서 접근할 수 있도록 하였습니다. 
여러파일에서 `Const` 를 사용하다 보니, `Const.startWorking` 이런식으로 사용하게 되었을 때, 무슨 값이 들어있는지 확인하려면 구현부를 찾아가보아야 하는 문제점이 있었습니다. 

그래서 전역`Const` 에는 여러개의 파일에서 접근할 수 있는 값만 넣어놓고, 각각 파일에서만 사용되는 값은 파일 상단에 아래와 같이 배치해 주었습니다. 
```swift
fileprivate extension Const {
    static let startWorking = "번 고객 업무 시작"
    static let endWorking = "번 고객 업무 종료"
}
```


#### race condition (충돌)
![](https://i.imgur.com/4scVqdo.png)
`Banker` 객체에 있는 `customer` 란 프로퍼티에 여러개의 쓰레드에서 동시에 접근하려고 해서 race condition 이 일어났습니다.
`customer` 란 프로퍼티을 제거하고, `work(customer: Customer)` 메서드의 파라미터로 넘겨주어 문제를 해결했습니다.

### ✏️ 배운 개념
- 시간 복잡도 계산법
- dispatchQueue & dispatchSemaphore & dispatchGroup

#### 시간 복잡도 계산법
최선의 경우 (Best Case) - 빅 오메가 표기법 사용
최악의 경우 (Worst Case) - 빅 오 표기법 사용
평균적인 경우 (Average Case) - 빅 세타 표기법 사용

최악의 경우의 시간 복잡도를 구하기 위해 빅오 표기법을 사용했습니다. 

|종류|시간|설명|
|:--:|:--:|:--:|
|$O(1)$|상수 시간|어떤 조건이 있든 항상 일정한 단계를 가지는 알고리즘의 시간 복잡도를 나타낸다.
|$O(n)$|로그 시간|데이터 원소의 개수가 N 개 일때, N 개의 단계를 가지는 알고리즘의 시간 복잡도를 나타낸다.
|$O(logN)$|선형 시간|데이터가 2배로 증가할 때마다 한 단계씩 늘어나는 알고리즘의 시간 복잡도를 나타낸다.
|$O(N²)$|2차 시간|데이터가 증가 할 때마다 N² 단계가 늘어나는 알고리즘의 시간 복잡도를 나타낸다.
|$O(2^n)$|2차 시간|데이터가 증가 할 때마다 연산수가 2^n 단계가 늘어나는 알고리즘의 시간 복잡도를 나타낸다.

![img](https://i.imgur.com/P6L4Iy6.jpg)



$T(n) = n^2+2n+1 = O(n^2)$
위 수식에서, 각 메서드가 동작하는 시간 복잡도가 $n^2$, $n$ ($n$ 앞의 상수는 무시) 이라고 했을 때 가장 시간 복잡도가 높은 메서드의 시간 복잡도를 Worst Case 시간 복잡도라고 하고, 결국 이 메서드의 전체 시간 복잡도는 $n^2$인 것이다.

#### dispatchQueue & dispatchSemaphore & dispatchGroup
dispatchQueue 는 swift 에서 동시성 프로그래밍을 구현하고 싶을 때 사용하는 GCD 의 기능 중 하나입니다.
큐에 보내다라는 의미로 dispatchQueue 를 이용해서 작업들을 큐에 보내면 GCD가 알아서 쓰레드로 분배해 줍니다.

**Serial Queue vs Concurrent Queue**
Serial Queue는 하나의 thread 로만 작업을 보냅니다.
Concurrent Queue 는 여러개의 thread 로 작업을 보냅니다.
![Serial Queue vs Concurrent Queue](https://i.imgur.com/RiKc0wm.jpg)

**sync vs async**
작업들이 비동기적으로 일어나는지 (끝날 때까지 기다렸다가 일어남) 동기적으로 일어나는지를 나타냅니다 
![sync vs async](https://i.imgur.com/u4HVvHz.jpg)

**Semaphore**
dispatchSemaphore는 공유 자원에 접근하는 작업의 수를 제한할 때 사용됩니다.
```swift
let semaphore = DispatchSemaphore(value: 3)
// 한번에 실행 가능한 작업의 수는 3
```
```swift
for i in 1...3 {
    semaphore.wait() // semaphore 감소
    DispatchQueue.global().async {
        print("시작 \(i)")
        sleep(2)
        print("끝 \(i)")
        semaphore.signal() // semaphore 증가
    }
}
```
semphore로 정한 구역의 한번에 몇개의 작업씩 이루어지게 할 것 인지를 정해주는 것입니다. wait(), signal() 선언으로 한번에 작업할 수를 유지 시켜준다고 보면 됩니다. 

**dispatchGroup**
Group 으로 코드들을 묶어 줄 수 있다.
>여러 스레드로 분배된 작업들이 끝나는 시점을 각각 파악하는 것이 아니라, 하나로 그룹지어서 한번에 파악하고 싶을때 Dispatch Group을 사용, 즉, 그룹으로 묶인 작업의 마지막 시점을 파악하는 것

```swift
let group = DispatchGroup()

// async로 그룹을 지정해주기
DispatchQueue.global().async(group: group) {}

// enter, leave를 사용해서 묶어 주기
group.enter() // 그룹이 시작됨을 알림
DispatchQueue.global().async {}
group.leave() // 그룹이 시작됨을 알림
```

```swift
group.wait()
```
```swift
group.notify(queue: .main) {
    print("모든 작업이 끝났습니다.")
}
```
`wait()` : 그룹의 모든 작업이 끝날 때 까지 기다린 후 다음 줄을 실행합니다.
`notify()` : 그룹으로 묶인 모든 작업이 끝났을때 실행될 작업을 넘겨줍니다.

```swift
let timeoutResult = group.wait(timeout: .now() + 60)
switch timeoutResult {
  case .success:
    print("60초 안에 그룹 내 모든 task 끝냄")
  case .timedOut:
    print("60초 안에 그룹 내 모든 task 못끝냄")
}
```
`wait(time: 시간)`: DispatchTimeoutResult 를 반환하는데 이 값을 통해 시간 내에 그룹 내 모든 task 가 완료되었는지 판단합니다.
