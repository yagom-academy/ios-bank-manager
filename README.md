## 은행 창구 매니저

 
<div align="center">
    <img src="https://img.shields.io/badge/swift-5.7-F05138.svg?style=flat&logo=Swift">
    <img src="https://img.shields.io/badge/14.0-000000.svg?style=flat&logo=iOS">
    <img src="https://img.shields.io/badge/Xcode-13.4.1-white.svg?style=flat&logo=XCode">
    <img src="https://img.shields.io/badge/UIKit-white.svg?style=flat&logo=UIKit">
</div>


<br>

## 🫂 팀 소개
|[민쏜](https://github.com/minsson)|[Derrickkim](https://github.com/derrickkim0109)|
|:--------:|:--------:|
|<img src="" width=200>|<img src="https://avatars.githubusercontent.com/u/59466342?v=4" width=200>|
|||
<br>

## 타임라인

### Week 1
> 2022.06.27 ~ 2022.07.01

- 2022-06-27(월) 
    - 프로젝트 요구명세서 파악
    - 고객 대기열을 표현하는 ClientQueue 구현
        - "Node" LinkedList 구현을 위한 커스텀 타입 정의
        - "LinkedList" ClientQueue 구현을 위한 커스텀 타입 정의
        - "ClientQueue" 은행 고객 대기열을 표현하기 위한 커스텀 타입 정의
        - ClientQueue가 채택할 Queue 프로토콜 정의

- 2022-06-28(화) - STEP_01 PR 전송 완료
    - "BankManagerTests" ClientQueue의 메서드 기능 테스트

- 2022-06-29(수)
    - Step 1 UML 작성
    - 프로젝트 요구명세서를 바탕으로한 타입 추상화 

- 2022-06-30(목)

- 2022-07-01(금)


### Week 2
> 2022.07.04 ~ 2022.07.08

- 2022-07-04(월)
 
- 2022-07-05(화)

- 2022-07-06(수)

- 2022-07-07(목)

- 2022-07-08(금)


## UML

### Step_01
![](https://i.imgur.com/jE0c2ym.jpg)


## 트러블 슈팅

### 1. Command line tool 내 Unit Test 에러

- Unit Test 도중 모듈이 import 되지 않는 에러가 있었습니다.
- 코드상으로는 `@testable import 모듈` 부분이었습니다.
- 이에 따라 아래 절차와 같이 해결했습니다.
`1) Unit test scheme 추가`
`2) 각 파일별로 target member 체크`


## 참고 링크
[Commandline-tool_UnitTest](https://woongsios.tistory.com/162)
