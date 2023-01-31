/************************* Mo’min J.Abusaada *************************/
//
//  DictionaryEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

extension Dictionary where Value: Equatable {
    func KeyForValue(_ val: Value) -> Key? {
        return first(where: { $1 == val })?.0
    }
}
