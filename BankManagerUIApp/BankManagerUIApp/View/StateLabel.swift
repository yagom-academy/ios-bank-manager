//
//  StateLabel.swift
//  BankManagerUIApp
//
//  Created by 이차민 on 2021/12/31.
//

import UIKit

enum WorkState {
    case waiting
    case processing
    
    var description: String {
        switch self {
        case .waiting:
            return "대기중"
        case .processing:
            return "업무중"
        }
    }
    
    var color: UIColor {
        switch self {
        case .waiting:
            return .systemGreen
        case .processing:
            return .systemIndigo
        }
    }
}

class StateLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(state: WorkState) {
        super.init(frame: CGRect.zero)
        self.text = state.description
        self.textColor = .white
        self.textAlignment = .center
        self.backgroundColor = state.color
        self.font = .preferredFont(forTextStyle: .title1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
