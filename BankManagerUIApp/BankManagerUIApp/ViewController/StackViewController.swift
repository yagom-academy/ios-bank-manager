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
    let workingTimeLabel = UILabel()
    var count: Int = 0
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIStackView(stackView: buttonHorizontalStackView, axis: .horizontal)
        setupUIButton(button: addClientButton, title: Button.addClientButtonTitle, color: .systemBlue)
        setupUIButton(button: resetButton, title: Button.resetButton, color: .systemRed)
        setupButtonHorizontalStackViewAutoLayout()
        setupWorkingTimeLabel()
        addClientButton.addTarget(self, action: #selector(self.touchUpAddClientButton(_:)), for: .touchUpInside)
    }
    
    //MARK: - Method
    func setupUIButton(button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        buttonHorizontalStackView.addArrangedSubview(button)
    }
    
    func setupButtonHorizontalStackViewAutoLayout() {
        buttonHorizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        buttonHorizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        buttonHorizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        buttonHorizontalStackView.distribution = .fillEqually
    }
    
    func setupUIStackView(stackView: UIStackView , axis: NSLayoutConstraint.Axis) {
        buttonHorizontalStackView.axis = axis
        buttonHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    func setupWorkingTimeLabel() {
        let initialTime = makeFormattedTime(minute: .zero, second: .zero, millisecond: .zero)
        view.addSubview(workingTimeLabel)
        workingTimeLabel.topAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor, constant: 10).isActive = true
        workingTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        workingTimeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        workingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        workingTimeLabel.textAlignment = .center
        workingTimeLabel.text = "\(Label.workingTime)\(initialTime)"
    }
}

//MARK: - IBAction
extension StackViewController {
    @IBAction func touchUpAddClientButton(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
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
