import UIKit

class ClientInformationLabel: UILabel {
    
    let waitingNumber: Int
    
    init(waitingNumber: Int, bankTask: BankTask) {
        self.waitingNumber = waitingNumber
        super.init(frame: CGRect.zero)
        self.textAlignment = .center
        self.text = "\(waitingNumber) - \(bankTask)"
        switch bankTask {
        case .deposit:
            self.textColor = .black
        case .loan:
            self.textColor = .purple
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
