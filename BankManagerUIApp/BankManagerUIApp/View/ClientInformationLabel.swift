import UIKit

class ClientInformationLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(watingNumber: Int, bankTask: BankTask) {
        super.init(frame: CGRect.zero)
        self.text = "\(watingNumber) - \(bankTask)"
        switch bankTask {
        case .deposit:
            self.textColor = .black
        case .loan:
            self.textColor = .purple
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
