# 은행창구 매니저 프로젝트

<br>

### 협업 규칙

[팀그라운드룰](https://github.com/SoKoooool/ios-bank-manager/blob/main/Docs/%ED%8C%80%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C%EB%A3%B0.md)

<br>

### 타임라인 ('21.04.26 ~ '21.05.07)
- 04/26(월)
  - 강의) Processor, Process, 운영체제
  - 팀그라운드룰 설정
  - 동시성 프로그래밍의 개념 공부 및 필요한 이유
  - 스위프트에서 동시성 프로그래밍을 하는 방법
  - 스레드 개념
- 04/27(화)
  - 특강) 성장하는 iOS 개발자 되기
  - 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
  - Dispatch와 Operation의 차이를 이해하고 상황에 맞게 선택하여 사용
- 04/28(수)
  - Concurrency Programming 자료 by 앨런 예습
  - Step1 - flowchart, UML 그리다가 코드로 넘어감. 프로젝트 내 폴더 및 파일 분리에 관해 고민.
- 04/29(목)
  - 강의) Concurrency Programming by 앨런 / 프로젝트 관련 질문
  - Operation Queue 적용하여 Step1 코딩 시작
  - 네이밍 고민 (feat. 고마운 Ryan)
- 04/30(금)
  - 1기 졸업식 참석
  - step1 PR, step2에 대한 설계 고민
  - TWL 작성
- 05/03(월)
  - 강의) ARC / Memory Struct
  - step1 PR 코멘트 바탕으로 코드 수정 -  입력 함수에 대한 고민
- 05/04(화)
    - 소스파일 분리 후 Client 타입을 만들어 그에 맞게 코드 수정
    - 고객등급에 따른 우선순위 고민 - 선택정렬, Operation.QueuePriority
- 05/05(수)
  - step1 2차 코멘트 바탕으로 코드 수정 
  - 열거형 - CustomStringConvertible
  - Closure - Escaping vs Non escaping
  - BlockOperation 공부
- 05/06(목)
  - 강의) iOS App Life Cycle
  - Operation / BlockOperation
  - [addOperations:waitUntilFinished: 적용](https://developer.apple.com/documentation/foundation/nsoperationqueue/1408358-addoperations)
<br>

### 학습키워드
- [동기와 비동기, 비동기식 처리 기술](https://github.com/SoKoooool/ios-bank-manager/blob/4aa993fceb671e08808ba4231f34b9f6e9dbe282/Docs/%EB%8F%99%EA%B8%B0%EC%99%80%20%EB%B9%84%EB%8F%99%EA%B8%B0.md)
- [GCD, Dispatch Source, Operation Queue 질문](https://github.com/SoKoooool/ios-bank-manager/blob/main/Docs/GCD%2C%20Dispatch%20Source%2C%20Operation%20Queue%20%EC%A7%88%EB%AC%B8.md)
- sleep(), usleep(), Thread.sleep(Thread.sleep(forTimeInterval: )
- [OperationQueue 메서드](https://github.com/SoKoooool/ios-bank-manager/blob/main/Docs/OperationQueue%20%EB%A9%94%EC%84%9C%EB%93%9C.md)
- ARC / Memory Struct
- 선택정렬 / Operation.QueuePriority
- iOS App Life Cycle
- Operation / BlockOperation

<br>

### step1 Flowchart
![step1_1](https://user-images.githubusercontent.com/65153742/116431054-5cbc6f00-a882-11eb-80e9-b80dbc5c2267.jpg)

<br>

### step1 구현화면
![화면 기록 2021-04-30 오후 6 16 11](https://user-images.githubusercontent.com/65153742/116675060-61973500-a9e0-11eb-8908-7a8b8f5910dd.gif)

<br>

### step2 구현화면
![화면 기록 2021-05-07 오후 12 35 32](https://user-images.githubusercontent.com/65153742/117394301-df9f9280-af30-11eb-84e5-7753d881d063.gif)

<br>

### 참고 링크
#### 동시성 프로그래밍, 동기 vs 비동기, GCD/Operation
- [[인프런] iOS Concurrency(동시성) 프로그래밍, 동기 비동기 처리 그리고 GCD/Operation - 디스패치큐와 오퍼레이션큐의 이해](https://www.inflearn.com/course/iOS-Concurrency-GCD-Operation#)
- [[유투브] 프로세스는 뭐고 스레드는 뭔가요?](https://www.youtube.com/watch?v=iks_Xb9DtTM)
- [[유투브] 비동기 프로그래밍이 뭔가요?](https://www.youtube.com/watch?v=m0icCqHY39U)
- [[유투브] CPU 코어와 스레드(ft.하이퍼스레딩) 가장 쉬운 설명 듣고 가시죠 - [高지식] 거니](https://www.youtube.com/watch?v=_dhLLWJNhwY)
- [[블로그] [기술]동기와 비동기](https://velog.io/@stay136/%EA%B8%B0%EC%88%A0%EB%A9%B4%EC%A0%91%EB%8F%99%EA%B8%B0%EC%99%80-%EB%B9%84%EB%8F%99%EA%B8%B0)
- [[블로그] iOS ) Concurrency Programming Guide - Concurrency and Application Design](https://zeddios.tistory.com/509)
- [[부스트코스] GCD, DispatchQueue](https://www.boostcourse.org/mo326/lecture/16916?isDesc=false)
- [[블로그] GCD vs Operation Queue](https://caution-dev.github.io/ios/2019/03/15/iOS-GCD-vs-Operation-Queue.html)
- [[블로그] iOS 비동기처리기술 GCD, Operation Queue 소개](https://0urtrees.tistory.com/30)
- [[블로그] iOS & Swift 공부 - Operation Queue](https://velog.io/@kevinkim2586/iOS-Swift-%EA%B3%B5%EB%B6%80-Operation-Queue)
- [[stack overlow] How to sleep for few milliseconds in swift 2.2?](https://stackoverflow.com/questions/38119742/how-to-sleep-for-few-milliseconds-in-swift-2-2)
- [[부스트코스] 2) OperationQueue](https://www.boostcourse.org/mo326/lecture/16898?isDesc=false)

#### 선택정렬
- [[유투브] 선택정렬 - Select-sort with Gypsy folk dance](https://www.youtube.com/watch?v=Ns4TPTC8whw&t=322s)
- [[블로그] Swift3 ) Swift로 선택정렬(Selection Sort)짜보기 - Zedd](https://zeddios.tistory.com/66)
#### OperationQueue
- [[블로그] [iOS] Operation? Operation Queue? 작업을 객체로 만들어보자!](https://onelife2live.tistory.com/18)
- [[Apple Developer Documentation] Operation.QueuePriority](https://developer.apple.com/documentation/foundation/operation/queuepriority)
- [[Apple Developer Documentation] addOperations:waitUntilFinished:](https://developer.apple.com/documentation/foundation/nsoperationqueue/1408358-addoperations)
- [[블로그] iOS) Operation실험 - Zedd](https://zeddios.tistory.com/512)
- [addOperations:waitUntilFinished: 적용](https://developer.apple.com/documentation/foundation/nsoperationqueue/1408358-addoperations)
