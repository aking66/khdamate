//
//  HomeViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit
import DateTools
import FSPagerView
import PayFortSDK

class HomeViewController: UIViewController {

    @IBOutlet weak var imgUser: roundedImage!
    @IBOutlet weak var lblHelloWorld: UILabel!
    @IBOutlet weak var higthSlider: NSLayoutConstraint!

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var viewSearch: HomeSearchView!
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pagerControl: FSPageControl!
    @IBOutlet weak var collectionView: GeneralCollectionView!{
        didSet{
            self.collectionView.registerNib(NibName: HomeCategoryCollectionViewCell.className)
        }
    }
    
//    let payFortController = PayFortController(enviroment: .sandBox)
    
    var services = [TServiceObject]()
    var advs = [TAdvertisementObject](){
        didSet{
            self.pagerView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        self.setupSlider()
        self.fetchData()
    }
    
    func fetchData() {
        let request = HomeRequest(.home)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            AppDelegate.sharedInstance.setupFCM(application: UIApplication.shared)
            self.advs = result.advertisements
            self.higthSlider.constant = self.advs.count > 0 ? 150 : 0
            self.services = result.homeServicesObject
            UserProfile.sharedInstance.service_price = result.home?.service_price
            self.setupView()
        }
    }
    
    func setupView() {
        let currentUserPhotoUrl = UserProfile.sharedInstance.currentUserPhotoUrl
        let currentUserName = UserProfile.sharedInstance.currentUserName
        if let img = currentUserPhotoUrl, currentUserPhotoUrl != "http://khadamat.techno2030.com/public/logo.png" {
            self.imgUser.sd_setImage_(urlString: img)
        } else {
            self.imgUser.image = "img_defaultProfile".image_
        }
        
        self.lblUserName.text = currentUserName
        switch NSDate().hour() {
            case 0 ... 12:
                self.lblHelloWorld.text = "Good Morning".localize_
            case 13 ... 17:
                self.lblHelloWorld.text = "Good Afternoon".localize_
            default:
                self.lblHelloWorld.text = "Good Evening".localize_
        }
        
        self.viewSearch.didFinish = { txt in
            InitiateInstanceWithPush(vcClass: HomeSearchViewController(), storyboard: .home) { vc in
            }
        }
        
        self.collectionView.clearData(true)
        for service in services {
            self.collectionView.objects.append(GeneralCollectionViewData(reuseIdentifier: HomeCategoryCollectionViewCell.className, object: service, cellSize: nil))
        }
        self.collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.cellSize(HomeCategoryCollectionViewCell.cellSize(self.collectionView))
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
            vc.routeType = .makeOrder
        }
    }
}

extension HomeViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    fileprivate static let sliderCellID = HomeSliderCollectionViewCell.className
    func setupSlider() {
        self.pagerView.dataSource = self
        self.pagerView.delegate = self
        self.pagerView.register(UINib(nibName: HomeViewController.sliderCellID, bundle: nil), forCellWithReuseIdentifier: HomeViewController.sliderCellID)
        self.pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        self.pagerView.isInfinite = true
        self.pagerView.automaticSlidingInterval = 3.0
        
        self.pagerControl.numberOfPages = self.advs.count
        self.pagerControl.contentHorizontalAlignment = .trailing
        self.pagerControl.setFillColor("#D4D5DD".color_, for: .normal)
        self.pagerControl.setFillColor("#FFB33B".color_, for: .selected)
        
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pagerControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pagerControl.currentPage = pagerView.currentIndex
        
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        self.pagerControl.numberOfPages = self.advs.count
        return self.advs.count
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeViewController.sliderCellID, at: index) as! HomeSliderCollectionViewCell
        let obj = self.advs[index]
        cell.object = GeneralCollectionViewData(reuseIdentifier: HomeViewController.sliderCellID, object: obj, cellSize: nil)
        cell.configerCell()
        return cell
    }
}
class ExtraParam{
    let title: String
    var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
