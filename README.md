
# 🏦 은행 창구 매니저 _ 웰시코딩🐶


## 📖 목차
🍀 [소개](#소개) </br>
👨‍💻 [팀원](#팀원) </br>
⏱️ [타임라인](#타임라인) </br>
👀 [시각화된 프로젝트 구조](#시각화된_프로젝트_구조) </br>
💻 [실행 화면](#실행_화면) </br>
🧨 [트러블 슈팅](#트러블_슈팅) </br>
📚 [참고 링크](#참고_링크) </br>
👥 [팀 회고](#팀_회고) </br>

</br>

## 🍀 소개<a id="소개"></a>
한 명의 직원을 가진 은행이 10 ~ 30명의 고객을 받아 응대하는 프로그램입니다.

</br>

## 👨‍💻 팀원<a id="팀원"></a>
| 🐬Whales🐬 | 🍎Zion🍎 |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/rkhLfDCYh.png" width="180"> | <Img src = "https://hackmd.io/_uploads/ry9ZHwRt2.png" width="200"> |
|[Github Profile](https://github.com/WhalesJin) |[Github Profile]() |

</br>

## ⏱️ 타임라인<a id="타임라인"></a>
|날짜|내용|
|:--:|--|
|2023.07.10| - Node 클래스 생성 <br> - LinkedList 구조체 생성 <br> - LinkedList Test 진행 |
|2023.07.11| - Queue 구조체 생성 |
|2023.07.12| - Client 구조체 생성 <br> - BankManager 구조체 생성 <br> - Bank 클래스 생성 |
|2023.07.13| - 업무완료 메세지 로직 추가 <br> - 파일 구조정리 |
|2023.07.14| - usleep 메서드를 Thread.sleep 메서드로 수정  |

</br>

## 👀 시각화된 프로젝트 구조<a id="시각화된_프로젝트_구조"></a>

### ℹ️ File Tree
    ┌── 
    │   ├── 
    │   │   ├── 
    │   │   │   ├── 
    │   │   │   └── 
    │   │   ├── 
    │   │   │   ├── 
    │   │   │   └── 
    │   │   ├── Model
    │   │   │   ├── Client
    │   │   │   ├── BankManger
    │   │   │   ├── Bank
    │   │   │   ├── Node
    │   │   │   ├── LinkedList
    │   │   │   └── Queue
    │   │   ├── View
    │   │   │   ├── 
    │   │   │   ├── 
    │   │   │   ├── 
    │   │   │   └── 
    │   │   ├── Controller
    │   │   │   ├── 
    │   │   │   ├── 
    │   │   │   └── 
    │   │   ├── Namespace
    │   │   │   ├── 
    │   │   │   ├── 
    │   │   │   ├── 
    │   │   │   └── 
    │   │   ├── Assets
    │   │   ├── Info
    │   │   └── LaunchScreen
    │   └── Tests
    │       ├── 
    │       ├── 
    │       └── 
    │
    └── README.md


### 📐 Diagram

다음 Step 진행 후 작성 예정



## 💻 실행 화면<a id="실행_화면"></a>
<img src = "https://hackmd.io/_uploads/BJQvBwRFn.gif" width = "450">



## 🧨 트러블 슈팅<a id="트러블_슈팅"></a>
### 1️⃣ 
🚨 **문제점** <br>
Bank Type을 struct로 설정하여 Closure 내부에서 Capture시 Closure내부의 Bank와 클로저 외부의 Bank가 동일하지 않아 경고 문구가 노출 되었습니다.
<br>

💡 **해결방법** <br>
```swift
DispatchQueue.global().async(group: group) {
                self.bankManger.work(client: client)
                semaphore.signal()
            }
```
현재 `Bank Type`의 `startTask` 로직 내부에서는 `Bank Type`의 내부 변수에 접근하는 `async`로직이 존재합니다. 따라서 `Bank Type`을 `struct`로 설정하게 된다면 `async`가 등록될 때의 `Bank`와 `async block` 내에서 `capture` 될 때에의 `Bank`가 서로 다른 `Bank` 일 수 있습니다. 

그 이유는 일반적으로 클로저 내에서 값을 캡쳐했을 때에는 값 타입이든 참조 타입이든 `Strong Reference` 형태로 값을 참조하지만 값 타입의 경우에는 복사된 값에 대한 주소 값을 참조하기 때문에 `async`로 등록할 때의 `Bank`와 실질적으로 `async block`이 실행될 때의 `Bank`가 같은 `Bank`임을 보장할 수 없기 때문입니다. 

따라서 `Bank`를 `Class` 참조 타입으로 설정하여 참조할 수 있도록 변경했습니다. 또한 `Strong Reference` 참조를 하게된다면 순환참조의 가능성에대해 고민해봤지만 위와 같은 경우에서는 `async block`에서는 `Bank`를 참조하고 있지만 `Bank`에서는 해당 `async block`을 직접적으로 참조하고 있지않으므로 순환참조가 발생하지않기 때문에 `[weak self]`의 캡쳐키워드는 생략했습니다.
<br>


### 2️⃣ 
🚨 **문제점** <br>
DispatchQueue와 OpeartionQueue 중 어떤 방식으로 문제를 해결할지 고민했습니다.
<br>

💡 **해결방법** <br>
조금 더 객체지향적인 프로그램의 동작을 위해 `DispatchQueue`를 사용하여 구현했습니다.

`DispatchQueue`을 활용해 해당 요구사항을 구현하는 방법으로는 `DispatchGroup` 및 `DispatchSemaphore`를 활용하는 방법이 있었고 `OperationQueue`를 활용한다면 `maxConcurrentOperationCount` property 및 `waitUntilAllOperationsAreFinished` 메서드의 활용으로 과제를 해결할 수 있었습니다.

하지만 `Bank`, `BankManager`, `Client`가 코드를 읽는 입장에서 조금 더 자연스럽게 객체지향적으로 의사소통할 수 있는 설계에 대해 고민했고 `Operation`을 상속받는 `Type`을 만들어서 `OperationQueue`에 넣어주는 방법보다는 `DispatchQueue async` 로직 내부에서 `BankManager`가 직접적으로 업무를 실행하고 그 업무를 실행하는 데 있어서 `customer`를 주입 받는 방식을 사용했습니다.

물론 같은 결과물을 나타냈겠지만 조금 더 객체지향에 대해서 고민해볼 수 있어서 좋았습니다.
<br>



## 📚 참고 링크<a id="참고_링크"></a>

- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [야곰닷넷: 동시성프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/lessons/동시성-프로그래밍/)
- <Img src = "https://hackmd.io/_uploads/ByTEsGUv3.png" width="20"/> [blog: Strong Reference Cycle](https://medium.com/@LeeZion94/strong-reference-cycle-8a88bdd8424b)
