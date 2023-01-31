/************************* Mo’min J.Abusaada *************************/
//
//  GeneralTableView.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit
import SwiftPullToRefresh
import DZNEmptyDataSet

#if canImport(Alamofire)
import Alamofire
#elseif canImport(RestKit)
import RestKit
#endif

#if canImport(SkeletonView)
import SkeletonView
#endif

enum GeneralTableViewType {
    case list
    case sections
}
enum GeneralTableViewSelectionType {
    case single
    case multi
}

class GeneralTableView: UITableView {
    
    var dataSources = [UITableViewDataSource]()
    var delegates = [UITableViewDelegate]()
    
    var tableViewType : GeneralTableViewType = .list
    
    var rowHeightGlobal : NSNumber?
    var parentVC : UIViewController!
    var objects = [GeneralTableViewData]()
    var objectsOfSections = [(key: Any, value: Array<GeneralTableViewData>)]()
    
    var isPullToRefreshEnabled = false
    var isLoadMoreEnabled = false
    var showLodaerWhileReuqest = false
    
    var emptyDataSetTitle = "No Data To Show".localize_
    var emptyDataSetTitleColor = UIColor.darkGray
    var emptyDataIsVisible = false {
        didSet{
            self.reloadEmptyDataSet()
        }
    }
    
    var selectedObjects = [Any]()
    var primaryKeyOfSelection :String?
    var selectionType: GeneralTableViewSelectionType = .single
    var minimumSelectionCount = 0
    
    private var lastPaginition: Pagination?
    private var currentPage = 1
    private var lastDataCount: NSNumber = NSNumber(value:0)
    
    @IBInspectable var dummyActive: Bool = false
    @IBInspectable var dummyCellID: String = ""
    @IBInspectable var dummyObjectsCount: Int = 0
    
    #if canImport(Alamofire)
    var lastOperation:DataRequest?
    #elseif canImport(RestKit)
    var lastOperation:RKObjectRequestOperation?
    #endif
    
    var tableViewDidScroll: ((_ scrollView: UIScrollView) -> Void)?
    func didDidScroll(_ tableViewDidScroll: @escaping ((_ scrollView: UIScrollView) -> Void)) -> Void {
        self.tableViewDidScroll = tableViewDidScroll
    }
    private var responseHandler: ((_ response: BaseResponse) -> [Any]?)?
    func handleResponse(_ responseHandler: @escaping ((_ response: BaseResponse) -> [Any]?)) -> GeneralTableView {
        self.responseHandler = responseHandler
        return self
    }
    private var willResponseHandler: (() -> Void)?
    func willHandleResponseFunc(_ willResponseHandler: @escaping (() -> Void)) -> GeneralTableView {
        self.willResponseHandler = willResponseHandler
        return self
    }
    private var didResponseHandler: (() -> Void)?
    func didHandleResponseFunc(_ didResponseHandler: @escaping (() -> Void)) -> GeneralTableView {
        self.didResponseHandler = didResponseHandler
        return self
    }
    private var didFinishRequest: (() -> Void)?
    func didFinishRequestFunc(_ didFinishRequest: @escaping (() -> Void)) -> GeneralTableView {
        self.didFinishRequest = didFinishRequest
        return self
    }
    private var willAddObject: ((_ object:Any) -> GeneralTableViewData)?
    func handlerWillAddObject(_ willAddObject: @escaping  ((_ object:Any) -> GeneralTableViewData)) -> GeneralTableView {
        self.willAddObject = willAddObject
        return self
    }
    private var reuseIdentifier: String = ""
    func reuseIdentifier(_ reuseIdentifier: String) -> GeneralTableView {
        self.reuseIdentifier = reuseIdentifier
        return self
    }
    
    private var request: BaseRequest?
    public func ofRequest(_ request: BaseRequest) -> GeneralTableView {
        self.request = request
        return self
    }
    
