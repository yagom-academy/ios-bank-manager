## 프로젝트 7 - 은행 창구 매니저

# 개요

1. 프로젝트 기간: '21.12.20 ~ '21.12.31
2. 캠퍼 : Lily, 숲재
3. 리뷰어 : 그린

# 학습 키워드
1. Step1
- `LinkedList`
- `Queue` 
- `UnitTest` 

# STEP1 

## 고민한 점
**1. Queue의 Clear메서드 구현**
```swift
    mutating func removeAll() {
        head = nil
        tail = nil
    }
```
Queue의 `Clear`메서드를 구현하기 위해 LinkedList에 구현 된 `RemoveAll`메서드를 사용하였습니다. 이 과정에서 LinkedList의 head에 nil을 할당하면 tail을 제외한 모든 Node가 deinit이 되는것을 확인할 수 있었습니다. 따라서 head와 tail에 nil을 할당하는 것으로 연결리스트가 가지고 있는 모든 Node를 삭제하는 함수를 구현했습니다. tail만 남아있게 되는 이유는 `LinkedList` 타입에서 참조를 계속 해주고 있기 때문이라고 생각이 되는데, tail변수를 굳이 약한 참조할 필요는 없는 것 같아 그대로 두었습니다.
<br>

**2. Struct와 Class중 어느것을 선택할지** 
`Node`,`LinkedList`와 `Queue`를 구조체와 클래스 중 어떤 타입으로 구현할지 고민했습니다.

`Node`는 `LinkedList`의 `next`프로퍼티로 전달될 때 참조로 전달되는 것이 효율적이라 판단하여 클래스를 선택했습니다.
그리고 `LinkedList`와 `Queue`는 class를 사용해야할 이유가 없는 것 같아서 디폴트로 struct를 사용하라는 애플의 권고에 따라서 struct로 구현했습니다.
<br>
