# 은행창구 프로젝트 

## 소개
- 고객의 은행 업무를 처리하고 알려주는 애플리케이션이다.
- 이 애플리케이션에서는 큐와 동시성 프로그래밍에 대해  자세히 알아볼 수 있다.

## 팀원

|예톤|웡빙|
|:--:|:--:|
|<img src = "https://user-images.githubusercontent.com/99063327/174224341-9ba4e42e-3ff2-4c58-b910-1d0b8d4d87f1.png" width = "50%" height = "50%"> | <img src = "https://user-images.githubusercontent.com/98514397/176106991-e29be177-758d-400a-9f47-9022eaa260fa.png" width = "50%" height = "50%"> |
|[github-yeeton37](https://github.com/yeeton37)|[github-wongbingg](https://github.com/wongbingg)|


## PR 내용
- [STEP 1](https://github.com/yagom-academy/ios-bank-manager/pull/187)
- [STEP 2](https://github.com/yagom-academy/ios-bank-manager/pull/198)
- [STEP 3](https://github.com/yagom-academy/ios-bank-manager/pull/208)

## 상세 내용
- [STEP 1](https://github.com/wongbingg/ios-bank-manager/blob/feature/step3/Docs/step1.md)
- [STEP 2](https://github.com/wongbingg/ios-bank-manager/blob/feature/step3/Docs/step2.md)
- [STEP 3](https://github.com/wongbingg/ios-bank-manager/blob/feature/step3/Docs/step3.md)

## UML

<img width="762" alt="스크린샷 2022-07-01 오후 3 36 55" src="https://user-images.githubusercontent.com/98514397/176838333-5b21092e-575a-4f45-b695-af374616a94a.png">

### Timeline

<details>
<summary>1주차</summary>
<div markdown="1">

- 월
`그라운드 룰 작성`, `연결리스트 구현`, `연결리스트에 대한 이해`, `CommandLineTool에서 UnitTest작성`
- 화 
 `Unit테스트코드 추가`  `step1 PR제출 ` `README 업데이트`
- 수
 `step2 이해를 위한 UML작성`, `step2 UML기반으로 코드 작성`
- 목
 `코멘트 토대로 step1 리팩토링`, `queue`에 `initializer` 메서드 추가
- 금
 `UML 수정`, `step2 PR 제출`

</div>
</details>

<details>
<summary>2주차</summary>
<div markdown="1">

- 월
`Business 타입 구현`, `업무별 큐 생성` 
- 화 
 `NameSpace, Error 추가`  `README 업데이트`
- 수
 `step3 PR제출`
- 목
 `step4 각자 구현해보기`, `동시성 프로그래밍 공부`
- 금
 `README 업데이트`, `LLDB를 통해 스레드 확인`

</div>
</details>

### **참고한 문서**
- [Command Line Tool에서 Unit Test하기](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Final](https://velog.io/@ryan-son/Swift-final-키워드-왜-사용하는걸까)
- [LinkedList](https://atelier-chez-moi.tistory.com/90)
- [AssociatedType](https://hyunsikwon.github.io/swift/Swift-AssociatedType)
- [Protocol Oriented Programming](https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift)
- [Thread.sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [구조체 내부에 참조가 있을 경우](https://developer.apple.com/videos/play/wwdc2016/416/?time=893)
- [클로저의 캡쳐리스트](https://babbab2.tistory.com/83)
## 규칙
<details>
<summary> 시간 </summary>
<div markdown="1">
  
    

[프로젝트에 집중하는 시간]
- 10: 00 - 22: 00

[연락이 어려운 시간]
- 없음

[휴일]
- 예톤 : 주말
- 웡빙 : 주말

</div>
</details>

## 그 외 
<details>
<summary> 커밋 </summary>
<div markdown="1">
    
- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- feat = 주로 사용자에게 새로운 기능이 추가되는 경우
- fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- docs = 문서에 변경 사항이 있는 경우
- style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
    
</div>
</details>

<details>
<summary> 컨벤션 </summary>
<div markdown="1">
    
- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines
    
</div>
</details>

<details>
<summary> 커뮤니케이션 </summary>
<div markdown="1">
    
- 디스코드 회의실
- 디스코드 다이렉트 메시지
    
</div>
</details>



# Step 1


### 1. 작업 내용

- 단방향 연결리스트 구현 
    - 프로퍼티 `head`를 만들어서 리스트의 첫번째 노드를 가리키도록 해주었습니다.
    - `isEmpty`, `peek`은 리스트를 확인하는 용도로만 사용되어 연산 프로퍼티로 선언해주었고, `append`, `removeFirst`, `clear`는 실제 동작을 하기 때문에 메서드로 선언해주었습니다.
- 큐 구현
    - 단방향 연결리스트로 큐를 구현해주었습니다. 

### 2. 테스트 방법

- CommandLineTool 에서 Unit테스트를 추가해주는 방법은 달랐습니다! 

1. unitTest를 추가해준 뒤에 unit test를 할 각 파일에 Target Menbership 창에서 해당 Test에 체크를 해준다.

<img src="https://i.imgur.com/aaKWsyY.png" width="250" height="140"/>

2. Test Scheme 을 추가해준다 

<img src="https://i.imgur.com/XJrNhAS.png" width="300" height="350"/>

3. 유닛 테스트 프로덕트를 추가해준다.


<img src="https://i.imgur.com/4Qy6EyN.png" width="600" height="350"/>


### 3. 스텝 핵심 경험

- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용


# Step 2

### 1. 작업내용
- **[타입 구현]**
    - **Bank** : 은행의 전반적인 기능을 작성 해주었습니다 
    - **BankManager** : 은행원의 수행역할을 작성 해주었습니다
    - **Customer**: 고객의 번호를 저장할 수 있는 타입을 작성 하였습니다
- **[랜덤한 고객의 수]**
    - 10~30사이 숫자의 고객이 방문한다고 가정했습니다
    - `Int.random(in range: ClosedRange<Int>)`를 이용하여 무작위 수를 생성 해주었습니다. 
- **[하나의 작업 당 0.7초씩 부여]**
    - BankManager가 고객을 응대하는 시간을 명당 0.7초로 정의 해주었습니다.
    - 작업의 시작과 끝 사이에 시간을 멈춰주었습니다.
    - `Thread.sleep(forTimeInterval: TimeInterval)`을 이용했습니다.
- **[전체 작업을 실행하는 메서드 구현]**
    - Bank의 각 작업을 시작하는 `start()` 메인 메서드를 구현했습니다
    
### 2. 스텝 핵심 경험
- [x] Protocol Oriented Programming으로 `CustomerQueue`를 구현
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 유닛 테스트의 번들 Target과 Scheme 


# Step 3

### 1. 작업 내용
- CustomerQueue에 쌓여있는 손님들을 한명씩 빼서 각 손님마다 원하는 업무에 맞게 해당 업무 줄로 보내주었습니다.
- 각각의 업무 줄은 CustomDispatchQueue로 만들어 주었습니다.
- 대출담당 큐에서는 접근가능 스레드 수의 제한을 1로 설정 해주었습니다.
- 예금담당 큐에서는 접근가능 스레드 수의 제한을 2로 설정 해주었습니다.
---
- Business Enum 타입 선언
    - loan
        - name
        - processTime
    - deposit
        - name
        - processTime
- Business 별 CustomDispatchQueue 상수 생성 
    - loanBusinessQueue
    - depositBusinessQueue 

- Business 별 DispatchWorkItem 생성
    - `makeWorkItem()` 메서드 이용
    - loanWorkItem
    - depositWorkItem
- 작업시간 측정 
    - CFAbsoluteTimeGetCurrent() 를 이용하여 handleCustomer 메서드의 시작과 끝에 선언해주어 메서드 실행 시간을 측정 해주었습니다.

### 2. 스텝 핵심 경험

- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x] 스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

