import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private let bankManager = BankManager()
    private var customerNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        let customers = self.bankManager.createCustomerQueue()
//        DispatchQueue.main.async {
//            self.setCustomerLabel(customers: customers)
//        }
        
        setCustomerLabel(customers: customers)
        customerNumber = bankManager.manageBank(customers: customers)
        mainView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonDidTapped(_:)), for: .touchUpInside)
    }
    
    @objc func addCustomerButtonDidTapped(_ sender: UIButton) {
        let customers = bankManager.addCustomerQueue(lastCustomer: customerNumber)
        setCustomerLabel(customers: customers)
        customerNumber += 10
    }

    func setCustomerLabel(customers: Queue<Customer>) {
        for customer in customers.returnList() {
            
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
    }
}

