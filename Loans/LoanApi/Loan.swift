//
//  Loan.swift
//  Loans
//
//  Created by Ravil on 08.01.2024.
//

import Foundation

struct Loan: Codable {
    var id: Int
    var amount: String
    var title: String
    var description: String
    var icon: String
    var type: LoanType
    var url: String
}

enum LoanType: String, Codable {
    case card
    case online
    case credit
}
