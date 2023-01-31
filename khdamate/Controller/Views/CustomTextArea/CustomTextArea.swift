//
//  CustomTextArea.swift
//  Pro Service
//
//  Created by Yaser on 26/11/2021.
//

import UIKit

class CustomTextArea: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txtArea: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBackground: UIView!

    @IBInspectable var localized: String? {
        set {
            txtArea.localized = newValue
            lblTitle.localized = newValue
        } get {
            return txtArea.localized?.localize_
        }
    }
    
    @IBInspectable var borderColor_: UIColor? {
        set {
            viewBackground.layer.borderColor = newValue?.cgColor ?? UIColor.white.cgColor
            viewBackground.layer.borderWidth = 0.5
        }
        get {
            return viewBackground.backgroundColor
        }
    }
    
    var text: String? {
        set {
            txtArea.text = newValue
        }
        get {
            return txtArea.text
        }
    }
    
    var placeholder: String? {
        set {
            txtArea.placeholder = newValue
        }
        get {
            return txtArea.placeholder
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
    
    var isValidateValue: Bool {
        return txtArea.isValidateValue()
    }
    
    private var handler: (()->Void)?
    func handlerAction(handler: (()->Void)?) {
        self.handler = handler
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
        Bundle.main.loadNibNamed("CustomTextArea", owner: self, options: [:])
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
        txtArea.delegate = self
    }
}

extension CustomTextArea: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
//        self.viewBackground.layer.borderColor = "#FF6A1E".color_.cgColor
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        handler?()
//        self.viewBackground.layer.borderColor = "#EDEDED".color_.cgColor
    }
}

