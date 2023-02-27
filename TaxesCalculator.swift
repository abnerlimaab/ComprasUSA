//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Abner Lima on 26/02/23.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTaxe: Double = 7.0
    var shoppingValue: Double = 0.0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxeValue: Double {
        return shoppingValue * stateTaxe / 100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTaxe) * iof / 100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxe
        
        if usingCreditCard {
            finalValue += iofValue
        }
        
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        
        return formatter.string(for: value)!
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
}
