//
//  UITableView.swift
//  khdamate
//
//  Created by Yaser on 18/12/2021.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib(NibName: String) {
        self.register(UINib(nibName: NibName, bundle: nil), forCellReuseIdentifier: NibName)
    }
}
