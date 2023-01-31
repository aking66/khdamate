/************************* Mo’min J.Abusaada *************************/
//
//  ArrayEX.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

extension Array {
    func indexOfObject(object : AnyObject) -> NSInteger {
        return (self as NSArray).index(of: object)
    }
    
    mutating func removeObject<T>(obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
}
