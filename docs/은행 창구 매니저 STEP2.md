# 은행 창구 매니저 STEP2

---

## 키워드
* `readLine()` 메서드
* `Queue`의 활용
* 객체지향 프로그래밍
* 타입 추상화
* 일반화

## 배운개념
* 타입 추상화(**Protocol-Oriented Programming**) :
어떤 양상, 세부 사항, 구조를 좀 더 명확하게 이해하기 위해 특정 절차나 물체를 의도적으로 **생략**하거나 **감춤**으로써 **복잡도를 극복**하는 방법
* 일반화(**Generalization**) :
일반화는 우리가 작성하는 코드에서 **중복적인 요소** 또는 로직을 찾아 **공통화**하는 것을 의미.

## step2 기본 구현 방식

|1번 선택시|2번 선택시|  
|:---:|:---:|  
|<img src="https://i.imgur.com/TSJe3Hx.gif" width="400"/>|<img src="https://i.imgur.com/65bLnvu.gif" width="400"/>|  
|1번과 2번 제외 선택시|공백 포함 1번 선택시|  
|<img src="https://i.imgur.com/kEMIcrx.gif" width="400"/>|<img src="https://i.imgur.com/2XTymbY.gif" width="400"/>|  
|공백 포함 2번 선택시||   
|<img src="https://i.imgur.com/587OSQh.gif" width="400"/>||

## 고민한점 🤔
### Node 타입에 weak 적용
```swift
final class Node<T> {
    weak var next: Node<T>?
    weak var previous: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
```
처음에는 위와 같이 `next` 노드와 `previous` 노드를 둘 다 `weak`으로 설정해주었습니다.
하지만, 이렇게 할 경우 노르를 추가할 때마다 해당 노드를 `Strong` 하게 가리키는 노드가 없어서 중간에 있는 노드들이 `deinitialize` 되는 현상이 있었습니다. 고민 끝에 `next` 또는 `previous` 노드 둘 중 하나의 노트에만 `weak`으로 주는 것으로 해당 문제를 해결했습니다.
```swift
final class Node<T> {
    var next: Node<T>?
    weak var previous: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
```
