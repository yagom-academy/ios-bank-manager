# 은행 관리 매니저

## 프로젝트 저장소
> 프로젝트 기간: 2022-06-27 ~ 2022-07-08</br>
> 팀원: [현이](https://github.com/bradheo65), [그루트](https://github.com/Groot-94)</br>
리뷰어: [@GREENOVER](https://github.com/GREENOVER)</br>
그라운드롤: [GroundRule](https://github.com/Groot-94/ios-bank-manager/wiki/GroundRule)

## 📑 목차
- [개발자 소개](#개발자-소개)
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [구현내용](#구현내용)
- [키워드](#키워드)
- [참고문서](#참고문서)
- [핵심경험](#핵심경험)
- [기능설명](#기능설명)
- [Debugging](#Debugging)
- [1️⃣ Step01](https://github.com/Groot-94/ios-bank-manager/wiki/Step01)
- [2️⃣ Step02](https://github.com/Groot-94/ios-bank-manager/wiki/Step02)
- [3️⃣ Step03]()

## 개발자 소개
|현이|그루트|
|:---:|:---:|
| <image src = "https://i.imgur.com/0UjNUFH.jpg" width="250" height="250">| <image src = "https://i.imgur.com/Cxc3e7j.jpg" width="250" height="250"> |
|[현이](https://github.com/seohyeon2?tab=repositories)|[그루트](https://github.com/Groot-94)|


## 프로젝트 소개
- 은행 고객의 총 수와 소요 시간을 콘솔로 확인할 수 있는 프로젝트입니다.
    
## UML  
### [ClassDiagram]
![classDiagram](https://i.imgur.com/jpO2YBJ.jpg)

## 구현내용
- 대기하고 있는 고객들의 번호가 담길 대기열(큐, Queue) 타입 구현
    
## 키워드
- Queue
- Node
- Linked List
    - Doubly Linked List
    - Singly Linked List
- Generics
    
## 참고문서
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

## 핵심경험
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
## 기능설명

### Node
```
Linked-list를 구현하기 위한 Node 타입 구현.
```
    
### LinkedList
```
CustomerQueue를 구현하기 위한 Linked-List 타입 구현.
```

### CustomerQueue
```
고객이 임시로 대기할 대기열(Queue) 타입 구현.
```
### QueueError
```
CustomerQueue의 에러 타입 구현.
``` 
### Bank
```
은행 전반적인 업무를 담당하는 타입 구현.
```
### BankManager
```
은행 업무를 수행하는 타입 구현
``` 
### Customer
```
고객 타입 구현
```    
## Debugging 
### STEP 1 
#### Command Line Tool에서 Unit Test를 위해서 `@testable import` 을 사용할 때 모듈을 찾지 못하는 문제가 발생.

![](https://i.imgur.com/0KmmZb2.png)

- 문제 해결을 위한 시도 
    - Unit Testing Bundle을 사용해서 직접 프로젝트 target을 추가했다.
    ![](https://i.imgur.com/6B7tJpG.png)
    - Scheme도 직접 추가하는 방법을 사용.
    1. 
    ![](https://i.imgur.com/fZ3vgDw.png)
    2.
    ![](https://i.imgur.com/uDCXPub.png)
    - 마지막으로 테스트에 사용되는 클래스의 target Target Membership을 추가했다.
    ![](https://i.imgur.com/9b9xxIp.png)
- 테스트 파일에서 `@testable import`를 사용하지 않아도 문제가 일어나지 않았다.
![](https://i.imgur.com/kFp6l0O.png)

[참고 페이지](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%97%90%EC%84%9C-%EC%9C%A0%EB%8B%9B-%ED%85%8C%EC%8A%A4%ED%8A%B8-%ED%95%98%EA%B8%B0)
### STEP 2 
