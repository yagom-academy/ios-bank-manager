# 🏦은행창구 매니저 - Jusbug🕷️, MINT😈
> 프로젝트 기간 23/07/10 ~ 23/07/21

## 📖 목차
🍀 1. [소개](#-소개) <br>
👨‍💻 2. [팀원](#-팀원) <br>
🕰️ 3. [타임 라인](#-타임-라인) <br>
👀 4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조) <br>
💻 5. [실행 화면](#-실행-화면) <br>
🧨 6. [트러블 슈팅](#-트러블-슈팅) <br>
📚 7. [참고 링크](#-참고-링크) <br>
👥 8. [팀 회고](#-팀-회고) <br>

</br>

## 🍀 소개

</br>

## 👨‍💻 팀원
| 🕷️Jusbug🕷️ | 😈MINT😈 |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/Byk8Z_At2.png" width="200" height="200"> | <Img src = "https://hackmd.io/_uploads/HJx9-XCYn.jpg"  width="200" height="200"> |
|[Github Profile](https://github.com/JusBug) |[Github Profile](https://github.com/mint3382) |

</br>

## ⏱️ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.| - Linked List Queue 구현 <br> - Unit Test 구현 |
|2023.07.11.| - concurrency 공부 |
|2023.07.12.| - Linked List와 Queue 분리 |
|2023.07.13.| - Bank, ProgramManager, Customer, Teller 구현 |
|2023.07.14.| - concurrency 공부 |


</br>

## 👀 시각화된 프로젝트 구조
### ℹ️ File Tree
````
[BankManager]
 ├── BankManagerConsoleApp
 │   ├── Queue
 │   │   ├── Queue
 │   │   ├── Queueable
 │   │   ├── LinkedList
 │   │   └── Node
 │   ├── BankManager
 │   ├── main
 │   ├── ProgramManager
 │   ├── Manageable
 │   ├── Bank
 │   ├── Teller
 │   └── Customer
 |   
 └── BankManagerUIApp
     ├── Resource
     │   ├── Info
     │   └── Assets
     ├── Model
     │   ├── BankManager
     │   ├── Node
     │   ├── LinkedList
     │   ├── Queue
     │   └── Queueable
     ├── View
     │   ├── Main
     │   └── LaunchSreen
     └── Controller
         ├── AppDelegate
         ├── SceneDelegate
         └── ViewController
     
````

### 📐 Diagram
<p align="center">
<img width="800" src= "https://hackmd.io/_uploads/ry-cddRK3.png" >

</br>

## 💻 실행 화면
| 1. 개점 | 2. 종료 |
|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/ByvCQXAYn.png" width="300">|<img src="https://hackmd.io/_uploads/rkaqQm0Y2.png" width="300">|<img src="" width="250">|


</br>

## 🧨 트러블 슈팅
###### 핵심 트러블 슈팅위주로 작성하였습니다.
1️⃣ **부동소수점 오류, 소수점 표현** <br>
-
🔒 **문제점🧐** <br>
totalTime을 Double로 주고 더하다 보니 부동소수점 오류로 인해 0.7에 30번 더했을 때 20.9999999가 출력되는 문제가 있었습니다. 또한 예제를 보니 7.00과 같이 소수점 두번째 자리까지 표현되어 있었습니다.

🔑 **해결방법😀** <br>
String Format을 사용하여 해결했습니다. NumberFormatter와 String Format 둘 중 고민하였는데 출력하는 부분에서만 사용하기에 String Format을 사용하였습니다. 

```swift
private func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
       }
```
<br>

2️⃣ **Thread.sleep(forTimeInterval: )** <br>
-
🔒 **문제점🧐** <br>
직원이 고객 1명의 업무를 처리하는데 소요되는 시간은 0.7초인데 실제로 콘솔로 실행했을 때에도 해당 시간만큼 시간이 소요되며 진행 결과를 출력해야 하는지 아니면 업무가 마감되었을 때에만 총 업무시간을 확인하면 되는지 고민하게 되었습니다.

🔑 **해결방법😀** <br>
실제로도 시간이 소요되는 것처럼 보여져야 된다고 생각하여 Thread.sleep를 이용하여 지정된 시간만큼 스레드 동작에 제한을 두어서 해결하였습니다.

```Swift
func processCustomer(_ customer: Customer) {
    print("\(customer.numberTicket)번 고객 업무 시작")
    Thread.sleep(forTimeInterval: 0.7)
    print("\(customer.numberTicket)번 고객 업무 완료")
}
```

<br>

<br>

## 📚 참고 링크
- [🍎Apple Docs: setTarget(queue:)](https://developer.apple.com/documentation/dispatch/dispatchobject/1452989-settarget)
- [🍎Apple Docs: DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
- [🍎Apple Docs: Thread](https://developer.apple.com/documentation/foundation/thread)
- [🍎Apple Docs: String format](https://developer.apple.com/documentation/swift/string/init(format:_:))
- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [야곰닷넷: 동시성 프로그래밍](https://yagom.net/courses/%EB%8F%99%EC%8B%9C%EC%84%B1-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-concurrency-programming)

</br>

## 👥 팀 회고
- [팀 회고 링크](https://github.com/iOS-Yetti/ios-exposition-universelle/wiki)
