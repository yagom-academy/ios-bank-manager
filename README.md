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
- [3️⃣ Step03](https://github.com/Groot-94/ios-bank-manager/wiki/Step03)

## 개발자 소개
|현이|그루트|
|:---:|:---:|
| <image src = "https://i.imgur.com/0UjNUFH.jpg" width="250" height="250">| <image src = "https://i.imgur.com/Cxc3e7j.jpg" width="250" height="250"> |
|[현이](https://github.com/seohyeon2?tab=repositories)|[그루트](https://github.com/Groot-94)|


## 프로젝트 소개
- 은행 고객의 총 수와 소요 시간을 콘솔로 확인할 수 있는 프로젝트입니다.
    
## UML  
### [ClassDiagram]
![](https://i.imgur.com/7O0LMBE.jpg)


## 구현내용  
- 추후 추가예정
## 키워드
- Queue
- Node
- Linked List
    - Doubly Linked List
    - Singly Linked List
- Generics
- Synchronous, Asynchronous
- GCD(Dispatch Queue)
- Concurrency Programming   
## 참고문서
- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [Swift Language Guide - Subscripts(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
- [Concurrency Programming Guide(선택사항)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [Swift Language Guide - Concurrency(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
- [오토레이아웃 정복하기 - Dynamic Stack View까지 (선택사항)](https://yagom.net/courses/autolayout/)

## 핵심경험
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 동기(Synchronous)와 비동기(Asynchronous)의 이해
- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x] 스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용
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
### BankStatus
``` 
은행 영업 및 종료에 대한 타입을 구현했습니다.
``` 
### BankBusiness
``` 
은행 업무 및 시간에 대한 타입을 구현했습니다.
``` 
### Customer
```
고객 타입 구현
```    
### ConsolManager
``` 
콘솔에서 이루어지는 작업들을 구현했습니다.  
``` 
## Debugging 
### STEP 1 
#### Command Line Tool에서 Unit Test를 위해서 `@testable import` 을 사용할 때 모듈을 찾지 못하는 문제가 발생.

<image src = "https://i.imgur.com/0KmmZb2.png" width="500" height="100">   
          
- 문제 해결을 위한 시도 
    - Unit Testing Bundle을 사용해서 직접 프로젝트 target을 추가했다.
    <image src = "https://i.imgur.com/6B7tJpG.png" width="500" height="300"> 
    - Scheme도 직접 추가하는 방법을 사용.
        1️⃣
        <image src = "https://i.imgur.com/fZ3vgDw.png" width="500" height="400">
            
        2️⃣
        <image src = "https://i.imgur.com/uDCXPub.png" width="500" height="400">
        
    - 마지막으로 테스트에 사용되는 클래스의 target Target Membership을 추가했다.
    <image src = "https://i.imgur.com/9b9xxIp.png" width="500" height="700">
- 테스트 파일에서 `@testable import`를 사용하지 않아도 문제가 일어나지 않았다.
<image src = "https://i.imgur.com/kFp6l0O.png" width="500" height="500">
[참고 페이지](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%97%90%EC%84%9C-%EC%9C%A0%EB%8B%9B-%ED%85%8C%EC%8A%A4%ED%8A%B8-%ED%95%98%EA%B8%B0)
### STEP 3
#### 비동기 처리 시 모든 업무시작이 출력된 후 업무완료가 출력되는 문제  
|문제가 발생한 출력|정상 출력|
|:---:|:---:|
|<image src = "https://i.imgur.com/ZJf3rBZ.png" width="200" height="500">    |    <image src = "https://i.imgur.com/UthR4c6.png" width="200" height="500">|
    
- 원인 분석
     - 스레드의 수를 제어하지 않고 실행했기 때문에, work 함수를 workQueue에 넣어주는 만큼 스레드가 할당된다. 그러므로 모든 업무를 시작하는 시점이 거의 동일하게 진행된다는 점을 발견.
    ```swift
    // 문제 코드
    static func work(customer: Customer, time: TimeInterval) {
            print("\(customer.name) 고객 \(customer.business.part) 시작")
            Thread.sleep(forTimeInterval: time)
            print("\(customer.name) 고객 \(customer.business.part) 완료")
        }

    workQueue.async(group: bankManagers) {
                BankManager.work(customer: customer, time: time)
            }
    ```
- 해결 방법
    - DispatchSemaphore를 사용해 workQueue에서 사용할 스레드의 개수를 정해주는 방법으로 문제 해결. 
    ```swift
    // 수정 코드
    workQueue.async(group: bankManagers) {
                semaphore.wait()
                BankManager.work(customer: customer, time: time)
                semaphore.signal()
            }
    ```
