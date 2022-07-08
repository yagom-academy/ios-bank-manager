import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private let bankManager = BankManager()
    private var customerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        let customers = bankManager.createCustomerQueue()
        
        setCustomerLabel(customers: customers)
        customerNumber = bankManager.manageBank(customers: customers)
        mainView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonDidTapped(_:)), for: .touchUpInside)
        mainView.clearCustomerButton.addTarget(self, action: #selector(clearCustomerButtonDidTapped), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(transferProcessing(notification:)), name: Notification.Name(rawValue: "process"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(finishProcessing), name: Notification.Name(rawValue: "finish"), object: nil)
    }
    
    @objc func addCustomerButtonDidTapped(_ sender: UIButton) {
        let customers = bankManager.addCustomerQueue(lastCustomer: customerNumber)
        setCustomerLabel(customers: customers)
        customerNumber += 10
    }
    
    @objc func clearCustomerButtonDidTapped(_ sender: UIButton) {
        mainView.waitingStackView.arrangedSubviews.forEach {
            mainView.waitingStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        mainView.processingStackView.arrangedSubviews.forEach {
            mainView.processingStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        customerNumber = 0
    }
    
    @objc func transferProcessing(notification: Notification) {
        guard let customer = notification.object as? Customer else { return }
        
        var text = ""
        
        switch customer.banking {
        case .deposit:
            text = "\(customer.number) - 예금"
        case .loan:
            text = "\(customer.number) - 대출"
        }
        
        DispatchQueue.main.async {
            let customerLabel = self.mainView.waitingStackView.arrangedSubviews.filter {
                let label = $0 as? UILabel
                return label?.text == text
            }
            
            customerLabel.forEach {
                self.mainView.waitingStackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
            
            customerLabel.forEach {
                self.mainView.processingStackView.addArrangedSubview($0)
            }
        }
    }
    
    @objc func finishProcessing(notification: Notification) {
        guard let customer = notification.object as? Customer else { return }
        
        var text = ""
        
        switch customer.banking {
        case .deposit:
            text = "\(customer.number) - 예금"
        case .loan:
            text = "\(customer.number) - 대출"
        }
        
        DispatchQueue.main.async {
            let customerLabel = self.mainView.processingStackView.arrangedSubviews.filter {
                let label = $0 as? UILabel
                return label?.text == text
            }
            
            customerLabel.forEach {
                self.mainView.processingStackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
        }
    }
    
    func setCustomerLabel(customers: Queue<Customer>) {
        for customer in customers.returnList() {
            
            let customerLabel = UILabel()
            var bankingLabel = ""
            
            switch customer.banking {
            case .loan:
                bankingLabel = "\(customer.number) - 대출"
                customerLabel.textColor = .systemPurple
            case .deposit:
                bankingLabel = "\(customer.number) - 예금"
                customerLabel.textColor = .black
            }
            
            customerLabel.translatesAutoresizingMaskIntoConstraints = false
            customerLabel.font = .preferredFont(forTextStyle: .title2)
            customerLabel.textAlignment = .center
            customerLabel.adjustsFontForContentSizeCategory = true
            customerLabel.text = bankingLabel
            
            mainView.waitingStackView.addArrangedSubview(customerLabel)
        }
    }
}

