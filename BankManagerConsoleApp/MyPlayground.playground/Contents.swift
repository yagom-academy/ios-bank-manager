import Foundation

var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

DispatchQueue.global().async {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("야곰: \(card) 카드를 뽑았습니다!")
    }
}

DispatchQueue.global().async {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("노루: \(card) 카드를 뽑았습니다!")
    }
}

DispatchQueue.global().async {
    for _ in 1...3 {
        let card = cards.removeFirst()
        print("오동나무: \(card) 카드를 뽑았습니다!")
    }
}
