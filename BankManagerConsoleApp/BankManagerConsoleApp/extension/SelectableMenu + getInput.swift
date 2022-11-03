//
//  SelectableMenu+getInput.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/03.
//

extension SelectableMenu {
    
    func getInput() -> String? {
        guard let input = readLine(), ["1","2"].contains(input) else {
            return nil
        }
        
        return input
    }
}
