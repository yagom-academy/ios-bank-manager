# 은행창구 프로젝트 

## 소개
- 고객의 은행 업무를 처리하고 알려주는 애플리케이션이다.
- 이 애플리케이션에서는 큐와 동시성 프로그래밍에 대해  자세히 알아볼 수 있다.

## 팀원

1. 예톤
- <img src = "https://user-images.githubusercontent.com/99063327/174224341-9ba4e42e-3ff2-4c58-b910-1d0b8d4d87f1.png" width = "10%" height = "10%"> 
- 예톤 [@yeeton37](https://github.com/yeeton37)
- iOS Career Starter 6th Camper

2. 웡빙
- <img src = "https://user-images.githubusercontent.com/98514397/176106991-e29be177-758d-400a-9f47-9022eaa260fa.png" width = "10%" height = "10%"> 
- 웡빙 [@wongbingg](https://github.com/wongbingg)
- iOS Career Starter 6th Camper

### Timeline

### 1주차

- 월
`그라운드 룰 작성`, `연결리스트 구현`, `연결리스트에 대한 이해`, `CommandLineTool에서 UnitTest작성`, 
    
- 화 
 `Unit테스트코드 추가`  `PR메세지 작성` `README 업데이트`




### **이번 프로젝트를 수행함에 있어 꼭 읽고 참고해야 하는 문서**
- [command line tool에서 unit test하기](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)
- [generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

### 시간

[프로젝트에 집중하는 시간]
- 10: 00 - 22: 00

[연락이 어려운 시간]
없음

[휴일]
- 예톤 : 주말
- 웡빙 : 주말

### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- feat = 주로 사용자에게 새로운 기능이 추가되는 경우
- fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- docs = 문서에 변경 사항이 있는 경우
- style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지

# Step


## Step 1


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


### 3. UnitTest
- NodeTests
- LinkedListTests
- CustomerQueueTests

[참고 링크](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)

### 4. 스텝 핵심 경험

- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용

### 5. 고민한 점

- 저희가 step2까지의 기능 명세서를 보았을 때는 리스트 중간에 데이터가 추가될 일이 없어보였고, 또 tail 변수를 만들어주어야 할 필요성을 느끼지 못해서 양방향 연결리스트가 아닌 단방향 연결리스트로 구현해주었습니다. 추후 확장성도 고려해봤을 때 양방향 연결리스트로 구현하는 것이 좋았을지 여쭤보고 싶습니다.

- 큐와 연결리스트의 기능이 같아보이는데 따로 연결리스트와 큐 타입을 만들어서 큐에서 연결리스트의 기능을 가져와서 사용하는 것이 이해가 가지 않았습니다. 그냥 큐에서 바로 연결리스트의 기능을 구현해주면 되지 않나? 라고 생각했었습니다.
    -  찾아보니 큐는 구현 방법이 정의되어 있지 않은 자료형이고 연결리스트는 다음 데이터의 위치를 저장하는 방식인 자료구조기 때문에 따로 구현해줘야 함을 알게되었습니다! 저희가 생각한 것이 맞는지 궁금합니다.

- CustomerQueue를 구조체로 만들어 주었는데, 안에 쓰이는 Node 인스턴스는 클래스(참조타입) 입니다. 이렇게 만들어줄 경우 CustomerQueue도 결국 참조타입이 되는 것인지 궁금합니다.

