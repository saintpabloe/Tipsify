//
//  CalculatorTipsy.swift
//  Tipsy
//
//  Created by Ranis Sharifullin on 3/22/23.
//

import UIKit

struct CalculatorTipsy {
    var tips: Tipsy?
    
    func getPeople() -> Int? {
        return tips?.people ?? 2
    }
    
    func getTip() -> Int? {
        var formattedTip = Int((tips?.percentTip ?? 0.1) * 100)
        return formattedTip
    }
    
    func getCheckForPerson() -> String? {
        return String(tips?.forEachPersonBill ?? 0.0)
    }
    
    mutating func calculatorTips(bill: Float, percentTip: Float, people: Float) {
        let check = round((( bill + bill * percentTip ) / people) * 100) / 100
        tips = Tipsy(forEachPersonBill: check, people: Int(people), percentTip: percentTip)
        
    }
}
