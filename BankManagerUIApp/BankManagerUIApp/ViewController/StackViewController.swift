//
//  StackViewController.swift
//  BankManagerUIApp
//
//  Created by 양호준 on 2021/12/30.
// 

import UIKit

class StackViewController: UIViewController {
    //MARK: - Property
    let addClientButton = UIButton()
    let resetButton = UIButton()
    let buttonHorizontalStackView = UIStackView()
    let labelHorizontalStackView = UIStackView()
    let waitingListVerticalStackView = UIStackView()
    let workingListVerticalStackView = UIStackView()
    let workingTimeLabel = UILabel()
    let waitingLabel = UILabel()
    let workingLabel = UILabel()
    var count: Int = 0
    let clients = Clients()
    let clerk = BankClerk()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbuttonHorizontalStackView()
        setupWorkingTimeLabel()
        setupLabeeHorizontalStackView()
        setupVerticalStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let bankManager = BankManager(clients: clients, clerk: clerk)
        let totalClientCount = bankManager.operateBankSystem()
        
        presentWaitingList(totalClientCount: totalClientCount)
    }
    
    //MARK: - Method
    func presentWaitingList(totalClientCount: Int) {
        for clientNumber in 1...totalClientCount {
            let recentClientTaskType = clients.informTaskType()
            guard let taskType = recentClientTaskType else {
                return
            }

            let clientInformationView = CustomView()
            clientInformationView.setupLabelText(clientNumber: clientNumber.description, taskType: taskType.koreanName)
            waitingListVerticalStackView.addArrangedSubview(clientInformationView)
        }
    }
    
    func setupbuttonHorizontalStackView() {
        setupStackView(stackView: buttonHorizontalStackView, axis: .horizontal)
        setupButton(button: addClientButton, title: Button.addClientButtonTitle, color: .systemBlue)
        setupButton(button: resetButton, title: Button.resetButton, color: .systemRed)
        setupButtonHorizontalStackViewAutoLayout()
        addClientButton.addTarget(self, action: #selector(self.touchUpAddClientButton(_:)), for: .touchUpInside)
    }
    
    func setupLabeeHorizontalStackView() {
        setupLabel(label: waitingLabel, backgroundColor: .systemGreen, text: Label.waiting)
        setupLabel(label: workingLabel, backgroundColor: .systemIndigo, text: Label.working)
        setupStackView(stackView: labelHorizontalStackView, axis: .horizontal)
        setupLabelHorizontalStackViewConstraint()
    }
    
    func setupVerticalStackView() {
        setupStackView(stackView: waitingListVerticalStackView, axis: .vertical)
        setupStackView(stackView: workingListVerticalStackView, axis: .vertical)
        setupWaitingListVerticalStackViewConstraint()
        setupWorkingListVerticalStackViewConstraint()
    }
}

//MARK: - UIMethod
extension StackViewController {
    func setupButton(button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        buttonHorizontalStackView.addArrangedSubview(button)
    }
    
    func setupLabel(label: UILabel, backgroundColor: UIColor, text: String) {
        label.backgroundColor = backgroundColor
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        labelHorizontalStackView.addArrangedSubview(label)
    }
    
    func setupButtonHorizontalStackViewAutoLayout() {
        buttonHorizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        buttonHorizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        buttonHorizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        buttonHorizontalStackView.distribution = .fillEqually
    }
    
    func setupLabelHorizontalStackViewConstraint() {
        labelHorizontalStackView.topAnchor.constraint(equalTo: workingTimeLabel.bottomAnchor, constant: 10).isActive = true
        labelHorizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        labelHorizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        labelHorizontalStackView.distribution = .fillEqually
    }
    
    func setupWaitingListVerticalStackViewConstraint() {
        waitingListVerticalStackView.topAnchor.constraint(equalTo: labelHorizontalStackView.bottomAnchor, constant: 5).isActive = true
        waitingListVerticalStackView.leadingAnchor.constraint(equalTo: waitingLabel.leadingAnchor).isActive = true
        waitingListVerticalStackView.trailingAnchor.constraint(equalTo: waitingLabel.trailingAnchor).isActive = true
        waitingListVerticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
    }
    
    func setupWorkingListVerticalStackViewConstraint() {
        workingListVerticalStackView.topAnchor.constraint(equalTo: labelHorizontalStackView.bottomAnchor, constant: 5).isActive = true
        workingListVerticalStackView.leadingAnchor.constraint(equalTo: workingLabel.leadingAnchor).isActive = true
        workingListVerticalStackView.trailingAnchor.constraint(equalTo: workingLabel.trailingAnchor).isActive = true
        workingListVerticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
        workingListVerticalStackView.distribution = .fillEqually
        workingListVerticalStackView.spacing = 7
    }
    
    func setupStackView(stackView: UIStackView , axis: NSLayoutConstraint.Axis) {
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    func setupWorkingTimeLabel() {
        let initialTime = makeFormattedTime(minute: .zero, second: .zero, millisecond: .zero)
        view.addSubview(workingTimeLabel)
        workingTimeLabel.topAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor, constant: 10).isActive = true
        workingTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        workingTimeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        workingTimeLabel.heightAnchor.constraint(equalTo: buttonHorizontalStackView.heightAnchor).isActive = true
        workingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        workingTimeLabel.textAlignment = .center
        workingTimeLabel.text = "\(Label.workingTime)\(initialTime)"
    }
}

//MARK: - IBAction
extension StackViewController {
    @IBAction func touchUpAddClientButton(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
        
        (1...Button.addedNumber).forEach { clientIdentifier in
            let clientInformationView = CustomView()
            clientInformationView.setupLabelText(clientNumber: clientIdentifier.description, taskType: "타입")
            waitingListVerticalStackView.addArrangedSubview(clientInformationView)
        }
    }
}

//MARK: - Timer
extension StackViewController {
    @objc func timeCounter() {
        count += 1
        let (minute, second, millisecond) = convertTime(milliseconds: count)
        let formattedTime = makeFormattedTime(minute: minute, second: second, millisecond: millisecond)
        workingTimeLabel.text = "\(Label.workingTime)\(formattedTime)"
    }
    
    func convertTime(milliseconds: Int) -> (Int, Int, Int) {
        let minute = (milliseconds / 1000) / 60
        let second = (milliseconds / 1000) % 60
        let millisecond = milliseconds % 1000
        
        return (minute, second, millisecond)
    }
    
    func makeFormattedTime(minute: Int, second: Int, millisecond: Int) -> String {
        let formattedMinute = String(format: "%02d", minute)
        let formattedSecond = String(format: "%02d", second)
        let formattedMillisecond = String(format: "%003d", millisecond)
        let formattedTime = "\(formattedMinute) : \(formattedSecond) : \(formattedMillisecond)"
        
        return formattedTime
    }
}
