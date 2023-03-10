# 은행창구 매니저 💰
> 은행창구 매니저가 되서 은행 업무를 관리하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230306--230310)
3. [파일 구조](#3-파일-구조)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [Reference](#6-reference)

---
## 1. 팀원 소개
|Goat|Andrew|
|:---:|:---:|
|<img src="https://i.imgur.com/yoWVC56.png" width="140" height="140"/>|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/Andrew.png?raw=true" width="140">|

## 2. 타임라인 (23.03.06. ~ 23.03.10.)
|날짜|진행 내용|
|---|---|
|2023-03-06|step1 구현완료 및 PR요청|
|2023-03-07|step1 리뷰사항 반영, 수정|
|2023-03-08|Step1 merge|
|2023-03-09|Step 2 PR요청 및 수정|
|2023-03-10|ReadMe작성 및 회고| 

## 3. 파일 구조

<details>
    <summary><big>폴더 구조</big></summary>

``` swift
BankManagerUIApp
    │
    ├── main
    ├── BankManager
    ├── BankQueue
    ├── AppDelegate
    ├── SceneDelegate
    ├── ViewController
    ├── Main
    ├── Assets
    ├── launchScreen
    └── BankManagerUIAppTests
       ├── BankManagerUIAppTests
       └── Info  
    
BankManagerConsoleApp
    │
    ├── main
    ├── BankManager
    └── BankQueue
    
```

<br>    
    
</details>
<br/>

## 4. 실행화면

<img src="https://i.imgur.com/YxWzZl0.gif)" width=80% height=80%/>

* step2의 실행화면입니다
* 0.7초 간격의 [n번 고객업무시작], [n번 고객업무완료] 구조를 DispatchQueue -sync형태로 출력하고있는 모습입니다


## 5. 트러블 슈팅

### 메서드 재활용
- nil 할당을 방지하기 위해서 guard문을 사용해서 조건을 주었습니다.
- guard문의 조건과 유사한 메서드인 isEmpty()를 활용해서 Method를 재활용해 주었습니다
```swift
guard head != nil else {
      head = Node(data: data)
      return
}

guard isEmpty() == false else {
      head = Node(data: data)
      return
}
```

### 값타입 사용시 Escaping closure captures mutating 'self' parameter 에러
-> **struct -> class 변경으로 해결**

* BankManager는 처음에 struct로 구현했는데, 클로저에서 self키워드 사용시 위와같은에러 **Escaping closure captures mutating 'self' parameter**라는 에러가 나왔습니다
* 찾아보니 DispatchQueue의 클로저 안에 구현된 self가 struct구조(값타입)의 값을 전달받아오거나 변경할 수 없다는 내용으로 이해했습니다.
* 따라서 구조체에서 참조타입으로 class로 변경해 위와같은 에러를 해결했습니다

### BankQueue 파일위치이동 -> UI, Console 두개프로젝트 모두 적용되게끔 이동
<img src="https://i.imgur.com/nSPmIKQ.png" width= 80%>

*  지금은 `BankManagerUIApp` 프로젝트를 사용하지않지만 저희는 처음에 Queue를 UI쪽에 구현했습니다. 그러나 이번스텝은 `BankManagerConsoleApp`콘솔앱에 요구사항이 있었습니다. 콘솔앱에 프로젝트를 진행하는 외에도 추후에 UI앱쪽에도 `BankQueue`와 `BankManager`를 사용할 일이 있을거같아 위처럼 두개의 파일을 공동파일로 위치를 변경해주었는데 적절할까요?
-> `BankQueue`를 UIApp폴더 내에서 ios-bank-manager 파일로 이동


### usleep()과 sleep() 차이점
- sleep과 usleep은 기능은 같지만 usleep 초단위를 좀 더 세밀하게 동작할 수 있다는 차이점이 있습니다. 
- 초 단위를 0.7초 주어야 하는데 sleep은 Int 데이터형식으로만 표현할 수 있어서 usleep을 사용하였습니다.


## 6. Reference
[Swift Language Guide - Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)<br />
[Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/)<br />
[Swift Language Guide - Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)<br />
[Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)<br />
[Swift Language Guide - Subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts/)
[Concurrency Programming Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
