# 은행 창구 매니저 STEP1

---

## 키워드
* `LinkedList`, `DoubleLinkedList`
* `Queue`, `Enqueue`, `Dequeue`
* `Generics`

## 배운개념
* `LinkedList` : 데이터 노드가 다음 데이터 노드의 주소값을 가지고 있는 형태의 리스트
* `Queue` : First-in First-out 형태의 자료구조
* `Generics` : 제네릭 타입을 사용하면, 다양한 타입을 받아서 메서드 등을 사용할 수 있음으로, 코드의 중복을 피하고 유연성을 향상시킬 수 있다.

## 고민한점 🤔
1. `class vs struct`
- `Queue` 타입과 `LinkedList` 타입을 초반에는 class로 구현했었습니다. 하지만 `Sequence`, `IteratorProtocol` 프로토콜을 채택해서 구현하는 과정에서, `next()` 메서드가 호출 될 때, 다음 노드를 가르키는 `currentNode`가 다시 원래 head를 가르키지 않고, 남아있는 것을 확인했습니다.
- class가 아닌, struct 타입으로 변경해서 해결했습니다.
 
2. `Queue vs LinkedList`
- 현재 `Queue`에 구현해야하는 필수 기능들이 `Enqueue`, `Dequeue`, `Clear`, `Peek`, `isEmpty`이 있는데, LinkedList를 구현하다보니 `Queue`에 구현해야 할 기능들을 모두 `LinkedList` 내부에 구현을 해버렸습니다
- 이에, `Queue`와 `LinkedList` 내부에서 꼭 필요한 기능들이 무엇인가를 생각해서 `Queue`내부에 필요한 기능들은 `Queue`내부에서 구현을 해주고 `LinkedList`내부에서 필요한 기능들을 `LinkedList` 내부에 구현을 해줌으로써, 기능을 최대한 나누어 보았습니다.

