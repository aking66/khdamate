//
//  Picker.swift
//  Pro Service
//
//  Created by Yaser on 26/11/2021.
//

import Foundation
import UIKit
import IQDropDownTextField

class Picker: UIView {
    
    enum pickerType {
        case date
        case picker
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtPicker: IQDropDownTextField!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgDropDown: UIImageView!
    @IBOutlet weak var imgICON: UIImageView!
    @IBOutlet weak var constraintICON: NSLayoutConstraint!
    
    var type: pickerType = .picker {
        didSet {
            if type == .date {
                txtPicker.date()
            }
        }
    }
    
    @IBInspectable var localized: String? {
        set {
            txtPicker.localized = newValue
            lblTitle.localized = newValue
        }
        get {
            return txtPicker.placeholder
        }
    }
    
    var placeholder: String? {
        set {
            txtPicker.placeholder = newValue
            lblTitle.text = newValue
        }
        get {
            return txtPicker.placeholder
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        set {
            txtPicker.placeHolderColor = newValue ?? .white
        }
        get {
            return txtPicker.placeHolderColor
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
    
    @IBInspectable var backgroundColor_: UIColor? {
        set {
            viewBackground.backgroundColor = newValue ?? .white
        }
        get {
            return viewBackground.backgroundColor
        }
    }
    
    @IBInspectable var isHideTitle: Bool {
        set {
            lblTitle.isHidden = newValue
        }
        get {
            return lblTitle.isHidden
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
    
    @IBInspectable var iconImageColor: UIColor {
        set {
            imgDropDown.imageTintColor = newValue
        }
        get {
            return imgDropDown.tintColor
        }
    }
    
    @IBInspectable var iconDropColor: UIColor {
        set {
            imgICON.imageTintColor = newValue
        }
        get {
            return imgICON.tintColor
        }
    }
    
//    @IBInspectable var isHideDropICON: Bool {
//        set {
//            imgDropDown.isHidden = newValue
//        }
//        get {
//            return imgDropDown.isHidden
//        }
//    }
    
    var selectedItem: String? {
        set {
            self.txtPicker.selectedItem = newValue
            self.valueChanged?(newValue ?? "")
        }
        get {
            return self.txtPicker.selectedItem
        }
    }
    
    var valueChanged: ((String)->())?
    
    @IBInspectable var icon: UIImage? {
        set {
            imgDropDown.image = newValue
        }
        get {
            return imgDropDown.image
        }
    }
    
    var items: [String] = [] {
        didSet {
            self.txtPicker.itemList = items
        }
    }
    
    var index: Int {
        return txtPicker.selectedRow
    }
    
    var selectedDate: Date? = Date() {
        didSet {
            self.txtPicker.date = selectedDate
        }
    }
    
    var isValidateValue: Bool {
        return txtPicker.isValidateValue()
    }
    
    var handler: ((_ item: String?, _ data: Date?)->Void)?
    func handlerFunc(handler_: ((_ item: String?, _ data: Date?)->Void)?) {
        self.handler = handler_
    }
    
    var handlerDone: (()->Void)?
    func handlerDoneFunc(handler_: (()->Void)?) {
        self.handlerDone = handler_
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureXib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtPicker.delegate = self
        self.txtPicker.dataSource = self
        self.txtPicker.setXYFrameANDBoundsZero()
//        self.items = ["one","two","three"]
    }
    
    private func configureXib() {
        Bundle.main.loadNibNamed("Picker", owner: self, options: [:])
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.layoutIfNeeded()
    }
}

extension Picker: IQDropDownTextFieldDelegate, IQDropDownTextFieldDataSource {
    func textField(_ textField: IQDropDownTextField, didSelect date: Date?) {
        self.selectedDate = date
        self.selectedItem = textField.selectedItem
        self.handler?(nil, date)
    }
    
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?) {
        self.selectedItem = item
        self.handler?(item, nil)
    }
}

extension Picker: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.viewBackground.layer.borderColor = "#F5C316".color_.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.viewBackground.layer.borderColor = "#E2E2E2".color_.cgColor
        handlerDone?()
        switch type {
        case .date:
        self.selectedDate = txtPicker.date
        self.selectedItem = txtPicker.selectedItem
//        self.handler?(nil, txtPicker.date)
            break
        case .picker:
        self.selectedItem = txtPicker.selectedItem
//        self.handler?(txtPicker.selectedItem, nil)
            break
        }
    }
}
