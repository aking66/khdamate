//
//  AgendaViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 23/11/2021.
//

import UIKit
import FSCalendar

class AgendaViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.registerNib(NibName: "CalenderOrderTableViewCell")
        }
    }
    var calendarOrders: [TCalendarObject]?
    var ordersInMonth: [TOrderObject]?
    var didFetch = false
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.addNavigationBG()
        self.getDataFromServer()
    }
    
    func setupView() {
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getDataFromServer() {
//        self.tableView.clearData(true)
//        for _ in 0...5 {
//            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: HomeProviderTableViewCell.className_, object: nil, rowHeight: nil))
//        }
//        self.tableView.reloadData()
        
//        let date = Date()
//        let monthString = date.month.string
//        calendarOrders = []
//        let request = OrderRequest(.getOrdersByMonth)
//        request.month = monthString
//        self.tableView.isPullToRefreshEnabled = true
//        self.tableView.isLoadMoreEnabled = true
//        self.tableView.ofRequest(request)
//            .reuseIdentifier(HomeProviderTableViewCell.className_)
//            .handleResponse { (BaseResponse) -> [Any]? in
//                return BaseResponse.orders
//            }.start()
        let date = Date()
        let monthString = date.month.string
        calendarOrders = []
        let request = OrderRequest(.getOrdersByMonth)
        request.month = monthString
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
            self?.ordersInMonth = result.orders
            self?.calendar.reloadData()
            self?.tableView.reloadData()
        }
    }
}

extension AgendaViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let request = OrderRequest(.getOrdersByDate(order_date: self.formatter.string(from: date)))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
            self?.calendarOrders = result.calendarOrders
            self?.tableView.reloadData()
        }
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        calendarOrders = []
        let month = calendar.currentPage.monthAsString()
        let request = OrderRequest(.getOrdersByMonth)
        request.month = month
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
            self?.ordersInMonth = result.orders
            self?.calendar.reloadData()
            self?.tableView.reloadData()
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd"
        // fetchData(calendar)
        let key = self.formatter.string(from: date)
        if let ordersInMonth = ordersInMonth {
            for order in ordersInMonth {
                if key == formatter.string(from: order.order_date as! Date) {
                    return UIColor.orange
                }
            }
        }
        return nil
    }
//    func getColors(date: Date) -> [UIColor]?{
//        return ["#FFB33B".color_,"#00E445".color_,"#C5CEDB".color_]
//    }
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        return 3
//    }
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventSelectionColorsFor date: Date) -> [UIColor]? {
//        return self.getColors(date: date)
//    }
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
//        return self.getColors(date: date)
//    }
}

extension AgendaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return calendarOrders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarOrders?[section].data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalenderOrderTableViewCell", for: indexPath) as! CalenderOrderTableViewCell
        cell.obj = calendarOrders?[indexPath.section]
        cell.configerCell(parentViewController: self, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CalenderOrderTableViewCell {
            cell.didSelect(indexPath: indexPath as NSIndexPath)
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if UserProfile.sharedInstance.isRTL() {
//            return calendarOrders?[section].status_name_trans
//        } else {
//            return calendarOrders?[section].status_name?.capitalized
//        }
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .white
        if UserProfile.sharedInstance.isRTL() {
        let label = UILabel(frame: CGRect(x: -50, y: 7, width: view.frame.size.width, height: 25))
            label.text = calendarOrders?[section].status_name_trans
            label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
            label.font = label.font.withSize(14)
            returnedView.addSubview(label)
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 7, width: view.frame.size.width, height: 25))
            label.text = calendarOrders?[section].status_name?.capitalized
            label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
            label.font = label.font.withSize(14)
            returnedView.addSubview(label)
        }
        
        return returnedView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

extension UIViewController {
    func presentPopUp(_ view: UIView,_ direction:UIPopoverArrowDirection? = nil) {
        self.modalPresentationStyle = .popover
        self.popoverPresentationController?.permittedArrowDirections =  direction ?? UIPopoverArrowDirection.up
        self.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        self.popoverPresentationController?.sourceView = view  // button
        self.popoverPresentationController?.sourceRect = view.bounds
        AppDelegate.sharedInstance.rootNavigationController.present(self, animated: true, completion: nil);
    }
}

extension Date {
    func monthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MM")
        return df.string(from: self)
    }
}
