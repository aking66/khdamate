//
//  CustomTextField.swift
//  Pro Service
//
//  Created by Yaser on 26/11/2021.
//

import Foundation
import UIKit

class CustomTextField: UIView {
    
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgICON: UIImageView!
    
    @IBInspectable var localized: String? {
        set {
            txtField.localized = newValue
            lblTitle.localized = newValue
        } get {
            return txtField.localized?.localize_
        }
    }
    
    @IBInspectable var backgroundColor_: UIColor? {
        set {
            viewBackground.backgroundColor = newValue ?? .white
        }
        get {
            return viewBackground.backgroundColor
        }
    }
    
    @IBInspectable var txtFieldColor_: UIColor? {
        set {
            txtField.textColor = newValue ?? .white
        }
        get {
            return txtField.backgroundColor
        }
    }
    
    @IBInspectable var lblTitleColor_: UIColor? {
        set {
            lblTitle.textColor = newValue ?? .white
        }
        get {
            return lblTitle.backgroundColor
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        set {
            txtField.placeHolderColor = newValue ?? .white
        }
        get {
            return txtField.placeHolderColor
        }
    }
    
    @IBInspectable var borderColor_: UIColor? {
        set {
            viewBackground.layer.borderColor = (newValue ?? .white).cgColor
            viewBackground.layer.borderWidth = 0.5
        }
        get {
            return viewBackground.backgroundColor
        }
    }
    
    @IBInspectable var icon: UIImage? {
        set {
            imgICON.image = newValue
        }
        get {
            return imgICON.image
        }
    }
    
    @IBInspectable var isHideTitle: Bool {
        set {
            lblTitle.isHidden = newValue
            //imgICON.isHidden = !newValue
        }
        get {
            return lblTitle.isHidden
        }
    }
    
    @IBInspectable var isSecureText: Bool = false {
        willSet {
            txtField.isSecureTextEntry = newValue
            txtField.placeholder = "********"
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            txtField.keyboardType = keyboardType
        }
    }
    
    var text: String? {
        set {
            txtField.text = newValue
        }
        get {
            return txtField.text
        }
    }
    
    var placeholder: String? {
        set {
            txtField.placeholder = newValue
        }
        get {
            return txtField.placeholder
        }
    }
    
//    @IBInspectable var isHideICON: Bool {
//        set {
//            imgICON.isHidden = newValue
//        }
//        get {
//            return imgICON.isHidden
//        }
//    }
    
    var isValidateValue: Bool {
        return txtField.isValidateValue()
    }
    
    var isValidateEmail: Bool {
        return txtField.isvalidateEmail()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureXib()
    }
    
    private func configureXib() {
        Bundle.main.loadNibNamed("CustomTextField", owner: self, options: [:])
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtField.delegate = self
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.viewBackground.layer.borderColor = "#F5C316".color_.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.viewBackground.layer.borderColor = "#E2E2E2".color_.cgColor
    }
}
