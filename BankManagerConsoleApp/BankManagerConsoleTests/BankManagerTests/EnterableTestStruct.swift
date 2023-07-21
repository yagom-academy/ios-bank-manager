//
//  EnterableTestStruct.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/22.
//

@testable import BankManagerConsoleApp

struct EnterableTestStruct: Enterable {
    var inputValue: String
    
    func enterUserInput() -> String? {
        return inputValue
    }
}
