//
//  SelectableMenu+getInput.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/03.
//

extension SelectableMenu {
    
    func getInput() -> String? {
        let menuSelection: [String] = [
            MenuSelection.first.rawValue,
            MenuSelection.second.rawValue
        ]
        
        guard let input = readLine(),
                  menuSelection.contains(input) else {
            return nil
        }
        
        return input
    }
}
