import UIKit

extension UIAlertController {
    
    /// Add a date picker
    ///
    /// - Parameters:
    ///   - mode: date picker mode
    ///   - date: selected date of date picker
    ///   - minimumDate: minimum date of date picker
    ///   - maximumDate: maximum date of date picker
    ///   - action: an action for datePicker value change
    public func addDatePicker(mode: UIDatePickerMode, date: Date?, minimumDate: Date? = nil, maximumDate: Date? = nil,local:NSLocale?,calender:NSCalendar?, action: DatePickerViewController.Action?) {
        let datePicker = DatePickerViewController(mode: mode, date: date, minimumDate: minimumDate, maximumDate: maximumDate, action: action,local:local,calender:calender)
        set(vc: datePicker, height: 216)
    }
}

final public class DatePickerViewController: UIViewController {
    
    public typealias Action = (Date) -> Void
    
    public var action: Action?
    
    fileprivate lazy var datePicker: UIDatePicker = {
        $0.addTarget(self, action: #selector(DatePickerViewController.actionForDatePicker), for: .valueChanged)
        return $0
    }(UIDatePicker())
    
    required public init(mode: UIDatePickerMode, date: Date? = nil, minimumDate: Date? = nil, maximumDate: Date? = nil, action: Action?,local:NSLocale?,calender:NSCalendar?) {
        super.init(nibName: nil, bundle: nil)
        datePicker.datePickerMode = mode
        datePicker.date = date ?? Date()
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        if calender != nil {datePicker.calendar = calender as Calendar!}
        if local != nil {datePicker.locale = local as Locale!}
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        self.action = action
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Log("has deinitialized")
    }
    
    override public func loadView() {
        view = datePicker
        action?(datePicker.date)
    }
    
    @objc func actionForDatePicker() {
        action?(datePicker.date)
    }
    
    public func setDate(_ date: Date) {
        datePicker.setDate(date, animated: true)
    }
}
