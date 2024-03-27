//
//  Double+rounded.swift
//  
//
//  Created by Danny, Prism on 3/22/24.
//

import Foundation

extension Double {
    func rounded(toPlaces: Int) -> Double {
        let divisor = pow(10.0, Double(toPlaces))
        return (self * divisor).rounded() / divisor
    }
}
