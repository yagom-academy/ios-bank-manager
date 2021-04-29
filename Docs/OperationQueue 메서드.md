### addOperation(_:)

- 연산 객체(Operation Object)를 대기열(Queue)에 추가합니다.

```swift
 func addOperation(_ op: Operation)
```

### addOperations(_:waitUntilFinished:)

- 연산 객체(Operation Object) 배열을 대기열(Queue)에 추가합니다.

```swift
func addOperations(_ ops: [Operation], waitUntilFinished wait: Bool)
```

### addOperation(_:)

- 전달한 클로저를 연산 객체(Operation Object)에 감싸서 대기열(Queue)에 추가합니다.

```swift
func addOperation(_ block: @escaping () -> Void)
```

### cancelAllOperations()

- 대기 중이거나 실행 중인 모든 연산(Operation)을 취소합니다.

```swift
func cancelAllOperations()
```

### waitUntilAllOperationsAreFinished()

- 대기 중인 모든 연산(Operation)과 실행 중인 연산(Operation)이 모두 완료될 때까지 현재 스레드로의 접근을 차단합니다.

```swift
 func waitUntilAllOperationsAreFinished()
```
