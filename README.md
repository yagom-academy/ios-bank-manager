# 🏦 은행창구매니저 README.md
>프로젝트 기간 2022.06.27 ~ 2022.07.08
>
>팀원 : [unchain123](https://github.com/unchain123), [BaekGom](https://github.com/Baek-Gom-95)/ 리뷰어 : [제이크](https://github.com/jryoun1)
## 목차

- [프로젝트 소개](#프로젝트-소개)  
- [개발자 소개](#개발자-소개)  
- [Preview](#Preview)  
- [UML](#UML)  
- [키워드](#키워드)  
- [PR메세지](#PR메세지)  
    - [STEP1에서 PR내용](#STEP1PR)
    - [STEP2에서 PR내용](#STEP2PR)

## 프로젝트 소개
- LinkedList를 활용한 큐타입을 구현하고 동기 비동기 처리를 통해 은행업무 구현

## 개발자 소개
|백곰|언체인|
|:---:|:---:|
|<img src=https://i.imgur.com/c17eEk8.jpg width=250 height = 250>|<img src="https://i.imgur.com/gEAc4rf.png" width="250" height="250">|
|[BaekGom](https://github.com/bar-d)|[unchain123](https://github.com/unchain123)|



## Preview
## 앱 동작 화면
|은행업무화면|잘못된입력 후 2번입력해서 앱종료|
|:---:|:---:|
|<img src=https://i.imgur.com/euiUPeK.gif width = 250 height =450>|<img src=https://i.imgur.com/9YEx3AK.gif width=250 height=450 >|

## UML
![](https://i.imgur.com/Gt80eRY.jpg)


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
[![iOS](https://img.shields.io/badge/14.0-000000.svg?style=flat&logo=iOS)]()

## PR메세지
### [STEP1PR](https://github.com/yagom-academy/ios-bank-manager/pull/182)
### [STEP2PR](https://github.com/yagom-academy/ios-bank-manager/pull/193)

## 트러블슈팅

- 처음 UnitTest작성시 testable을 사용해서 진행하려고 할때 아래와 같은 문제가 발생해서 scheme을 추가하고 타겟을 설정해서 해결을 했습니다.

|문제화면|해결방법|해결방법2|
|:---:|:---:|:---:|
|<img src="https://i.imgur.com/EPGfR5v.png" width="250" height="250">|<img src="https://i.imgur.com/G8JnAWA.png" width="250" height="250">|<img src="https://i.imgur.com/d3LSvvP.png" width="250" height="250">|

- 그 후에 UItest 진행시 아래와 같은 에러가 unchain의 맥(M1)에서만 발생하고 baekgom의 맥(Intel)에서는 발생하지 않았습니다.
```
Could not find module 'BankManagerConsoleApp' for target 'x86_64-apple-
macos'; found: arm64-apple-macos, 
at:/Users/kay/Library/Developer/Xcode/DerivedData/BankManagerConsoleApp-
acslyqhrplbojmgnotygnhtucvdv/Index/Build/Products/Debug/BankManagerConsoleApp
.swiftmodule
```
- 리뷰어 답변
> 관련된 오류는 찾아봤더니 일단 휴먼에러는 아닌 것 같습니다.
M1과 Intel맥의 차이라기보다는 M1에서 사용할 때 문제가 있는 경우인 것 같습니다.
관련된 질문들과 답변이 forum에 있으니 한 번 참고해보시면 좋을 것 같습니다. 🙏🏻
Apple forum
