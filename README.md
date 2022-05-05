# 은행 창구 매니저 프로젝트 저장소
> 프로젝트 기간 2022-04-25 ~ 2022-05-06 </br>
팀원 : [@파프리](https://github.com/papriOS) [@마이노](https://github.com/Mino777) / 리뷰어 : [@토니](https://github.com/Monsteel)

## 구현 화면

|Console|iOS|
|:---:|:---:|
|<img src="https://i.imgur.com/CGOX2dN.gif"/>|<img src="https://i.imgur.com/6b9oDjs.gif"/>|

## 목차

- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한 점 및 질문](#고민한_점_및_질문)
- [STEP 2](#step-2)
    + [고민한 점 및 질문](#고민한_점_및_질문)
- [STEP 3](#step-3)
    + [고민한 점 및 질문](#고민한_점_및_질문)
- [그라운드 룰](#그라운드-룰)
    + [스크럼](#스크럼)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## 키워드
- 정리하기

---

## [STEP 1]
## 구현내용

Linked-List 로 Queue 자료구조 구현
Cocoapods를 이용해 SwiftLint 적용

### 고민한 점 및 질문
### 1. Linked List
- Node - Class Type로 구현한 이유
 : Node는 데이터와 다음 Node를 프로퍼티로서 가지는데, 
 Struct는 고정된 메모리 공간이 컴파일 타임에 결정되어야 하는 값타입이기 때문에 자기 자신과 같은 값타입을 저장프로퍼티로서 가질 수 없었습니다.
- LinkedList - Class Type으로 구현한 이유
 : Struct는 값타입으로, 원본 값이 immutable하기 때문에 변경으로부터 안전합니다. LinkedList를 값타입으로 구현하지 않은 이유는, 내부에 참조 타입을 가지고 있기 때문에 변경으로부터 안전을 보장하지 않는다고 생각했기 때문입니다.
- Nested Type 이유
 : Node가 LinkedList 외부에서 존재할 이유가 없기 때문입니다.

### 2. gitignore 주요 목록
- /pods
- .xcworkspace
- 최대한 기본 프로젝트 구성, podfile, podfile.lock만 깃허브에 올려두고 최초 클론시에만 pod update를 통해 라이브러리 의존성을 가져오도록 진행했습니다.

### 3. SwiftLint Rule
- disabled_rules:
    - trailing_whitespace // 라인 후행 공백
- excluded:
    - Pods
- SwiftLint의 기본 룰을 가지고 가되, 프로젝트를 진행하며 불필요해 보이는 룰들을 계속해서 disabled 하면서 진행할 예정입니다.

### 4. Unit Test
- Test Case의 네이밍을 `test_~할때_~해야한다`라는 규칙으로 지어보았습니다. 토니는 어떤 형식의 네이밍을 선호하시나요?!
- Command Line Tool에서는 @testable import가 되지 않아 TargetMembership으로 LinkedList, Queue파일을 타켓으로 설정하였습니다.

## 프로젝트 실행 시 주의사항
- 최초 Clone시에 BankManagerConsoleApp Directory에서 pod update를 진행 후 xcworkspace 파일로 리뷰를 부탁드립니다!
- 현재 Command Line Tool 프로젝트 파일이기 때문에 Scheme을 BankManagerConsoleAppTests Scheme으로 변경해야 테스트가 동작합니다.

---

## [STEP 2]
## 구현내용
- Client 타입 구현
- Bank 타입 구현
- BankClerk 타입 구현
- BankManager 타입 구현

## UML
<img src = https://user-images.githubusercontent.com/54234176/165666739-3917117f-89d5-4c73-9949-9ee110f4ae84.png width=700 height=700>

## 실행화면
![은행STEP2실행화면](https://user-images.githubusercontent.com/54234176/165666745-2fd123d3-29ae-4852-8ada-05213a7ceadf.gif)

### 고민한 점 및 질문
### 1. UML 작성
- 범용적으로 사용되는 constants가 존재할 수 있다는 것을 고려하여 네임스페이스로서 활용할 Constants 타입을 생성하였습니다.
- BankClerk.swift와 BankManager.swift에서 발생하는 매직넘버와 매직스트링을 Constant extension을 통해 각각의 파일에서 바로 확인 가능하도록 가독성을 높여주었습니다.
- 이런 경우에 Constants는 UML에서 어떻게 표현해야하는지 궁금합니다. 토니는 어떤식으로 표현하시나요?!

### 2. Delegate Pattern 적용
- BankClerk이 작업을 완료하면, Bank는 마감메시지를 출력해야합니다.
- BankClerk이 작업을 완료하면 Bank의 close()메소드가 실행되도록 하는데, 결합도를 낮추기 위해 delegate pattern을 적용해보았습니다.

### 3. BankClerk의 work 메서드
- GCD를 학습하고, 사용을 해보고자 현재로서는 불필요한 코드들이 들어가면서 코드가 많이 지저분 해진 것 같습니다😭
- 해당 부분에서 workItem의 코드블럭, 메서드의 수행 시간 측정하는 부분들을 메서드로 분리해볼 수 있을 것 같다 라고까지만 생각을 해본 것 같습니다.
- 이 부분은 토니에게 피드백을 받고 수정하는게 좋을 것 같아 우선 남겨두었습니다.

### 4. sleep
- 현재 은행원이 작업시간이 0.7초가 걸리는 요구사항이 있습니다.
- 해당 요구사항을 반영하기 위해 `Thread.sleep(forTimeInterval:)` 메서드를 사용했는데 이보다 더 나은 방향이 있을까요

### 5. Constants
- Constants를 사용할 때 하나의 네임스페이스에 모두 몰아넣고 사용하는 경우 해당 상수를 확인하고 싶을 때 매번 코드점핑이 된다고 생각했습니다.
- 그래서 2개 이상 파일에서 사용하지 않고 하나의 파일에서만 사용되는 상수들의 경우 `fileprivate extension Constants {}` 처럼 해당 파일에 Extension하여 사용했습니다.
- 해당 부분에 대해서 토니는 어떻게 생각하실까요?!

---

## [STEP 3]
## 구현내용
- BankService: 은행 업무와 관련된 Enum
- 업무에 따른 고객 큐 분리
- 업무에 따른 은행원 업무 할당
- 비동기 처리

## UML
![](https://i.imgur.com/omd7L1K.png)

## 실행화면
![](https://i.imgur.com/CGOX2dN.gif)

## 고민한 점 및 질문

### 1. UML
- 이전 스텝에서 조언해주신걸 토대로 Constants를 재구성 해보았습니다. 토니가 말씀해주신 부분이 맞을까요?!

### 2. 확장성
이번 프로젝트에서는
고객(`Client`)의 은행업무(`BankService`)에 따라
해당 업무를 담당하는 은행원(`BankClerk`)이 해당 고객의 업무를 처리 할 수 있어야 했습니다.
이를 위해`Bank` 의 프로퍼티로
`private let depositClientQueue = Queue<Client>()`
`private let loanClientQueue = Queue<Client>()`
를 두었습니다.

추후에 은행업무가 다양해지거나, 은행원이 담당할 수 있는 업무가 하나 이상이 되는 경우 새롭게 Bank에 해당 업무를 보기위한 고객들의 큐를 프로퍼티로 두어야하고, 코드 안에서 수정해야하는 부분이 많음을 느꼈습니다.
좀 더 확장이 유연하게 될 수 있도록 수정하고 싶은데, 이를 위해 공부할만한 키워드를 던져주실 수 있으실까요?!



### 3. Data Race

* Xcode의 기본 기능인 Thread Sanitizer을 통해 Data Race가 발생하는지 확인하였습니다.
![](https://i.imgur.com/RsHWKYQ.png)

위의 이미지와 같은 Threading Issue를 확인 할 수 있었습니다.
- 해당 부분을 해결하기 위해 linkedList의 removeFirst() 메서드에서 Serial Queue와 flags 파라미터의 값을 barrier로 시도를 해보았지만 해결하지 못하였습니다.

### 4. 은행원 수 == Thread의 수
- 은행원 수 만큼만의 Thread를 생성하기 위해 은행원 배열만큼을 for문을 돌려 해당 횟수 만큼만 global().async를 통해 thread를 생성하도록 하였습니다.


*2. BankServiceType의 변화에 대한 대처*
`Bank` 의 프로퍼티로 BankServiceType에 해당하는 Queue를 각각 가지고 있어야했습니다. 이에 대한 대처로 Dictionary 자료구조를 이용해 BankServiceType의 확장에 동적으로 대응이 가능하도록 수정했습니다. 

```swift
//main.swift

private func createQueueDictionary() -> QueueDictionary {
    var queueDictionary: QueueDictionary = [:]
    
    BankServiceType.allCases.forEach { bankService in
        queueDictionary.updateValue(Queue<Client>(), forKey: bankService.description)
    }
    
    return queueDictionary
}
```

---

## [STEP 4]

## 구현내용
- 은행원이 일을 진행함에 따라 대기중인 고객과 업무중인 고객을 View에 표시
- 고객 추가와 초기화 진행 시 View에 해당사항 반영
- 코드만으로 UI 구현
- CompositionRoot 
- Timer
- Operation Queue


## 실행화면
![](https://i.imgur.com/6b9oDjs.gif)

## 고민한 점 및 질문

### 1. Xcode 프로젝트 관리 구조
- 기존에 구현한 ConsoleApp 프로젝트의 파일들이 UIApp을 구현하는데에도 필요했습니다.
- ConsoleApp에서 reference로 LinkedList.swift , Queue.swift 를 가져오고 나머지 파일은 구조의 변경이 있을 거라 예상되어 UIApp 프로젝트에서 직접 생성하였습니다. 
- 이 방법에 대해 토니는 어떻게 생각하시나요?

### 2. Timer 실행 시 딜레이
- Timer의 timeInterval을 0.001초로 진행하는 경우 실제 시간과 거의 2 ~ 3초 차이가 나는 현상이 발생했습니다.
- 우선 해당 값을 0.003초로 진행하여 현재는 0.2~3초 차이가 나도록 임시방편으로 두었습니다.
- 해당 부분은 크게 고민하지 않고 넘어가도 되는 부분일까요? 아니면 저희가 놓친 부분이 있는지 궁금합니다!

### 3. OperationQueue
- 초기화 시에 대기중이던 작업들을 취소해주는 요구사항이 있었습니다.
- 하지만 DispatchQueue의 경우엔 현재 대기중인 작업들을 취소할 수 있는 방법이 없었습니다.
- 따라서 OperationQueue로 변경한 후 cancelAllOperations() 메서드를 사용해 해당 요구사항을 구현할 수 있었습니다.

### 4. ScrollView Scroll시에 Timer가 멈추는 현상
- ScrollView를 Scroll하는 경우 MainRunLoop에서  타이머 레이블을 업데이트하는 부분과 충돌이 일어난다고 생각했습니다.
```swift
RunLoop.current.add(timer ?? Timer(), forMode: .common)
```
- 그래서 Timer의 RunLoop의 우선순위를 common으로 높여서 해당 부분을 해결할 수 있었습니다.

### 5. 코드로 UI 구현 시 발생한 문제 해결

>because they have no common ancestor.  Does the constraint or its anchors reference items in different view hierarchies?  That's illegal.
- 위와 같은 에러문구가 나타난 문제를 addSubView/addArragedSubView 를 한 뒤, constraint를 정해줌으로써 해결했습니다.

### 6. NotificationCenter 활용
```swift
func work(client: Client) {
        NotificationCenter.default.post(name: .didAssignClientToBankClerk, object: client)
        Thread.sleep(forTimeInterval: self.bankService.requiredTime)
        NotificationCenter.default.post(name: .didFinishWork, object: client)
    }
```
- 은행원이 고객 일처리를 시작하는 순간과 일처리를 마무리하는 순간 Client 객체와 함께 노티피케이션을 발송하였습니다.
- MainViewController 에서 Observer를 등록하여 노티피케이션이 오면 view가 업데이트 될 수 있도록 구현했습니다.


### 7. DispatchQueue에서의 스레드 생성 문제
- 10명을 추가하는 기능이 생기면서, 스레드가 고객을 추가할 때 마다 계속해서 3개씩 추가로 생성해내는 문제가 생겼습니다.
- 해당 문제를 해결하기 위해 OperationQueue를 업무타입의 수만큼 만들어 각각 `maxConcurrentOperationCount` 프로퍼티를 은행원 수에 맞게 설정하여 스레드를 은행원 수 만큼만 유지할 수 있도록 해결하였습니다.

---
# 🪧파프리, 마이노팀 그라운드 룰
## ✏️ 스크럼
스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
매일 아침 10시 30분, 디스코드에서 진행
어제의 활동 리뷰
오늘 활동 예정 사항 / 목표
자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
컨디션 공유 😰
공유하고 싶은 이슈, 꿀팁 공유
스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
상황에 따라 조정 가능

### 하루 일정
데일리 스크럼
점심시간: 12:00 ~ 14:00
저녁시간: 18:00 ~ 20:00
유동적

---

## 🪧 프로젝트
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

### 코딩 컨벤션
SwiftLint의 Default Rule로 진행

### Commit 규칙
커밋 제목은 최대 50자 입력
본문은 한 줄 최대 72자 입력

### Commit 제목 규칙
- 기능(feat): 새로운 기능을 추가
- 버그(fix): 버그 수정
- 리팩토링(refactor): 코드 리팩토링
- 형식(style): 코드 형식, 정렬, 주석 등의 변경(동작에 영향을 주는 코드 변경 없음)
- 테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
- 문서(docs): 문서 수정(제품 코드 수정 없음)
- 기타(chore): 빌드 업무 수정, 패키지 매니저 설정 등 위에 해당되지 않는 모든 변경(제품 코드 수정 없음)

### Commit Body 규칙
제목 끝에 마침표(.) 금지
한글로 작성

### 브랜치 이름 규칙
`STEP1`, `STEP2`, `STEP3`


