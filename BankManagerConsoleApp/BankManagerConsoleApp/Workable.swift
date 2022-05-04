//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

protocol Workable: Operation {
    var workType: WorkType { get }
}
