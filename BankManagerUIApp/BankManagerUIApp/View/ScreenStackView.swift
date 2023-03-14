//
//  ScreenStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//
import UIKit

class ScreenStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.axis = .vertical
        self.spacing = 10
        self.distribution = .fill
    }

    let taskTimerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.text = "업무시간 - "
        
        return label
    }()

}
