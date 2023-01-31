//
//  IQDropDownTextFieldExtensions.swift
//  khdamate
//
//  Created by Yaser on 11/12/2021.
//

import Foundation
import IQDropDownTextField

extension IQDropDownTextField {
    func setXYFrameANDBoundsZero() {
        var rect = CGRect()
        rect.size.width = self.frame.size.width
        rect.size.height = self.frame.size.height
        rect.origin.x = 0
        rect.origin.y = 0
        if #available(iOS 13.4, *) {
            self.dateTimePicker.preferredDatePickerStyle = .wheels
            self.datePicker.preferredDatePickerStyle = .wheels
            self.timePicker.preferredDatePickerStyle = .wheels
        }
        self.frame = rect
        self.pickerView.frame = rect
        self.pickerView.bounds = rect
        self.optionalItemText = "IQDropDownTextField_optionalItemText".localize_
        self.textAlignment = UserProfile.sharedInstance.isRTL() ? .right : .left
    }
    
    func date(format: String = "yyyy-MM-dd", localIdentifier: String = "en-us") {
        self.setXYFrameANDBoundsZero()
        self.datePickerMode = .date
        self.datePicker.minimumDate = Date()
        self.dropDownMode = .datePicker
        self.dateFormatter?.locale = Locale(identifier: "en-us")
        self.dateFormatter?.dateFormat = format
        self.datePicker.locale = Locale(identifier: "en-us")
        self.datePicker.calendar = Calendar(identifier: .gregorian)
        self.dateFormatter?.calendar = Calendar(identifier: .gregorian)
    }
    
    func time(format: String = "h:mm a", localIdentifier: String = "en-us") {
        self.setXYFrameANDBoundsZero()
        self.datePickerMode = .time
        self.dropDownMode = .timePicker
        self.timePicker.locale = Locale(identifier: localIdentifier)
        self.timeFormatter?.dateFormat = format
        self.timePicker.locale = Locale(identifier: localIdentifier)
        self.timePicker.calendar = Calendar(identifier: .gregorian)
        self.timeFormatter?.calendar = Calendar(identifier: .gregorian)
    }
    
    func dateTime(format: String = "yyyy-MM-dd HH:mm:ss", localIdentifier: String = "en-us") {
        self.setXYFrameANDBoundsZero()
        self.datePickerMode = .dateAndTime
        self.dropDownMode = .dateTimePicker
        self.dateTimeFormatter?.locale = Locale(identifier: localIdentifier)
        self.dateTimeFormatter?.dateFormat = format
        self.dateTimePicker.locale = Locale(identifier: localIdentifier)
        self.dateTimePicker.calendar = Calendar(identifier: .gregorian)
        self.dateTimeFormatter?.calendar = Calendar(identifier: .gregorian)
    }
}
