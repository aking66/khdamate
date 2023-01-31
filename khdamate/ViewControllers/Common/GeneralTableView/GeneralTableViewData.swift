/************************* Mo’min J.Abusaada *************************/
//
//  GeneralTableViewData.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

class GeneralTableViewData: NSObject {
    
    var rowHeight: NSNumber?
    var reuseIdentifier: String = ""
    var object: Any?
    init(reuseIdentifier: String, object: Any?, rowHeight:NSNumber?) {
        self.reuseIdentifier = reuseIdentifier
        self.object = object
        self.rowHeight = rowHeight
        super.init()
    }
}