    private var heightForSections: ((_ section:Int) -> CGFloat)?
    func heightForSectionsFunc(_ heightForSections: @escaping ((_ section:Int) -> CGFloat)) -> GeneralTableView {
        self.heightForSections = heightForSections
        return self
    }
    
    private var viewForHeaderInSection: ((_ section:Int) -> UIView)?
    func viewForHeaderInSectionFunc(_ viewForHeaderInSection: @escaping ((_ section:Int) -> UIView)) -> GeneralTableView {
        self.viewForHeaderInSection = viewForHeaderInSection
        return self
    }
    
    
    private var titleForEmptyDataSet: NSAttributedString?
    func handlerTitleForEmptyDataSet(_ titleForEmptyDataSet: NSAttributedString?) -> GeneralTableView {
        self.titleForEmptyDataSet = titleForEmptyDataSet
        return self
    }
    private var descriptionForEmptyDataSet: NSAttributedString?
    func handlerDescriptionForEmptyDataSet(_ descriptionForEmptyDataSet: NSAttributedString?) -> GeneralTableView {
        self.descriptionForEmptyDataSet = descriptionForEmptyDataSet
        return self
    }
    private var imageForEmptyDataSet: UIImage?
    func handlerImageForEmptyDataSet(_ imageForEmptyDataSet: UIImage?) -> GeneralTableView {
        self.imageForEmptyDataSet = imageForEmptyDataSet
        return self
    }
    private var buttonTitleForEmptyDataSet: NSAttributedString?
    func handlerButtonTitleForEmptyDataSet(_ buttonTitleForEmptyDataSet: NSAttributedString?) -> GeneralTableView {
        self.buttonTitleForEmptyDataSet = buttonTitleForEmptyDataSet
        return self
    }
    private var buttonBackgroundImageForEmptyDataSet: UIImage?
    func handlerButtonBackgroundImageForEmptyDataSet(_ buttonBackgroundImageForEmptyDataSet: UIImage?) -> GeneralTableView {
        self.buttonBackgroundImageForEmptyDataSet = buttonBackgroundImageForEmptyDataSet
        return self
    }
    private var didTabButtonBackgroundForEmptyDataSet: (() -> Void)?
    func didTabButtonBackgroundForEmptyDataSetFunc(_ didTabButtonBackgroundForEmptyDataSet: @escaping (() -> Void)) -> GeneralTableView {
        self.didTabButtonBackgroundForEmptyDataSet = didTabButtonBackgroundForEmptyDataSet
        return self
    }
    private var canEditRowAtIndexPath : ((_ IndexPath:IndexPath) -> Bool)?
    func handlerCanEditRowAt(_ indexPath:@escaping ((_ IndexPath:IndexPath) -> Bool)) -> GeneralTableView {
        self.canEditRowAtIndexPath = indexPath
        return self
    }
    private var commitEditingStyleForRowAt : ((_ editingStyle: UITableViewCell.EditingStyle,_ IndexPath:IndexPath,_ object:GeneralTableViewData) -> Void)?
    func handlerCommitEditingStyleForRowAt(_ indexPath:@escaping ((_ editingStyle: UITableViewCell.EditingStyle,_ IndexPath:IndexPath,_ object:GeneralTableViewData) -> Void)) -> GeneralTableView {
        self.commitEditingStyleForRowAt = indexPath
        return self
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.parentVC = self.getParentViewController()
        self.delegate = self
        self.dataSource = self
        self.emptyDataSetDelegate = self
        self.emptyDataSetSource = self
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if dummyActive == true && dummyCellID.count > 0 && dummyObjectsCount > 0 && self.request == nil {
            self.clearData(true)
            for _ in 0...dummyObjectsCount {
                self.objects.append(GeneralTableViewData(reuseIdentifier: dummyCellID, object: nil, rowHeight: nil))
            }
            self.reloadData()
        }
    }
//    func registerNib(NibName: String) {
//        self.register(UINib(nibName: NibName, bundle: nil), forCellReuseIdentifier: NibName)
//    }
    func updateHeightBaseOnContent(constraint:NSLayoutConstraint) {
        constraint.constant = CGFloat.greatestFiniteMagnitude
        self.reloadData()
        self.layoutIfNeeded()
        constraint.constant = self.contentSize.height
    }
}

