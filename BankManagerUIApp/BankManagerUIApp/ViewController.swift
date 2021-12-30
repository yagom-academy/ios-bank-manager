import UIKit

class ViewController: UIViewController {
    var backgroundStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundStackView()
        setUPButtonStackView()
        setUPTimerStackView()
        setUPNotifyStackView()
    }
}

extension ViewController {
    private func setUpBackgroundStackView() {
        view.addSubview(backgroundStackView)
        backgroundStackView.axis = .vertical
        backgroundStackView.backgroundColor = .brown
        
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setUPButtonStackView() {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.backgroundColor = .yellow
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
        timerStackView.backgroundColor = .blue
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
    
    private func setUPNotifyStackView() {
        let notifyStackView = UIStackView()
        notifyStackView.backgroundColor = .blue
        notifyStackView.axis = .horizontal
        notifyStackView.distribution = .fillEqually
        backgroundStackView.addArrangedSubview(notifyStackView)
        
        let waitingLabel = UILabel()
        waitingLabel.text = "대기중"
        waitingLabel.font = .preferredFont(forTextStyle: .title2) 
        waitingLabel.textAlignment = .center
        waitingLabel.textColor = .white
        waitingLabel.backgroundColor = .systemGreen
        
        let workingLabel = UILabel()
        workingLabel.text = "업무중"
        workingLabel.font = .preferredFont(forTextStyle: .title2) 
        workingLabel.textAlignment = .center
        workingLabel.textColor = .white
        workingLabel.backgroundColor = .systemPurple
        
        notifyStackView.addArrangedSubview(waitingLabel)
        notifyStackView.addArrangedSubview(workingLabel)
    }
}
