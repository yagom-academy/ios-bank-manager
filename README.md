## iOS 은행 매니저 프로젝트

## 캠퍼
[Ian](https://github.com/LeeSungNo-ian)<br>
[Sunny](https://github.com/unme88)

## 기간
- 2021/04/26 ~ 2021/05/07

## 타임라인
- 4월 26일 (월) : 팀 그라운드 룰 작성, 동기, 비동기, 쓰레드 학습
- 4월 27일 (화) : 은행창구 매니저 UML, 플로우 차트 작성
- 4월 28일 (수) : 개별 공부
- 4월 29일 (목) : Project [Step1] 진행
- 4월 30일 (금) : Project [Step1] 진행, 1차 PR

<br>

- 5월 3일 (월) : 1차 PR 피드백 반영 및 수정
- 5월 4일 (화) : Project [Step2] 진행하기 위한 문법 공부 (Operation Queue에서의 우선순위와 다중처리 방법), 은행창구 매니저 UML - 2 작성
- 5월 5일 (수) : 은행창구 매니저 UML - 2 마무리
- 5월 6일 (목) : Project [Step2] 진행
- 5월 7일 (금) : Project [Step2] 진행, 2차 PR

### UML
![은행창구 매니저 UML_3차 버전](https://user-images.githubusercontent.com/70262005/117418314-3bc8dd80-af56-11eb-828c-fc8ec6f0fe9b.jpg)

### 실행화면
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/70262005/117425824-222b9400-af5e-11eb-858e-d58f91153329.gif)

### 코드를 작성할 때 고민되었던 점
* Operation Queue에서의 우선순위와 다중처리 방법
Operation Queue에서의 우선순위를 어떻게 적용해야 할지 모르겠어서 관련 개념을 찾아봤어요. 우선순위를 정해주기 위해서 queuePriority 혹은 Dependency를 활용하는 것으로 알게 됐어요.<br> 
<br>
둘 중 어느걸 선택해야 하는지 고민했는데요.<br> 
queuePriority를 활용해서 우선 순위를 적용해줬습니다.<br>
<br>
저희가 알기로는 queuePriority는 같은 오퍼레이션 큐에 있는 작업들에만 해당되는 걸로 알고 있어요. 만약에 오퍼레이션 큐가 여러개 있고, 우선순위 다른 작업들이 서로 흩어져 있으면 이슈가 발생할 수 있어요. 예를 들면, 우선순위 낮은 작업이 (다른 큐에 있는) 우선 순위 높은 작업들보다 먼저 실행될 수도 있어요. 이번 프로젝트는 어차피 Queue가 1개라서 저런 이슈는 고려하지 않아도 된다고 판단했어요.<br> 

* queuePriority 적용과 super.init의 활용<br>
        super.init()<br>
        super.queuePriority = grade.queuePriority<br>
queuePriority를 어디서, 어떻게 적용해줘야 하는지 고민했어요.<br>
그 과정에서 super.init을 알게 됐는데요. <br>
개념을 잘 이해하지 못해서 처음에 혼란스러웠어요.<br>
<br>
(Task.swift 파일에서 보시면) Task 클래스가 Operation 클래스를 상속한 다음에, super.init()을 사용해서 Operation의 QueuePriority를 저희가 정의한 CustomerPriority의 queuePriority로 재정의 할 수 있는 것으로 이해했어요. <br>

* 작업의 단위를 고객으로 봐야하는지? 고객의 업무 자체로 봐야하는지?
OperationQueue에 하나의 작업을 넣어주기 위해선, 하나의 작업 단위를 뭘로 봐야할지 고민했는데요.
처음엔 예금이나 대출 업무 자체만을 하나의 작업 단위로 봐야 한다고 생각했어요. 은행 입장에선 한 명의 고객이 하나의 작업인 셈이고, 그때 어차피 우선 순위도 고려해야 해요. 그런 관점에서 봤을 때 고객 1명을 하나의 작업 단위로 보고, OperationQueue에 넣어주기로 했어요.

* 이번 프로젝트에서 에러를 관리 해야할까요? 이번 프로젝트에서는 타입과 테이터의 값이 추가되거나 변경되는 경우가 드물어, 외부로부터 들어오는 데이터의 종류가 앱 실행시 입력하는 메뉴뿐이여서 별도의 에러타입을 구현하지 않았습니다.

### 해결이 되지 않은 점
* 비동기적으로 Operation이 끝난 후 호출되는 closure도 활용해 보려고 노력했지만 시간이 부족해 구현하지 못했었어요
* 대기 번호를 콘솔에 출력할 때 이용하는 것 이상으로 활용하지 못했어요. 이해한 바로는 서로 다른 고객 등급 간에는 대기번호가 의미가 없지만 (우선 순위가 높은 고객이 먼저 처리될 거기 때문에) 같은 등급 안에서는 대기 번호로 한번 더 정렬이 돼야 한다고 생각했어요. 구현에 크게 차이가 없을 것 같기도 하고, 시간상 이렇게 설계는 못했어요. 하이디라면 대기 번호를 어떻게 활용하실 것 같나요? 만약에 적용한다면 고객 등급끼리 배열로 나눠서 우선순위가 높은 등급 배열부터 큐에 넣어주는 방법이 괜찮을까요?

### 조언을 얻고 싶은 부분
* static을 쓰는 것보다 더 좋은 방법이 있을까요?
static으로 전역 변수, 상수를 쓰는 걸 지양하는게 좋다고 들었어요.
저희는 Customer.swift에서 보시면 CustomerPriority와 TaskType의 랜덤값을 모두 static var random으로 선언해줘서, enum 밖에서도 사용할 수 있게 해줬어요.

만약 static을 안 쓴다면 어떤 방향으로 코드를 개선하실 것 같은지 알고 싶어요!