//MARK: - DataHelper
extension GeneralTableView {
    func clearData(_ reloadData: Bool = false){
        if self.tableViewType == .sections {
            self.objectsOfSections.removeAll()
        }else{
            self.objects.removeAll()
        }
        lastPaginition = nil
        currentPage = 1
        if reloadData == true {
            self.reloadData()
        }
    }
    func addRemoveSelectedObject(_ object: Any) {
        if self.checkIfObjectExist(object, arr: self.selectedObjects).0 == true{
            if self.minimumSelectionCount == 0 || self.minimumSelectionCount != self.selectedObjects.count {
                let index = self.checkIfObjectExist(object, arr: self.selectedObjects).2
                self.selectedObjects.remove(at: index)
            }
        } else {
            if selectionType == .single {
                self.selectedObjects = [object]
            } else {
                self.selectedObjects.append(object)
            }
        }
        self.reloadData()
    }
}

//MARK: - TableViewDelegate
extension GeneralTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableViewType == .sections ? self.heightForSections?(section) ?? 44 : 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.tableViewType == .sections ? self.viewForHeaderInSection?(section) ?? UIView() : nil
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let value = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row].rowHeight : objects[indexPath.row].rowHeight
        return (value != nil) ? CGFloat((value?.floatValue)!) : UITableView.automaticDimension
    }
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let value = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row].rowHeight : objects[indexPath.row].rowHeight
        return (value != nil) ? CGFloat((value?.floatValue)!) : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row] : objects[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
        if let obb = obj.object ,cell.delegate?.canSelect(objc: obj.object) == true {
            self.addRemoveSelectedObject(obb)
        }
        for del in self.delegates {
            del.tableView?(tableView, didSelectRowAt: indexPath)
        }
        cell.delegate?.didselect(tableView, didSelectRowAt: indexPath, forObject: obj)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableViewDidScroll?(scrollView)
    }
}

//MARK: - TableViewDataSource
extension GeneralTableView : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewType == .sections ? self.objectsOfSections.count : 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.tableViewType == .sections ? self.objectsOfSections[section].value.count : objects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let obj = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row] : objects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: obj.reuseIdentifier, for: indexPath) as! GeneralTableViewCell
        cell.tableView = self
        cell.indexPath = indexPath
        cell.parentVC = self.parentVC
        cell.object = obj
        if let obb = obj.object {
            cell.isSubObjectSelected = self.checkIfObjectExist(obb, arr: self.selectedObjects).0
        }
        cell.configerCell()
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let obj = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row] : objects[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? GeneralTableViewCell {
            return cell.delegate?.tableView(tableView, canEditRowAt: indexPath, forObject: obj) ?? false
        }
        return self.canEditRowAtIndexPath?(indexPath) ?? false
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let obj = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row] : objects[indexPath.row]
        self.commitEditingStyleForRowAt?(editingStyle,indexPath,obj)
        
        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
        cell.delegate?.tableView(tableView, commit: editingStyle, forRowAt: indexPath, forObject: obj)
        
        for dataS in self.dataSources{
            dataS.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
        }
    }
    
}

