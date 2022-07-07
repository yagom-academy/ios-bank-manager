import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private let bankManager = BankManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        let customers = self.bankManager.createCustomerQueue()
        
        setCustomerLabel(customers: customers)
        bankManager.manageBank(customers: customers)
    }

    func setCustomerLabel(customers: Queue<Customer>) {
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else { return }
            
            let customerLabel = UILabel()
            var bankingLabel = ""
            
            switch customer.banking {
            case .loan:
                bankingLabel = "대출"
                customerLabel.textColor = .systemPurple
            case .deposit:
                bankingLabel = "예금"
                customerLabel.textColor = .black
            }
            
            customerLabel.translatesAutoresizingMaskIntoConstraints = false
            customerLabel.font = .preferredFont(forTextStyle: .title2)
            customerLabel.textAlignment = .center
            customerLabel.text = "\(customer.number) - " + bankingLabel
            
            mainView.waitingStackView.addArrangedSubview(customerLabel)
        }
        
        mainView.layoutSubviews()
    }

}

