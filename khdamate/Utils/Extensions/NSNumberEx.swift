/************************* Mo’min J.Abusaada *************************/
//
//  NSNumberEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

extension NSNumber{
    var formatedNumber: String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = 3
        fmt.decimalSeparator = "."
        fmt.groupingSeparator = ","
        return (fmt.string(from: (self)) ?? "0.0").removeArabicNumbers
    }
}



extension Int {
    var random: Int {
        return self.randomFunc(digits: self)
    }
    var string: String {
        return "\(self)"
    }
    private func randomFunc(digits:Int) -> Int {
        let min = Int(pow(Double(10), Double(digits-1))) - 1
        let max = Int(pow(Double(10), Double(digits))) - 1
        return Int(Range(uncheckedBounds: (min, max)))
    }
    
    init(_ range: Range<Int> ) {
        let delta = range.lowerBound < 0 ? abs(range.lowerBound) : 0
        let min = UInt32(range.lowerBound + delta)
        let max = UInt32(range.upperBound   + delta)
        self.init(Int(min + arc4random_uniform(max - min)) - delta)
    }
}