//MARK: - EmptyDataSet
extension GeneralTableView : DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString {
        let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: UIFont.init(name: AppFontName.regular, size: CGFloat(18.0))!, NSAttributedString.Key.foregroundColor: emptyDataSetTitleColor]
        return self.titleForEmptyDataSet ?? NSAttributedString(string: emptyDataSetTitle, attributes: attributes as? [NSAttributedString.Key : Any])
    }
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return self.descriptionForEmptyDataSet ?? NSAttributedString(string: "")
    }
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return self.imageForEmptyDataSet ?? UIImage()
    }
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return self.emptyDataIsVisible
    }
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        return buttonTitleForEmptyDataSet ?? NSAttributedString(string: "")
    }
    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> UIImage! {
        return buttonBackgroundImageForEmptyDataSet ?? UIImage()
    }
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        self.didTabButtonBackgroundForEmptyDataSet?()
    }
}

//MARK: - Networking
extension GeneralTableView {
    func start() {
        self.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
        self.alwaysBounceVertical = true
        bindPullToRefresh()
        refresh(trigerREfresh: true)
    }
    
    private func stopLoading() {
        if(isPullToRefreshEnabled) {
            self.spr_endRefreshing()
            self.contentInset.top = 0
        }
        self.emptyDataIsVisible = true
    }
    
    private func bindPullToRefresh() {
        if(isPullToRefreshEnabled) {
            self.spr_setIndicatorHeader { [weak self] in
                self?.clearData(true)
                self?.refresh(trigerREfresh: false)
            }
        }
        if(isLoadMoreEnabled) {
            self.spr_setIndicatorFooter { [weak self] in
                self?.loadMore()
            }
        }
    }
    
