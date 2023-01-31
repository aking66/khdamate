/************************* Mo’min J.Abusaada *************************/
//
//  GeneralCollectionViewData.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

class GeneralCollectionViewData: NSObject {
    var reuseIdentifier: String = ""
    var object: Any?
    var cellSize: CGSize?
    init(reuseIdentifier: String, object: Any?,cellSize:CGSize? = nil) {
        self.reuseIdentifier = reuseIdentifier
        self.object = object
        self.cellSize = cellSize
        super.init()
    }
}
