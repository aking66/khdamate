//
//  WalkthroughViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 03/10/2021.
//

import UIKit
import FSPagerView
import EZSwiftExtensions

class WalkthroughViewController: UIViewController {

    @IBOutlet weak var viewContaner: customMaskUIView!
    
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pagerControl: FSPageControl!
    var sliderArray = [TWalkthroughObject](){
        didSet{
            self.pagerView.reloadData()
        }
    }
    var walkThroughObjects: [TWalkthroughObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSlider()
        self.fetchData()
    }
    
    func fetchData() {
        let request = ConstantsRequest(.getWalkthrough)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.walkThroughObjects = result.walkthrough
            self.setupView()
        }
    }
    
    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        guard let walkThroughObjects = walkThroughObjects else {
            return
        }
        self.sliderArray = walkThroughObjects
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        UserProfile.sharedInstance.b_walkthrough_show = NSNumber(value: true)
        AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
    }
}

extension WalkthroughViewController:FSPagerViewDelegate,FSPagerViewDataSource {
    func setupSlider() {
        self.pagerView.dataSource = self
        self.pagerView.delegate = self
        self.pagerView.register(UINib(nibName: WalkthroughCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: WalkthroughCollectionViewCell.className)
        self.pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        self.pagerView.isInfinite = true
        self.pagerView.automaticSlidingInterval = 3.0
        
        self.pagerControl.numberOfPages = self.sliderArray.count
        self.pagerControl.itemSpacing = 12
        self.pagerControl.contentHorizontalAlignment = .center
        self.pagerControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.pagerControl.setImage("ic_walkthrough_dot".image_, for: .normal)
        self.pagerControl.setImage("ic_walkthrough_selected".image_, for: .selected)
        
    }
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pagerControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pagerControl.currentPage = pagerView.currentIndex
        
    }
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        self.pagerControl.numberOfPages = self.sliderArray.count
        return self.sliderArray.count
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        
    }
    
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: WalkthroughCollectionViewCell.className, at: index) as! WalkthroughCollectionViewCell
        let obj = self.sliderArray[index]
        cell.object = GeneralCollectionViewData(reuseIdentifier: WalkthroughCollectionViewCell.className, object: obj, cellSize: nil)
        cell.configerCell()
        return cell
    }
}
