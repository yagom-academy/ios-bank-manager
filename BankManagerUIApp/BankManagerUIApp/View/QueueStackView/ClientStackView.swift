//
//  DoingTaskClientStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class ClientStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpDoingTaskClientStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .center
    }
  
    private func setUpDoingTaskClientStackView() {
        let clientLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "1 - 예금"
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            
            return label
        }()
        
        self.addArrangedSubview(clientLabel)
    }
}


