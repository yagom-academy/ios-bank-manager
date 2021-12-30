import UIKit

class ViewController: UIViewController {
    var backgroundStackView = UIStackView()
    let waitingListStackView = CustomerListStackView(title: "대기중", color: .systemGreen)
    let workingListStackView = CustomerListStackView(title: "업무중", color: .systemIndigo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundStackView()
        setUPButtonStackView()
        setUPTimerStackView()
        setUpCustomerListStackViews()
        
        // Test Code
        for i in 1...100 {
            let customer = Customer(waitingNumber: i)
            addCustomerLabel(customer: customer)
        }
    }
}

extension ViewController {
    private func setUpBackgroundStackView() {
        view.addSubview(backgroundStackView)
        backgroundStackView.axis = .vertical
        backgroundStackView.spacing = 12
        
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setUPButtonStackView() {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        backgroundStackView.addArrangedSubview(buttonStackView)
        
        let addCustomerButton = UIButton(type: .system)
        addCustomerButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.tintColor = .red
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
    }
    
    private func setUPTimerStackView() {
        let timerStackView = UIStackView()
        timerStackView.axis = .horizontal
        timerStackView.distribution = .fillEqually
        backgroundStackView.addArrangedSubview(timerStackView)
        
        let workingTimeLabel = UILabel()
        workingTimeLabel.text = "업무시간 - "
        workingTimeLabel.font = .preferredFont(forTextStyle: .title3)
        workingTimeLabel.textAlignment = .right
        
        let timerLabel = UILabel()
        timerLabel.text = "00:00:000"
        timerLabel.font = .preferredFont(forTextStyle: .title3)
        
        timerStackView.addArrangedSubview(workingTimeLabel)
        timerStackView.addArrangedSubview(timerLabel)
    }
    
    private func setUpCustomerListStackViews() {
        let customersBackgroundStackView = UIStackView()
        customersBackgroundStackView.axis = .horizontal
        customersBackgroundStackView.distribution = .fillEqually
        customersBackgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.addArrangedSubview(customersBackgroundStackView)
        
        customersBackgroundStackView.addArrangedSubview(waitingListStackView)
        customersBackgroundStackView.addArrangedSubview(workingListStackView)
    }
    
    private func addCustomerLabel(customer: Customer) {
        let number = customer.waitingNumber.description
        let banking = customer.banking.description
        let customerLable = CustomerLabel(number, banking)
        
        waitingListStackView.addCustomerLabel(customerLable)
    }
}
