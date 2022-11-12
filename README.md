# 🏦 은행창구 매니저
>프로젝트 기간: 2022-10-31 ~ 2022-11-11 (2주)

## 📑 프로젝트 소개
- Queue와 LinkedList 자료구조의 모델 타입을 구현하고, 은행창구 매니저 애플리케이션을 제작하는 프로젝트 입니다.
- 동시성 프로그래밍(GCD) 개념을 기반으로 진행되었습니다.

<img height = 21px, src = "https://img.shields.io/badge/swift-5.6-green">

## 🌱 팀 소개
 |[Rhovin](https://github.com/yuvinrho)|[애쉬](https://github.com/ash-youu)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/soKEJcy.png"> | <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/101683977?v=4">|

- `Rhovin`와 `애쉬` 팀의 은행창구 매니저입니다.



###
## 📝 목차
#### 1. [UML](#-1-uml)
#### 2. [Tree](#-2-tree)
#### 3. [타임라인](#-3-타임라인)
#### 4. [기능 설명(실행 화면)](#-4-기능-설명실행-화면)
#### 5. [트러블 슈팅(고민한 점)](#-5-트러블-슈팅고민한-점)
#### 6. [참고 링크](#-6-참고-링크)

---

## 🔖 1. UML
<img width=700px, src="https://i.imgur.com/XcJnXnR.png">

---

## 📂 2. Tree

```
├── BankManagerConsoleApp
│   ├── main.swift
│   ├── Bank.swift
│   ├── BankManager.swift
│   ├── BankWorker.swift
│   ├── Client.swift
│   ├── NameSpace.swift
│   └── BankWork.swift
├── BankManagerConsoleAppTest
│   ├── LinkedListTest.swift
│   └── QueueTest.swift
└── DataStruct
    ├── Queue.swift
    ├── LinkedList.swift
    └── Node.swift
   
```

---

## ⏱ 3. 타임라인
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

- **2022.11.08**
  - BankWork 타입 정의
  - BankWorker가 동시성을 가지고 일하도록 수정
  - STEP3 PR 발송

- **2022.11.09**
  - BankManager 타입 `configureWorkType()` 메서드 반복문 리팩토링
  - BankManager 타입 semaphore 로직 수정
  - 객체지향에 따라 역할에 맞게 main의 메서드 수정

- **2022.11.11**
  - STEP3 README.md</b> 작성
---

## 💻 4. 기능 설명(실행 화면)
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
- Client: 대기번호를 기준으로 구분되는 고객 타입
- NameSpace: magic number에 네임스페이스를 활용
  - 은행이 가지는 최소-최대 고객 명수
  - 은행 시스템 메뉴 내의 옵션 번호
- 실행화면

![](https://i.imgur.com/gSttUXU.gif)

### [STEP 3]
- GCD를 활용해 동시성 프로그래밍을 구현하였습니다.
- 이로 인해 3명의 은행원(예금업무 2명, 대출업무 1명)이 동시에 업무를 처리하도록 수정하였습니다.
- 예금업무는 0.7초, 대출업무는 1.1초가 걸립니다.
- 예금업무 고객 대기열에 접근하는 은행원이 2명이므로 semaphore를 이용해 한 명의 은행원만 대기열에 접근할 수 있도록 쓰레드를 제한하였습니다.

```swift
let depositSemaphore = DispatchSemaphore(value: 1)
```

- 실행화면(최초 실행 후, 종료)

![](https://i.imgur.com/9kfjoi9.gif)

- 실행화면(최초 실행 후, 재실행)

![](https://i.imgur.com/wKwQkV8.gif)


---

## 🚀 5. 트러블 슈팅(고민한 점)

<details>
<summary>1. 타입별 인스턴스 초기화 위치에 대한 문제</summary>
<div markdown="1">

- 기존에는 아래와 같은 순서로 타입의 인스턴스를 초기화 했습니다.
  - 1. main 소스파일에서 모든 타입의 인스턴스 초기화
  - 2. 의존하고 있는 타입의 인스턴스에 해당 인스턴스를 할당

- 하지만 객체지향 프로그래밍의 관점으로 보았을 때, 이는 main 소스파일이 책임 이상의 역할을 하고있어 단일 책임 원칙을 위반하고 있다고 생각했습니다.
(모든 타입의 인스턴스 생성)

- 그래서 각 타입의 인스턴스는 참조하고 있는 타입의 인스턴스 `init()` 내에서 초기화되도록 리팩토링하였습니다.

```swift
// BEFORE
// main 소스파일
let bankWorker: BankWorker = BankWorker()
let bankManager: BankManager = BankManager(bankWorker: bankWorker)
var bank: Bank = Bank(bankManager: bankManager)

bank.openSystem()
    
    
// AFTER
// main 소스파일
var bank: Bank = Bank()

bank.openSystem()

// Bank 타입
struct Bank {
    private var bankManager: BankManager = BankManager()
...
    
}
 
// BankManager 타입
struct BankManager {
    ...
    
    init() {
        var currentDepositWorkerCount: Int = 0
        
        for _ in 0..<(DepositWorkerNumber.max + LoanWorkerNumber.max) {
            if currentDepositWorkerCount < DepositWorkerNumber.max {
                let bankWorker: BankWorker = BankWorker(bankWork: .deposit)
                
                bankWorkers.append(bankWorker)
                currentDepositWorkerCount += 1
            } else {
                let bankWorker: BankWorker = BankWorker(bankWork: .loan)
                
                bankWorkers.append(bankWorker)
            }
        }
    }
...

}
```
    
</div>
</details>
</br>

<details>
<summary>2. 유닛 테스트 메서드 네이밍에 대한 문제</summary>
<div markdown="1">
    
- 테스트 메서드 이름만 보고 어떤 테스트인지 파악할 수 있는 네이밍을 하고 싶었습니다.
- 테스트 메서드 이름이 입력값과 결과값에 디펜던시가 없도록 `should_기대결과_When_테스트상태` 방식으로 네이밍을 하였습니다.
- `test_list에있는노드값을_search로호출했을때_해당노드값을_반환해야한다()`

</div>
</details>
</br>

<details>
<summary>3. 'DispatchSemaphore' 사용에 대한 문제</summary>
<div markdown="1">

- STEP3에서는 2명의 은행원이 동시에 예금 업무를 진행하기 때문에 race condition을 방지할 방법이 필요했습니다.

- GCD를 활용해 동시성 프로그래밍을 구현했기 때문에 공유자원에 접근하는 스레드의 수를 제한해주는 'DispatchSemaphore' 사용해 thread safe하게 작동할 수 있도록 구현하였습니다.
    
```swift
struct BankManager {
    
    private let depositSemaphore = DispatchSemaphore(value: 1)
    
    ...
    
    private func doDepositWork(by worker: BankWorker) {
        DispatchQueue.global().async(group: group) {
            while !depositClientQueue.isEmpty {
                depositSemaphore.wait()
                guard let client = depositClientQueue.dequeue() else {
                    depositSemaphore.signal()
                    print("업무를 처리할 예금 고객이 없습니다.")
                    return
                }
                
                depositSemaphore.signal()
                worker.startWork(for: client)
            }
        }
    }
}   

```

- 위 코드와 같이 BankManager 타입 내 예금 고객 대기열에 접근하는 스레드 수를 제한하는 `depositSemaphore` 프로퍼티를 정의했습니다.

- 은행원이 예금 고객 대기열에서 dequeue하기 전에, `depositSemaphore.wait()` 로 다른 은행원이 예금 고객 대기열에 동시에 접근할 수 없게 하였습니다.

</div>
</details>
</br>

<details>
<summary> 4. 모든 업무가 끝나기 전에 은행업무 종료 메시지를 실행하는 문제 </summary>
<div markdown="1">
    
- 은행 업무가 끝나기 전에 은행업무 종료 메시지 및 메뉴를 출력하는 문제가 발생했습니다.
    
![](https://i.imgur.com/2FLg3Se.png)
    
- 아래 코드와 같이 DispatchGroup()을 정의하여 모든 업무에 DispatchQueue 그룹을 설정 및 `group.wait()` 를 사용하여 해결하였습니다.
    
```swift
private let group: DispatchGroup = DispatchGroup()

private func doDepositWork(by worker: BankWorker) {
    DispatchQueue.global().async(group: group) {
        // 예금업무 수행 코드
    }
}
    
private func doLoanWork(by worker: BankWorker) {
    DispatchQueue.global().async(group: group) {
        // 대출업무 수행 코드
    }
}

struct BankManager {
    ...
    
  private func assignBankWork() {
    for worker in bankWorkers { 
       switch worker.bankWork {
         case .deposit:
            doDepositWork(by: worker)
         case .loan:
            doLoanWork(by: worker)
         default:
           return
        }
    }
        
        group.wait()
    }
}
```


</div>
</details>

### 

---

## 📎 6. 참고 링크
- [UML: 클래스 다이어그램과 소스코드 매핑](https://www.nextree.co.kr/p6753/)
- [Linked List](https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)
- [Queue](https://ko.wikipedia.org/wiki/%ED%81%90_(%EC%9E%90%EB%A3%8C_%EA%B5%AC%EC%A1%B0))
- [The Swift Programming Language: Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
- [유닛테스트 네이밍 짓는 방법](https://dzone.com/articles/7-popular-unit-test-naming)
