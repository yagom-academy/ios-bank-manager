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
