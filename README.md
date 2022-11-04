# 🏦 은행창구 매니저
>프로젝트 기간: 2022-10-31 ~ 2022-11-11 (2주)

## 📑 프로젝트 소개
- Queue와 LinkedList 자료구조의 모델 타입을 구현하고, 은행창구 매니저 애플리케이션을 제작하는 프로젝트 입니다.
- 동시성 프로그래밍(GCD, Operation) 개념을 기반으로 진행되었습니다.

<img height = 21px, src = "https://img.shields.io/badge/swift-5.6-green">

## 🌱 팀 소개
 |[Rhovin](https://github.com/yuvinrho)|[애쉬](https://github.com/ash-youu)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/soKEJcy.png"> | <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/101683977?v=4">|

- `Rhovin`와 `애쉬` 팀의 은행창구 매니저입니다.



###
## 📝 목차
#### 1. [UML](#-uml)
#### 2. [Tree](#-tree)
#### 3. [타임라인](#-타임라인)
#### 4. [기능 설명(실행 화면)](#-기능-설명실행-화면)
#### 5. [트러블 슈팅](#-트러블-슈팅)
#### 6. [고민한 점](https://github.com/ash-youu/ios-bank-manager/tree/step2#%EF%B8%8F-%EA%B3%A0%EB%AF%BC%ED%95%9C-%EC%A0%90)
#### 7. [참고 링크](#-참고-링크)

---

## 🔖 UML
<img width = 1000px, src = "https://i.imgur.com/kiGQmMS.png">

---

## 📂 Tree

```
├── BankManagerConsoleApp
│   ├── Bank.swift
│   ├── BankManager.swift
│   ├── BankWorker.swift
│   ├── Client.swift
│   ├── NameSpace.swift
│   └── main.swift
├── BankManagerConsoleAppTest
│   ├── LinkedListTest.swift
│   └── QueueTest.swift
└── DataStruct
    ├── LinkedList.swift
    ├── Node.swift
    └── Queue.swift
   
```

---

## ⏱ 타임라인
- **2022.10.31**
  - STEP1 진행을 위한 Queue, LinkedList 개념 학습

- **2022.11.01**
  - Queue, LinkedList, Node 타입 정의
  - STEP1 PR 발송


- **2022.11.02**
  - 자료구조 타입에 적절한 인터페이스로 리팩토링
  - 구현한 자료구조의 unit test 진행

- **2022.11.03**
  - STEP2 구현을 위한 Bank, BankWorker, Client 타입 정의

- **2022.11.04**
  - Bank, BankManager, BankWorker, Client 구현부 작성
  - Unit test 메서드 네이밍 수정
  - STEP2 PR 발송
  - STEP1 README.md</b> 작성
---

## 💻 기능 설명(실행 화면)
### [STEP 1]
- Queue, Linked-list, Node 타입을 구현하였습니다.
- Queue 타입 인스턴스 메서드의 동작을 검증하기 위해 Unit Test를 진행하였습니다.

### [STEP 2]
- Linked-list타입과 Queue타입을 활용해 MVC 중 Model 파트를 구현하였습니다.
- Bank: 은행 시스템
  - `generateClient()`: 고객 리스트 업데이트
  - `openSystem()`: 은행 개점 및 종료 메뉴 출력
- BankManager: 대기열에 고객 추가 / BankWorker에게 업무 지시 / 은행 개점 및 폐점 담당
- BankWorker: BankManager로부터 배정받은 고객의 업무 처리
  - STEP3에서 여러명의 은행원이 존재하는 점을 고려하여 BankWorkable 프로토콜의 기본구현을 통해 추후 인스턴스를 유연하게 생성할 수 있도록 하였습니다.
  - 업무시간 0.7초 슬립을 `usleep(7 * 100000)`의 형태로 주었습니다. 이 부분은 STEP3 에서 업무종류(대출, 예금)에 따라 유연하게 바뀔 수 있도록 수정할 예정입니다.
- Client: 대기번호를 기준으로 구분되는 고객 타입
- NameSpace: magic number에 네임스페이스를 활용
  - 은행이 가지는 최소-최대 고객 명수
  - 은행 시스템 메뉴 내의 옵션 번호
- 실행화면

![](https://i.imgur.com/gSttUXU.gif)


---

## 🚀 트러블 슈팅

- 리뷰 확인 후 업데이트 예정!

---

## 🤷‍♀️ 고민한 점

### 1. 고객 인스턴스를 생성하는 방법에 대한 고민
- 처음에는 현실의 은행 프로세스와 유사하도록 아래와 같이 진행할 예정이었습니다.
  - 1. 고객이 은행에 방문해 번호표를 뽑는다.
  - 2. 은행은 누적 고객수를 확인해 +1한 숫자를 고객에게 대기 번호로 반환해준다.
```swift
struct Client {
    var ticketNumber: Int?
    
    func getTicketNumber(at bank: Bank) {
        bank.returnTicketNumber()
    }
}

struct Bank {
    var cumulativeClientCount: Int = 0
    
    mutating func returnTicketNumber() {
        cumulativeClientCount += 1
        return cumulativeClientCount
    }
    
    ...
}
```
- 하지만, 위와 같은 로직으로 진행되면 mutating 메서드를 호출하게 되기 때문에 상수인 bank 매개변수를 수정할 수 없다는 오류가 발생했었습니다.
- 이 때문에 현재는 `Bank`라는 은행 시스템 타입에서 랜덤한 수의 고객 리스트를 업데이트하는 `generateClient()`가 해당 역할을 대신하게 되었습니다.
- 프로젝트의 요구사항은 충족했지만, 객체 지향적인 관점으로는 고객이 본인의 대기표를 은행으로부터 반환받는 것이 더 적절하다고 생각되는데, 문제를 해결할 적절한 방법을 찾기 어려웠던 것 같습니다.
  - struct를 사용한다면 매개변수를 inout으로 줄지, 아니면 struct를 class로 변경할지 고민했습니다.


---

## 📎 참고 링크
- [UML: 클래스 다이어그램과 소스코드 매핑](https://www.nextree.co.kr/p6753/)
- [Linked List](https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)
- [Queue](https://ko.wikipedia.org/wiki/%ED%81%90_(%EC%9E%90%EB%A3%8C_%EA%B5%AC%EC%A1%B0))
- [The Swift Programming Language: Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
