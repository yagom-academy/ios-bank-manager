//
//  DoingTaskScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskScrollView: UIScrollView {
    let taskClientStackView = TaskClientStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTaskScrollView()
        configureConstraint()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpTaskScrollView() {
        self.addSubview(taskClientStackView)
        self.isScrollEnabled = false
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            taskClientStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            taskClientStackView.topAnchor.constraint(equalTo: self.topAnchor),
            taskClientStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            taskClientStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            taskClientStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
