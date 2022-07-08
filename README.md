# 🏦 은행창구매니저 README.md
>프로젝트 기간 2022.06.27 ~ 2022.07.08
>
>팀원 : [unchain123](https://github.com/unchain123), [BaekGom](https://github.com/Baek-Gom-95)/ 리뷰어 : [제이크](https://github.com/jryoun1)
## 목차

- [프로젝트 소개](#프로젝트-소개)  
- [개발자 소개](#개발자-소개)  
- [Preview](#Preview)  
- [UML](#UML)  
- [키워드](#키워드)  
- [PR메세지](#PR메세지)  
    - [STEP1에서 PR내용](#STEP1PR)
    - [STEP2에서 PR내용](#STEP2PR)
    - [STEP3에서 PR내용](#STEP3PR)

## 프로젝트 소개
- LinkedList를 활용한 큐타입을 구현하고 동기 비동기 처리를 통해 은행업무 구현

## 개발자 소개
|백곰|언체인|
|:---:|:---:|
|<img src=https://i.imgur.com/c17eEk8.jpg width=250 height = 250>|<img src="https://i.imgur.com/gEAc4rf.png" width="250" height="250">|
|[BaekGom](https://github.com/bar-d)|[unchain123](https://github.com/unchain123)|



## Preview
## 앱 동작 화면
|은행업무화면|잘못된입력 후 2번입력해서 앱종료|
|:---:|:---:|
|<img src=https://i.imgur.com/FIlc4qM.gif width = 250 height =450>|<img src=https://i.imgur.com/ZAlwVSk.gif width=250 height=450 >|

## UML
![](https://i.imgur.com/Gt80eRY.jpg)


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
[![iOS](https://img.shields.io/badge/14.0-000000.svg?style=flat&logo=iOS)]()

## PR메세지
### [STEP1PR](https://github.com/yagom-academy/ios-bank-manager/pull/182)
### [STEP2PR](https://github.com/yagom-academy/ios-bank-manager/pull/193)
### [STEP3PR](https://github.com/yagom-academy/ios-bank-manager/pull/205)

## 공부한점
### 결합도 분리
-리뷰어에게 받은 리뷰-
- STEP2 PR이후 코드내의 은행의 결합도가 너무 높아서 이 결합도를 분리해주는게 좋겠다는 리뷰어의 리뷰를 받았습니다.
- ![](https://i.imgur.com/MaamMdg.png)
- 처음에 결합도를 낮추기 위해 택한 방법은 프로토콜을 생성해서 의존성 주입을 해주는 방법이었습니다.
- 하지만 프로토콜을 선택할 때는 객체들이 해야할 일(func)이 공통적으로 있거나, 공통적으로 가지고 있어야하는 변수가 있을 때 사용하는데 프로토콜로 만들어준 은행원은 은행 말고 다른 객체에선 사용할 이유가 없었고 추후 은행원의 수가 여러명이 된다면 이 프로토콜은 사용하지 못하는 것 같다는 리뷰어의 의견을 듣고 다시 수정했습니다.
```swift
struct Bank {
    private var customer: BankItemQueue<Customer>
    private let bankmanager: BankManager
    
init(customer: BankItemQueue<Customer>, bankmanager: BankManager) {
        self.customer = customer
        self.bankmanager = bankmanager
    }
}
```
- 위의 코드 처럼 이니셜라이저를 만들어서 은행에서 은행원의 인스턴스를 받는게 아니라 은행이 만들어질 때 같이 생성해 줌으로써 의존석 주입을 시켜주어 결합도를 낮아지게 해주었습니다.
- 
### 시간지연 메서드 선택
- sleep 은 Int 타입으로만 설정이 가능해 요구 사항을 충족 시키지 못했습니다 그래서 ulseep 으로 변경하였지만 1000000 단위로 처리를해 중간계산으로 처리를 해줘야하는 불편함이 생겨 Thread.sleep이 사용성과 가독성이 높아 채택했습니다 
```swift
Thread.sleep(forTimeInterval: customer.bankingType.bankingProcessingTime)
```
### 레이스컨디션해결
- DispatchSemaphore 로 예금,대출 업무에 접근할수있는 스레드 수 를 제한하여 동일한 배열요소에 다른 쓰레드가 접근 못하게 했습니다.
- 해결한 코드
```swift
 private let depositSemaphore = DispatchSemaphore(value: NumberOfBankManager.deposit.rawValue)
    private let loanSemaphore = DispatchSemaphore(value: NumberOfBankManager.loan.rawValue)

private func giveTask(for customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        while let completeCustomer = customerList.deQueue() {
            DispatchQueue.global().async(group: bankingGroup) {
                switch completeCustomer.bankingType {
                case .deposit:
                    self.depositSemaphore.wait()
                    self.bankmanager.handleBanking(for: completeCustomer)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    self.bankmanager.handleBanking(for: completeCustomer)
                    self.loanSemaphore.signal()
                }
            }
        }
    }
```
## 트러블슈팅

- 처음 UnitTest작성시 testable을 사용해서 진행하려고 할때 아래와 같은 문제가 발생해서 scheme을 추가하고 타겟을 설정해서 해결을 했습니다.

|문제화면|해결방법|해결방법2|
|:---:|:---:|:---:|
|<img src="https://i.imgur.com/EPGfR5v.png" width="250" height="250">|<img src="https://i.imgur.com/G8JnAWA.png" width="250" height="250">|<img src="https://i.imgur.com/d3LSvvP.png" width="250" height="250">|

- 그 후에 UItest 진행시 아래와 같은 에러가 unchain의 맥(M1)에서만 발생하고 baekgom의 맥(Intel)에서는 발생하지 않았습니다.
```
Could not find module 'BankManagerConsoleApp' for target 'x86_64-apple-
macos'; found: arm64-apple-macos, 
at:/Users/kay/Library/Developer/Xcode/DerivedData/BankManagerConsoleApp-
acslyqhrplbojmgnotygnhtucvdv/Index/Build/Products/Debug/BankManagerConsoleApp
.swiftmodule
```
- 리뷰어 답변
> 관련된 오류는 찾아봤더니 일단 휴먼에러는 아닌 것 같습니다.
M1과 Intel맥의 차이라기보다는 M1에서 사용할 때 문제가 있는 경우인 것 같습니다.
관련된 질문들과 답변이 forum에 있으니 한 번 참고해보시면 좋을 것 같습니다. 🙏🏻
Apple forum

## 참고링크

[동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)

[배열 요소 랜덤 추출](https://ppomelo.tistory.com/11)

[Thread-sleep](https://www.advancedswift.com/delay-function-sleep-thread-swift/)
