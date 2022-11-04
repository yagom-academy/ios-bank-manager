# 은행창구 매니저

## 0. 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)
5. [실행 화면](#5-실행-화면)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [핵심 경험](#7-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#8-참고-링크)

## 1. 소개
은행 업무를 처리하는 간단한 CMD 앱입니다.

<br>

## 2. 팀원
<div align="center">

| zhilly | 미니 |
| :---: | :---: |
| <img src=https://user-images.githubusercontent.com/99257965/190572502-b7a41ed7-3c1b-44af-8b03-77d7e49d4705.png width=150> | <img src=https://i.imgur.com/i6XRuQE.jpg width=150> |
| [@zhilly11](https://github.com/zhilly11) | [@minii](https://github.com/leegyoungmin) |

</div>


<br>

## 3. 타임라인
[STEP-1]
- 2022.10.31
     - 프로젝트 초기 설정
     - 사용자 대기 Queue 타입 테스트 코드 작성
- 2022.11.01
     - SwiftLint 적용
     - 사용자 대기 Queue 타입 구현


[STEP-2]
 - 2022.11.03
     - Console Manager 타입 구현 및 메서드 구현
     - Bank Manager 타입 구현 및 메서드 구현
     - Bank 타입 구현 및 메서드 구현
     - 코드 리팩토링


[STEP-3]

[STEP-4]

<br>

## 4. 시각화된 프로젝트 구조
### File Tree

```bash
├── BankManagerConsoleApp
│   ├── Bank.swift
│   ├── ConsoleManager.swift
│   ├── Customer.swift
│   ├── CustomerQueue.swift
│   ├── LinkedList.swift
│   ├── Node.swift
│   └── main.swift
├── ManagerQueueTests
    └── CustomerQueueTests.swift
```
<br>

### UML
- ConsoleApp 구현 타입의 UML
![ConsoleAppUML](https://user-images.githubusercontent.com/99257965/199923301-c4d42e00-ebbc-421e-a84d-87e4596a6386.jpg)

<br>

## 5. 실행 화면
- 큐 타입 구현 후 테스트 수행결과
![testImage](https://i.imgur.com/7oC1mdo.png)

- 한명의 은행원이 업무를 처리하는 과정
![previewOfCmd](https://i.imgur.com/11t6i1E.gif)



## 6. 트러블 슈팅
<details open>
    <summary><strong>DispatchQueue의 사용</strong></summary>
    <ul>
        <li>요구사항 중 `은행에는 n명의 은행원이 근무하고, 한명의 은행원만이 창구 업무를 한다.`라는 문구를 이해나는 것에서 어려움을 느낀 것 같다. 여러명의 은행원은 다중 쓰레드의 환경을 말하는 것인지, 단순히 여러개의 은행원 인스턴스가 존재해야 하는 것인지에 대해서 고민하게 되었고, 이를 해결하지 못한채 구현을 하려고 하니 어려움을 겪은 것 같다. 그래서 논의를 하여서 인스턴스를 생성하는 방향이 아닌, 다중 쓰레드의 방향으로 구현을 할 수 있는 부분이 있을 것 같다는 결론을 통해서 다중 쓰레드의 환경으로 구현하기로 하였다.</li>
        <li>또한, 다중 쓰레드의 관점에서 데이터를 처리하기 위해서 은행원이 근무하는 시간 동안에는 다른 일을 할 수 없는 것을 구현하기 위해서 동기적으로 코드를 작성하려고 하였다.</li>
        <li>하나의 업무를 처리하는데 걸리는 시간은 0.7초라는 요구사항이 있었고, 이를 해결하기 위해서 `asyncAfter` 메서드를 활용하려고 하였다. 하지만, 비동기적으로 처리하는 것이 아니기 때문에 `sleep`메서드를 활용하여서 업무 시간을 기다릴 수 있도록 하였다.</li>
    </ul>

</details>

<details>
    <summary>제목</summary>


</details>
    
    
<br>

## 7. 프로젝트 수행 중 핵심 경험
- Linked-List 타입으로 Queue 타입 구현
-
-


<br>

## 8. 참고 링크



---
[🔝 맨 위로 이동하기](#계산기)
