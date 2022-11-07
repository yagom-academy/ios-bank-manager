# 🏦Ios Bank Manager🏦

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [파일구조](#-파일구조)<!-- 6. [UML](#-UML) -->
6. [실행화면](#-실행-화면)
7. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
8. [참고링크](#-참고-링크)


## 👋 소개
[Aaron](https://github.com/hashswim), [Tottale](https://github.com/tottalE)의 은행 창구 매니저 프로젝트입니다.


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

![]()

## 🧑 팀원
|<img src = "https://i.imgur.com/I8UdM0C.png" width=200 height=170>|<img src = "https://i.imgur.com/ZykY6Vn.png" width=200 height=170> 
|:--:|:--:|
|[Aaron](https://github.com/hashswim)|[Tottale](https://github.com/tottalE)|
 

## 🕖 타임라인
### 2022.10.31
- cocoapods `swiftlint` setting
- `Linked List`, `Node`, `Queue` 클래스 생성 및 기본 구현 정의
- `Linked List`의 `Push`, , `Clear`, `RemoveAll`, `Peek`, `isEmpty` 기능 메서드 구현
- `Queue`의 `Enqueue`, `Dequeue`, `Clear`, `Peek`, `isEmpty` 기능 메서드 구현
- `Queue` 클래스에 대한 유닛 테스트 진행

### 2022.11.3
- 네이밍 수정
- `Bank`, `Customer`, `BankClerk` 클래스 정의
-  고객 대기열 큐 타입 구현
-  콘솔 메시지 출력 구현
-  `usleep`을 통한 루프문 처리 구현


## 💾 파일구조
```
└── BankManagerConsoleApp/
    ├── common
    │    └──CFAbsoluteTime+
    |
    ├── Appdelegate
    ├── SceneDelegate
    ├── Model
    │   ├── BankManager
    │   ├── LinkedList
    │   ├── Queue
    │   ├── Node
    │   ├── Bank
    │   ├── Customer
    │   └── BankClerk
    │
    ├── View/
    │   └── Main
    └── Controller/
```

<!-- ## 📊 UML
 > ![](https://i.imgur.com/55fQ8ms.png)
 -->

## 💻 실행 화면

<!-- |일반 화면|다이나믹 타입 적용화면|
|:----:|:----:|
|<img src="https://i.imgur.com/vE9Xqbh.gif" width="300px">|<img src="https://i.imgur.com/68Y8ozn.gif" width="300px">| -->
> <img src="https://i.imgur.com/HZ4T4NK.gif" width="600px">

## 🎯 트러블 슈팅 및 고민
### `push 메서드 로직`
```swift!
class LinkedList<T> {
    ...
    
    func push() {      
        if self.isEmpty {
            self.head = node
            self.tail = node
            return
        }

        self.tail?.next = node
        self.tail = node
    }
    ...
}

```
- `self.tail = node` 의 중복을 없애기 위해
[다음](https://github.com/yagom-academy/ios-bank-manager/pull/214/commits/eba1e9f052f874584e140a9d039c101a3243da00)과 같이 수정 했으나 코드의 가독성과 직관성이 떨어져 아래와 같이 수정함

```swift!
class LinkedList<T> {
    ...
    
    func push() {      
        if self.isEmpty {
            self.head = node
        } else {
            self.tail?.next = node
        }
        self.tail = node
    ...
}

```


### delay 구현
```swift
struct BankClerk {
        
    func work(for customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        usleep(useconds_t(700000))
        print("\(customer.number)번 고객 업무 완료")
    }
}
```

- `Timer`, `asyncAfter`, `DispatchSourceTimer` 등의 방법을 고려했지만 Step 2의 요구사항에만 맞도록 `usleep`을 사용하여 구현

## 📚 참고 링크

[Swift 지연실행 실험 - NSTimer, asyncAfter, DispatchSourceTimer
](https://es1015.tistory.com/405) <br>
