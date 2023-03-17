//
//  DoingTaskStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskStackView: UIStackView {
    private let doingTaskLabel = DoingTaskLabel()
    let doingTaskScrollView = DoingTaskScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpDoingTaskStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 10
    }
    
    private func setUpDoingTaskStackView() {
        self.addArrangedSubview(doingTaskLabel)
        self.addArrangedSubview(doingTaskScrollView)
    }
}
