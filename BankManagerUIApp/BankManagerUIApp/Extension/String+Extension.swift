//
//  String+Extension.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/05.
//

import Foundation

fileprivate extension Constants {
    static let hypen = "-"
    static let errorMessage = "알 수 없는 오류입니다."
}

extension String {
    var waitingNumber: String {
        guard let waitingNumber = self.components(separatedBy: Constants.hypen).first else {
            return Constants.errorMessage
        }
        
        return waitingNumber.trimmingCharacters(in: .whitespaces)
    }
}
