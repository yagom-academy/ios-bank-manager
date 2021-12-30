import UIKit

class CustomerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(_ number: Int, _ banking: String) {
        self.init()
        setUp()
        setUpText(number, banking)
    }
    
    private func setUp() {
        font = .preferredFont(forTextStyle: .title3)
        textAlignment = .center
    }
    
    private func setUpText(_ number: Int, _ banking: String) {
        text = "\(number + 1) - \(banking)"
        if banking.contains("대출") {
            textColor = .systemPurple
        }
    }
}
