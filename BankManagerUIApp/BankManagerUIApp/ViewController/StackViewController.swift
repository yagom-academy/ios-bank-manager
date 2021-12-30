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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIStackView(stackView: buttonHorizontalStackView, axis: .horizontal)
        setupUIButton(button: addClientButton, title: Button.addClientButtonTitle, color: .systemBlue)
        setupUIButton(button: resetButton, title: Button.resetButton, color: .systemRed)
        setupButtonHorizontalStackViewAutoLayout()
    }
    
    //MARK: - Method
    func setupUIButton(button:UIButton, title: String, color: UIColor) {
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
    
    func setupUIStackView(stackView:UIStackView , axis: NSLayoutConstraint.Axis) {
        buttonHorizontalStackView.axis = axis
        buttonHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    

}

