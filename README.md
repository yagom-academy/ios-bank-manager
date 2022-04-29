# 은행 창구 매니저 프로젝트
> 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
팀원 : [@Lingo](https://github.com/llingo) [@Cathy](https://github.com/cathy171) / 리뷰어 : [@Steven](https://github.com/stevenkim18)

## 목차

- [키워드](#키워드)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 2](#step-2)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 3](#step-3)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [그라운드 룰](#그라운드-룰)
    + [활동시간](#활동시간)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## 키워드
- `연결 리스트` `Queue(큐)`
- `Generics`
- `XCTest`

---

## UML
![](https://i.imgur.com/jJIMmpe.png)

---

## [STEP 1]
### 고민 및 해결한 점

**💡 Xcode의 Command Line Tools로 만들어진 App에 XCTest를 추가하는 과정에서 `target x86_64...; found: arm64` 에러가 발생했습니다.**

![](https://i.imgur.com/B5gK6Jy.png) 

<img width="400px" src="https://i.imgur.com/vCrXVEh.png"/> <br/>

저희는 인텔 맥과 M1 맥 사이에서 발생한 문제라고 생각했고 다음과 같은 시도를 해보았습니다.

1. Build Setting의 `Always Embed Swift Standard Library`설정 값 변경
2. x86_64 와 arm64 관련 설정 값 변경을 시도
3. Build Phase의 Compile Source 항목에 테스트할 코드를 추가

1, 2번의 방법으로는 문제를 해결할 수 없었으며 3번의 방법으로 해결할 수 있었습니다. 3번의 방법은 BankManagerConsoleAppTest 타겟에서 사용하는 BankManagerConsoleApp 파일들의 Target Membership를 추가하는 것과 같다는 것을 알 수 있었고 추가한 후 testable를 제거했더니 문제가 해결할 수 있었습니다.

<img width="400px" src="https://i.imgur.com/9qaVHjm.png"/> <br/>
<img width="400px" src="https://i.imgur.com/AeiwbrX.png"/>

### 조언 받고 싶은 점
**💡 `Swift Lint`에서 `line_length`가 적용되지 않는 현상**
```
disabled_rules:
  - multiple_closures_with_trailing_closure

excluded:
  - Pods
  
opt_in_rules:
  - closure_spacing
  - force_unwrapping
  - implicitly_unwrapped_optional
  - legacy_multiple
  - operator_usage_whitespace

line_length: 99
indentation: 2
```
위와 같이 `swiftLint` 파일에 `line_length`를 99줄로 설정해주었는데 적용이 되지 않았습니다. 기본적인 설정이 120줄로 되어있는데 저희가 임의적으로 설정을 해주고 싶을 때는 어떻게 설정해야하는지 궁금합니다.

**💡 프로젝트 요구조건에는 Queue를 구현하기 위해 LinkedList를 구현하도록 되어있는 것에 대하여**
Queue를 구현하기 위해 LinkedList를 구현하도록 되어있고 요구사항에 맞게 LinkedList를 구현했습니다. 
저희가 구현하면서 `Node -> LinkedList -> Queue`가 아닌 `Node -> Queue`로 바로 구현해도 될 것 같다는 얘기가 나왔었는데 LinkedList를 생략하고 구현해도 되는지 궁금합니다.

---

## [STEP 2]
### 고민 및 해결한 점
### 조언 받고 싶은 점

---

## [STEP 3]
### 고민 및 해결한 점
### 조언 받고 싶은 점

---

## 🪧 그라운드 룰

## 활동시간
### 📚 공통
**스크럼(수요일 제외)** : 10시 ~ 11시
- 전날 공부한 것을 공유
- 모르는 내용을 서로 묻기

### 세션 있는 날 (월/목)
- 세션 후) 17시 ~ 18시
- 식사 후) 20시 ~ 22시+

### 세션 없는 날 (화/수/금)
- 식사 후) 13시 ~ 18시
- 식사 후) 20시 ~ 22시+

---

## 코딩 컨벤션
**Swift 코드 스타일**
- 코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

**커밋 규칙**
- 커밋 제목은 최대 50자 입력
- 본문은 한 줄 최대 72자 입력

**커밋 제목 규칙**
- 제목 끝에 마침표(.) 금지, 한글로 작성

**커밋 메세지**
```
기능(feat): 새로운 기능 구현.
버그(fix): 버그, 오류 해결.
리팩토링(refactor): 코드 리팩토링 / 전면 수정이 있을 때 사용합니다
형식(style): 코드 형식, 정렬, 주석 등의 변경 (코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
문서(docs): 문서 수정 / README나 WIKI 등의 문서 개정.
기타(chore): 코드 수정, 내부 파일 수정
```

**브랜치 이름 규칙**
`STEP1`, `STEP2`, `STEP3`