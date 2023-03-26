//
//  QueueStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//

import UIKit

final class QueueStackView: UIStackView {
    let waitingQueueStackView = WaitingQueueStackView()
    let doingTaskStackView = DoingTaskStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpQueueStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    private func setUpQueueStackView() {
        self.addArrangedSubview(waitingQueueStackView)
        self.addArrangedSubview(doingTaskStackView)
    }
}
