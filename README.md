# 🏦 은행 창구 매니저

###### tags: `README`

>프로젝트 기간 2022.04.25 ~ 2022.05.06
>
>팀원 : [dudu](https://github.com), [Eddy](https://github.com/kimkyunghun3) / 리뷰어 : [또치](https://github.com/TTOzzi)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)

## 프로젝트 소개

은행 창구 매니저 만들기!

## UML

![](https://i.imgur.com/SN4Vxkm.jpg)


## 개발환경 및 라이브러리
![swift](https://img.shields.io/badge/swift-5.6-orange)
![xcode](https://img.shields.io/badge/Xcode-13.3-blue)
![iOS](https://img.shields.io/badge/iOS-14.0-yellow)

## 키워드

`git flow` `Queue` `LinkedList` `TDD` `Protocol Oriented Programming` `추상화` `GCD` `DispatchQueue` `DispatchSemaphore` `DispatchGroup` `Thread`

## 고민한점

- test 코드와 실제 코드의 커밋 단위
- 이미 검증된 매서드를 다른 매서드의 테스트에서 사용하는것
- 구조체가 참조타입을 프로퍼티로 가지고 있는 경우
- 구조체의 mutating 키워드
- Thread.sleep()
- private 매서드 테스트 여부
- STEP2의 비지니스 로직 테스트 방법
- testcode 메서드 테스트 하는 단위
- Delegate를 weak으로 선언하는 부분
- bank 클로저 속 bank, bankWindow delegate 채택
- 항상 weak self를 써도 되는지
- 동일 로직의 연산 프로퍼티 vs 메서드 vs extension의 차이
- 세마포어 global Thread 로직 부분를 분리할 수 있을까?

### 자세한 고민 보기

#### [STEP1](https://github.com/yagom-academy/ios-bank-manager/pull/144)
#### [STEP2](https://github.com/yagom-academy/ios-bank-manager/pull/154)
#### [STEP3]()

## 배운개념

#### CFAbsoluteTimeGetCurrent() 을 사용해서 코드의 실행시간을 측정할 수 있는 법

#### enum과 rawValue 활용한 유저 입력 처리

#### 구조체 memberwise initializer 활용한 값 이용

#### Protocol을 이용한 추상화

#### DispatchQueue, Group, Semaphore
