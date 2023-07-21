# 🏦 은행창구 매니저 🏦 -  Yetti☃️, Redmango🥭

## 📖 목차
1. [프로젝트 소개](#-프로젝트-소개) <br>
2. [팀원](#-팀원) <br>
3. [타임 라인](#-타임-라인) <br>
4. [시각화 구조](#-시각화-구조) <br>
5. [실행 화면](#-실행-화면) <br>
6. [트러블 슈팅](#-트러블-슈팅) <br>
7. [팀 회고](#-팀-회고) <br>
8. [참고 링크](#-참고-링크) <br>

</br>

## 🏦 프로젝트 소개
은행에 고객이 왔을 때 고객들의 업무에 따라 은행원들이 각자의 업무를 처리해주는 앱
> 프로젝트 기간 23/07/10 ~ 23/07/21

</br>

## 👨‍💻 팀원
| ☃️Yetti☃️ | 🥭Redmango🥭 |
| :--------: | :--------: |
| <Img src =  "https://hackmd.io/_uploads/rJj1EtKt2.png" width="200" height="200"> | <Img src = "https://hackmd.io/_uploads/HJ2D-DoNn.png"  width="200" height="200"> |
|[Yetti's Github](https://github.com/iOS-Yetti) |[Redmango's Github](https://github.com/redmango1447) |

</br>

## ⏱️ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.| - Linked List 기본 기능 구현 |
|2023.07.11.| - 유닛테스트 코드추가 |
|2023.07.12.| - Pull Request 작성 |
|2023.07.13.| - Bank, Banker, Customer 타입 구현 |
|2023.07.14.| - 타입 별로 기능 분리 |
|2023.07.17.| - 네이밍 리팩토링, 네임스페이스 구현 |
|2023.07.19.| - BankTask타입 생성, 업무 부여 기능 추가
|2023.07.20.| - DispatchQueue를 통한 비동기 구현 |

</br>

## 👀 시각화 구조
### 🌲 File Tree
```
BankManagerConsoleApp
├── main
├── Bank
|    ├── BankManager
|    ├── Bank
|    ├── Banker
|    ├── BankTask
|    ├── Customer
├── CustomerQueue
|    ├── CustomerQueue
|    ├── LinkedList
└─────── Node

BankManagerUIApp
├── BankManagerUIApp
|    ├── App
|    |    ├── AppDelegate
|    |    └── SceneDelegate
|    ├── Model
|    |    ├── BankManager
|    |    ├── CustomerQueue
|    |    ├── LinkedList
|    |    └── Node
|    ├── View
|    |    ├── Main.storyboard
|    |    └── LaunchScreen.storyboard
|    ├── Controller
|    |    └── ViewController
|    └── Resoruce
|         └── Asset.xcassets
├── BankManagerUIAppTests
|    ├── CustomelQueueTests
|    └── BankManagerUIAppTests
└── BankManagerUIAppUITests
     └── BankManagerUIAppUITests
```
### 📐 Diagram
![](https://hackmd.io/_uploads/SkK9zVD53.png)
</br>

## 📺 실행 화면
<img src="https://hackmd.io/_uploads/ryqXHcD53.gif" width="500">


## 🧨 트러블 슈팅
###### 핵심 트러블 슈팅위주로 작성하였습니다.
1️⃣ **파일 복사시 참조** <br>
-
🔒 **문제점** <br>
- 기존 step1의 Queue와 관련 타입을 모두 UIApp에 구현하였습니다만 step2는 ConsolApp에서 Queue를 이용해 구현을 시도해보라고 하였습니다. 이 경우 ConsolApp에서 Queue및 관련 타입을 찾지 못하는 문제가 발생했습니다.

🔑 **해결방법** <br>
- 생각해낸 해결 방법은 2가지로
1. ConsolApp에서  UIApp과 똑같은 이름의 파일을 만들고 코드를 복사,붙여넣기 한다.
2. UIApp에서 ConsolApp으로 Xcode를 이용해 복사하되 Create Folder Referances를 선택하고 Copy items if needed를 체크해제한다. 즉 원본 파일을 참조하는 파일을 ConsolApp내부에 만들되 실제 폴더에서 파일이 생성되진 않게 한다.

저희는 둘 중 2번째 방법으로 진행하였습니다. 추후에 어떻게 될진 모르지만 복사한 대상인 Queue와 LinkedList, Node 타입은 자료구조의 일종으로 두 개의 App에서 별개의 작동원리를 가지고 있지 않을 것으로 예상되고 또한 추후 변형될 여지도 적다고 생각했기 때문입니다.

<br>

2️⃣ **업무마다 큐 관리하기** <br>
-
🔒 **문제점** <br>
처음 큐를 구현했을 때 각 고객마다 업무타입에 대해서 지정을 해준 후 하나의 큐에 담아서 관리를 해주었습니다. 하지만 이렇게 큐를 구현하게되면 문제가 생겼습니다.
예를 들어, 예금 고객의 업무가 모두 종료되었지만 다음 대기하는 고객이 대출 고객일경우 그 고객이 빠지지 않으면 다음 예금 고객을 받을 수 없어 딜레이가 생기는 문제가 발생하였습니다.

🔑 **해결방법** <br>
고객의 업무 타입마다 다른 큐에 넣어줌으로써 업무 진행에 효율성을 증가시켜주었습니다.
```swift!
private var depositQueue: CustomerQueue<Customer> = CustomerQueue()
private var loanQueue: CustomerQueue<Customer> = CustomerQueue()

private func lineUp(_ customers: inout [Customer]) {
        for number in 0..<customers.count {
            customers[number].receiveQueueNumber(queueNumber: number + 1)
            
            switch customers[number].task {
            case .deposit:
                depositQueue.enqueue(customers[number])
            case .loan:
                loanQueue.enqueue(customers[number])
            }
        }
    }
```

<br>

3️⃣ **은행원이 늘어날 때의 확장성 고려** <br>
-
🔒 **문제점** <br>
DispatchGroup에 넣어 사용할 DispatchWorkItem을 만들어 주고 그 내부에 각각의 업무에 해당하는 로직을 작성하여 주었습니다.하지만 이렇게 생성하게 되면 은행원이 늘어날 때마다 새로운 DispatchWorkItem을 만들어줘야하고 또 해당 DispatchWorkItem을 group에 넣어줘야하는 번거로움이 있었습니다.
```swift!
let firstDepositWindow = DispatchWorkItem { [self] in
            while let depositCustomer = depositQueue.dequeue() {
                bankers[0].work(for: depositCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[0])
            }
        }
        
        let secondDepositWindow = DispatchWorkItem { [self] in
            while let depositCustomer = depositQueue.dequeue() {
                bankers[1].work(for: depositCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[1])
            }
        }
        
        let firstLoanWindow = DispatchWorkItem { [self] in
            while let loanCustomer = loanQueue.dequeue() {
                bankers[2].work(for: loanCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[2])
            }
        }
        
DispatchQueue.global().async(group: group, execute: firstDepositWindow)
DispatchQueue.global().async(group: group, execute: secondDepositWindow)
DispatchQueue.global().async(group: group, execute: firstLoanWindow)
```

🔑 **해결방법** <br>
은행원의 수를 세는 반복문을 통해 내부에서 은행뭔마다 각각의 큐를 구분해 비동기처리를 해주는 방식으로 수정해주었습니다. 하나의 업무마다 하나의 DispatchWorkItem을 생성할 필요가 없어지고 코드 역시 더 간결해졌습니다.
```swift!
for i in 0..<bankers.count {
            var queue: CustomerQueue<Customer>
            
            switch bankers[i].task {
            case .deposit:
                queue = depositQueue
            case .loan:
                queue = loanQueue
            }
            
            DispatchQueue.global().async(group: group) { [self] in
                while let customer = queue.dequeue() {
                    bankers[i].work(for: customer)
                    countFinishedCustomer()
                    checkWorkTime(from: bankers[i])
                }
            }
        }
```

## 👥 팀 회고
### to. Redmango
- 프로젝트에서 속도를 추구하지않고 이해와 정확성을 요하는 모습을 통해 학습에 어떻게 임해야하는지 많이 배우는 기간이었습니다!
- 이번 주에 제가 개인적인 일로 자리를 비우는 일이 많았는데 그럼에도 학습에 의의를 두고 계속 공부하고 고민하시는 모습이 너무 좋았습니다!
### to. Yetti
- 제가 생각하지 못한 관점으로 의견을 제시하시는게 새로웠습니다!
- 바쁘신 와중에도 어떻게든 시간을 내시는 모습이 감동이였습니다!


## 📚 참고 링크
- [inout 파라미터의 활용](https://hyunsikwon.github.io/swift/Swift-Inout-01/)
- [sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [DispatchGroup 공식문서](https://developer.apple.com/documentation/dispatch/dispatchgroup)
- [차근차근 시작하는 GCD — 7](https://sujinnaljin.medium.com/ios-%EC%B0%A8%EA%B7%BC%EC%B0%A8%EA%B7%BC-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-gcd-7-4d9dbe901835)
- [야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
