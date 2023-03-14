//
//  DoingTaskScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskScrollView: UIScrollView {
    let doingTaskContentView = DoingTaskContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpTaskScrollView()
        configureConstraint()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpTaskScrollView() {
        self.addSubview(doingTaskContentView)
    }
    
    private func configureConstraint() {
        
        NSLayoutConstraint.activate([
            doingTaskContentView.topAnchor.constraint(equalTo: self.topAnchor),
            doingTaskContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            doingTaskContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            doingTaskContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            doingTaskContentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            doingTaskContentView.heightAnchor.constraint(equalTo: self.frameLayoutGuide.heightAnchor)

        ])
    }
    
}
