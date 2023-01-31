//
//  PhoneFormattedTextField.swift
//  PhoneNumberFormatter
//
//  Created by Sergey Shatunov on 8/20/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

/**
 UITextField subclass to handle phone numbers formats
*/
public class PhoneFormattedTextField: UITextField {

    private let formatProxy: FormattedTextFieldDelegate
    private let formatter: PhoneFormatter

    /**
     Use is to configure format properties
     */
    public let config: ConfigurationRepo

    /**
     If you have a predictive input enabled.
     Default is true.
     */
    public var hasPredictiveInput: Bool {
        set {
            formatProxy.hasPredictiveInput = newValue
        }
        get {
            return formatProxy.hasPredictiveInput
        }
    }

    /**
     Prefix for all formats
     */
    public var prefix: String? {
        set {
            formatProxy.prefix = newValue
            self.text = newValue
        }
        get {
            return formatProxy.prefix
        }
    }

    public override init(frame: CGRect) {
        config =  ConfigurationRepo()
        formatter = PhoneFormatter(config: config)
        formatProxy = FormattedTextFieldDelegate(formatter: formatter)
        super.init(frame: frame)

        super.delegate = formatProxy
        self.keyboardType = .numberPad
    }

    public required init?(coder aDecoder: NSCoder) {
        config =  ConfigurationRepo()
        formatter = PhoneFormatter(config: config)
        formatProxy = FormattedTextFieldDelegate(formatter: formatter)
        super.init(coder: aDecoder)

        super.delegate = formatProxy
        self.keyboardType = .numberPad
    }

    override public var delegate: UITextFieldDelegate? {
        get {
            return formatProxy.userDelegate
        }
        set {
            formatProxy.userDelegate = newValue
        }
    }

    /**
     Block is called on text change
     */
    public var textDidChangeBlock:((_ textField: UITextField?) -> Void)? {
        get {
            return formatProxy.textDidChangeBlock
        }
        set {
            formatProxy.textDidChangeBlock = newValue
        }
    }

    /**
     Return phone number without format. Ex: 89201235678
     */
    public func phoneNumber() -> String? {
        return formatter.digitOnlyString(text: self.text)?.removeArabicNumbers
    }

    /**
     Return phone number without format and prefix
     */
    public func phoneNumberWithoutPrefix() -> String? {
        if var current = self.text, let prefixString = self.prefix, current.hasPrefix(prefixString) {
            current.removeFirst(prefixString.count)
            return formatter.digitOnlyString(text: current)?.removeArabicNumbers
        } else {
            return formatter.digitOnlyString(text: self.text)?.removeArabicNumbers
        }
    }

    public var formattedText: String? {
        get {
            return self.text?.removeArabicNumbers
        }

        set {
            if let value = newValue {
                let result = formatter.formatText(text: value, prefix: prefix)
                self.text = result.text.removeArabicNumbers
            } else {
                self.text = ""
            }

            self.textDidChangeBlock?(self)
            self.sendActions(for: .valueChanged)
        }
    }
}

extension String {
    var removeArabicNumbers : String{
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
}
