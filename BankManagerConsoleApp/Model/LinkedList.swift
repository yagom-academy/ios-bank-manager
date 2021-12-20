import Foundation

class Node<Element> {
    var value: Element
    var pointer: Node?
    
    init(value: Element) {
        self.value = value
    }
}
