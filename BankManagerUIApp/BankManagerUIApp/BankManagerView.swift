//
//  BankManagerView.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
//

import UIKit

final class BankManagerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configureMainStackViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainVerticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonHorizontalStackView, taskTimeLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    lazy var addCustomersButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return button
    }()
    
    lazy var buttonHorizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [addCustomersButton, resetButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var taskTimeLabel: UILabel = {
          let label = UILabel()
          label.text = "업무시간 - 00:00:000"
          label.font = .preferredFont(forTextStyle: .title2)
          label.textAlignment = .center
          return label
      }()

}

//MARK: - Auto Layout Methode
private extension BankManagerView {
    func configureMainStackViewLayout() {
        self.addSubview(mainVerticalStackView)
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
