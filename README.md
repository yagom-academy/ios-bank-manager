# 은행 창구 매니저 
> 프로젝트 기간 2022-04-25 ~ 2022-05-06 
팀원 : [@두기](https://github.com/doogie97) [@쿼카](https://github.com/Quokkaaa) / 리뷰어 : [@Tony](https://github.com/Monsteel)

## STEP 1 기능 구현
- `LinkedList를 통한 Queue구현`

## 고민했던 것들
#### 1.`Linked List`의 `class` VS `struct`
`LinkedList`는 상속도 참조도 하지 않으니 heap영역을 사용하지 않는 값타입의 `struct를` 사용하는 것이 성능 적인 측면에서 좋을 것이라고 생각을 했다
그런데 `LinkedList를` `struct로` 만들게 된다면 `mutating`키워드를 사용하게 되다보니 결국 값의 변경을 위해 복사를 해놓는 비용이 생기게 되는데 이걸 상쇄시킬 만큼의 성능적 이득이 있을지 고민을 했다
-> 일단은 큰 차이가 없을 것이라고 생각해 class를 선택하긴 했으나 명확한 차이를 내는 사실을 찾게 된다면 그 사실에 따라 변경 가능성 있음

#### 2. 연산프로퍼티와 메서드의 사용의 구분 법
사이드이펙트가 없이 간단히 값만 확인하는 목적인 isEmpty, first는 연산프로퍼티로 구현해주고 사이드이펙트가 발생하는 기능은 메서드로 구현함

## 배운 개념
- `Linked List`
- `ARC`

## PR 후 개선사항
#### 1. early return시 `guard` vs `if`
```swift
  guard !isEmpty else { return }
```
프로젝트 코드 중 조건을 확인해 리턴을 바로 해주는 구문이 있었는데 통상적으로 early return을 할 때는 `guard`문을 사용한다고 알고 있었으나 리뷰어의 말에 따르면
'`guard`문을 써서 얻는 이득이 무엇인지, 어떤게 더 가독성이 좋은지에 따라서 선택하면 좋겠다 그리고 일반적으로 ~해서 했다 라는 생각은 내려두면 좋겠다' 라는 말을 듣고
훨씬 더 알아보기 쉬운

```swift
if isEmpty { return }
```
으로 코드변경을 하게 되었다

#### 2. Node에 들어올 값의 네이밍
최초에 큐에 사용되는 제네릭 타입의 이름을 `Element`라고 지었으며 Node에 들어올 값의 네이밍은 `data`로 지었다
그런데 이렇게 되면 노드의 값을 부를 때 `data`라고 부르는 사람이 있을 수 있고 `Element`타입의 요소니 `element`라고 부를 사람이 생겨 혼용 될 수 있을 수 있으니 `data`를 `element`로 변경 하기를 제안해 주셨다
최종적으로, `Element`와 값의 구분을 위해 `data`를 `newElement`로 수정하게 되었다


## STEP 2 기능 구현
- 한 명의 은행원이 임의의 수만큼의 고객을 처리하는 기능 구현

## 고민했던 것들
#### 1. 매직넘버, 매직리터럴 처리
매직넘버, 매직리터럴 처리를 해주려고 했던 이유는 가독성 향상과 수정에 용이하게 하기 위함이었다

처리 전
```swift
func printCloseMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(seconds)초입니다.")
}
```

처리 후
```swift
func printCloseMessage() {
        print("\(Constant.endWork+Constant.totalWorkTime)\(totalCustomerCount)\(Constant.numberOfPeople+Constant.totalWorkTime)\(workingTime)\(Constant.seconds)")
}
```

그런데 처리하다보니 위와같은 문제가 발생되었는데 이게 과연 가독성과 유지보수 측면에서 어떤 이득을 가져올 수 있을까...?
라는 의문이 들었다

결과적으로 매직넘버와 매직리터럴 처리에 너무 강박을 갖고 무조건적으로 처리를 해주는 것이 아닌 상황에 따라 유동적으로 처리하기로 하였으며 가독성이 좋다면 하드 코딩이 꼭 나쁜 것 만은 아니겠다는 결론을 내렸다

#### 2. 메서드의 분리
메서드의 기능별 분리는 항상 고민하고 해결해야하는 문제다

수정 전
```swift
mutating func start() {
    receiveCustomer()
    let startTime = CFAbsoluteTimeGetCurrent()
    sendCustomerToClerk()
    let durationTime = CFAbsoluteTimeGetCurrent() - startTime
    workingTime = String(format: Constant.twoDecimalPlaces, durationTime)
    printCloseMessage()
    }
```
위 코드를 보면 `startTime`과 `durationTime`은 시간을 측정하기 위해 작성된 코드이다

우리는 이 코드를 어떤 메서드의 시간을 측정하기 위한 메서드로 분리를 하기 원했고 아래와 같은 방법을 사용하였다

```swift
func timeCheck(_ block: () -> Void) -> String {
    let startTime = CFAbsoluteTimeGetCurrent()
    block()
    let durationTime = CFAbsoluteTimeGetCurrent() - startTime
    return String(format: "%.2f", durationTime)
    }
    
mutating func openBank() {
    receiveCustomer()
    workingTime = timeCheck {
        sendCustomerToClerk()
    }
    printCloseMessage()
}
```

() -> Void 형태의 클로저를 매개변수로 받아 걸린 시간을 string으로 반환해주는 `timeCheck`라는 메서드를 만들어 사용하게 되었다

## 배운 개념
- `string format`
- `클로저를 매개변수로 받기`
- 

## PR 후 개선사항
#### 어떤 생각에 너무 강박을 갖지 말자!
- 그 동안 어떻게 처리해 왔고 어떻게 처리를 해왔고 어떻게 생각해왔고와는 별개로 지금 현재 코드 작성에 있어 어떤게 더 효율적인지를 고민하는 습관을 들이자(ex 매직넘버, 매직리터럴 처리와 같은...)

## 커밋 룰
Commit message
커밋 제목은 최대 50자 입력

💎feat : 새로운 기능 구현
✏️chore : 사소한 코드 수정, 내부 파일 수정, 파일 이동 등
🔨fix : 버그, 오류 해결
📝docs : README나 WIKI 등의 문서 개정
♻️refactor : 수정이 있을 때 사용 (이름변경, 코드 스타일 변경 등)
⚰️del : 쓸모없는 코드 삭제
🔬test : 테스트 코드 수정
📱storyboard : 스토리 보드를 수정 했을 때

Commit Body 규칙
본문은 한 줄 최대 72자 입력
제목 첫 글자를 대문자로
제목은 명령문으로
제목 끝에 마침표(.) 금지
제목과 본문을 한 줄 띄워 분리하기
본문은 “어떻게” 보다 “무엇을”, "왜"를 설명한다.
본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
