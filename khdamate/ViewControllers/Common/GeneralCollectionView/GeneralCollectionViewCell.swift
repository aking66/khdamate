/************************* Mo’min J.Abusaada *************************/
//
//  GeneralCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit
import FSPagerView

protocol GeneralCollectionViewCellDelegate : NSObjectProtocol {
    func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData)
    func canSelect(objc:Any?)->Bool
}

class GeneralCollectionViewCell: FSPagerViewCell,GeneralCollectionViewCellDelegate {
    
    weak open var collectionView : GeneralCollectionView!
    open var indexPath : IndexPath!
    weak open var parentVC : UIViewController!
    open var object : GeneralCollectionViewData!
    open var isSubObjectSelected : Bool = false
    weak open var delegate: GeneralCollectionViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.delegate = self
    }
    
    func configerCell() {
        
    }
    func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
        
    }
    func canSelect(objc: Any?) -> Bool {
        return true
    }
}
