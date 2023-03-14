//
//  ButtonStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//
import UIKit

class ButtonStackView: UIStackView {
    
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpButtonStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let addClientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    private func setUpButtonStackView() {
        self.addArrangedSubview(resetButton)
        self.addArrangedSubview(addClientsButton)
    }

}