    func loadMore() {
        #if canImport(Alamofire)
        if(lastPaginition?.i_items_on_page?.intValue == lastDataCount.intValue && lastDataCount.intValue != 0) {
            currentPage = currentPage + 1
        } else if(lastPaginition != nil) {
            self.currentPage = (lastPaginition?.i_current_page?.intValue ?? 1)
        }
        #elseif canImport(RestKit)
        if(lastPaginition?.i_items_on_page == lastDataCount && lastDataCount != 0) {
            currentPage = currentPage + 1
        } else if(lastPaginition != nil) {
            self.currentPage = lastPaginition?.i_current_page as! Int
        }
        #endif
        load(page: currentPage)
    }
    func refresh(trigerREfresh: Bool,refreshAfterClear:Bool = false) {
        if(trigerREfresh && isPullToRefreshEnabled) {
            self.clearData(refreshAfterClear)
            self.spr_beginRefreshing()
        }else{
            load(page: 1)
        }
    }
    func cancelThenRestart(){
        if(lastOperation != nil ){
            #if canImport(RestKit)
            lastOperation?.setCompletionBlockWithSuccess(nil,failure: nil)
            #endif
            lastOperation?.cancel()
        }
        self.clearData(true)
        stopLoading()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +  .milliseconds(350), execute: {
            self.refresh(trigerREfresh: true,refreshAfterClear:true)
        })
    }
    func load(page: Int){
        self.emptyDataIsVisible = false
        if isLoadMoreEnabled {
            #if canImport(Alamofire)
            let request = RequestWrapper.sharedInstance.pagnationRequest(request: self.request!, page: page).didComplete { (op, er) in
                self.stopLoading()
            }
            #elseif canImport(RestKit)
            let request = RequestWrapper.sharedInstance.pagnationRequest(request: self.request!, page: page).didComplete { (op, mp, er) in
                self.stopLoading()
            }
            #endif
            lastOperation = request.executeWithCheckResponse(showLodaer: showLodaerWhileReuqest, showMsg: false, { (response) in
                self.afterResponce(response)
                self.didFinishRequest?()
            })
        }else{
            #if canImport(Alamofire)
            let request = RequestWrapper.sharedInstance.makeRequest(request: self.request!).didComplete { (op, er) in
                self.stopLoading()
            }
            #elseif canImport(RestKit)
            let request = RequestWrapper.sharedInstance.makeRequest(request: self.request!).didComplete { (op, mp, er) in
                self.stopLoading()
            }
            #endif
            lastOperation = request.executeWithCheckResponse(showLodaer: showLodaerWhileReuqest, showMsg: false, { (response) in
                self.afterResponce(response)
                self.didFinishRequest?()
            })
        }
    }
    func afterResponce(_ response:BaseResponse){
        self.lastPaginition = response.pagination
        guard let data = self.responseHandler?(response) else {
            return
        }
        self.lastDataCount = NSNumber(value: data.count)
        for item in data {
            if self.checkIfObjectExist(item).0 == false {
                self.objects.append(self.willAddObject?(item) ?? GeneralTableViewData(reuseIdentifier: self.reuseIdentifier , object: item, rowHeight: self.rowHeightGlobal))
            }
        }
        self.reloadData()
        self.didResponseHandler?()
    }
    func checkIfObjectExist(_ object:Any,arr:[Any]? = nil,removeIfFound:Bool = false) -> (Bool,Any?,Int) {
        let key = self.primaryKeyOfSelection ?? "pk_i_id"
        var found : Any?
        var index = 0
        if arr != nil {
            for obj in arr ?? [] {
                let hasClassMember = (obj as AnyObject).responds(to: Selector((key)))
                let hasObjectClassMember = (object as AnyObject).responds(to: Selector((key)))
                if hasClassMember == true && hasObjectClassMember == true{
                    let valueOfObj = (obj as AnyObject).value(forKey: key)
                    let valueOfobject = (object as AnyObject).value(forKey: key)
                    if (valueOfObj != nil && valueOfobject != nil) {
                        if valueOfObj is NSNumber && valueOfobject is NSNumber && (valueOfObj as! NSNumber).isEqual(to: valueOfobject as! NSNumber){
                            found = obj
                            break
                        }else if (valueOfObj as AnyObject).description == (valueOfobject as AnyObject).description {
                            found = obj
                            break
                        }
                    }else if (obj as AnyObject).value(forKey: key) == nil || (object as AnyObject).value(forKey: key) == nil {
                        found = nil
                    }
                }else if (obj as AnyObject).description == (object as AnyObject).description{
                    found = obj
                    break
                }
                index = index + 1
            }
        }else{
            for obj in self.objects {
                let hasClassMember = (obj.object as AnyObject).responds(to: Selector((key)))
                let hasObjectClassMember = (object as AnyObject).responds(to: Selector((key)))
                if hasClassMember == true && hasObjectClassMember == true {
                    let valueOfObj = (obj.object as AnyObject).value(forKey: key)
                    let valueOfobject = (object as AnyObject).value(forKey: key)
                    if (valueOfObj != nil && valueOfobject != nil) {
                        if valueOfObj is NSNumber && valueOfobject is NSNumber && (valueOfObj as! NSNumber).isEqual(to: valueOfobject as! NSNumber){
                            found = obj
                            break
                        }else if (valueOfObj as AnyObject).description == (valueOfobject as AnyObject).description {
                            found = obj
                            break
                        }
                    }else if valueOfObj == nil || valueOfobject == nil {
                        found = nil
                    }
                }else if (obj as AnyObject).description == (object as AnyObject).description{
                    found = obj
                    break
                }
                index = index + 1
            }
        }
        return (found != nil,found,index)
    }
}
#if canImport(SkeletonView)
//MARK: - SkeletonView
extension GeneralTableView : SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if (self.tableViewType == .sections && self.objectsOfSections.count > 0) || (self.tableViewType == .list && self.objects.count > 0) {
            let obj = self.tableViewType == .sections ? self.objectsOfSections[indexPath.section].value[indexPath.row] : objects[indexPath.row]
            return obj.reuseIdentifier
        }
        return self.reuseIdentifier
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.tableViewType == .sections && self.objectsOfSections.count > 0) || (self.tableViewType == .list && self.objects.count > 0) {
            return self.tableViewType == .sections ? self.objectsOfSections[section].value.count : objects.count
        }else{
            return 0
        }
    }
}
#endif
