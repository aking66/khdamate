/************************* Mo’min J.Abusaada *************************/
//
//  HomeCategoryCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class HomeCategoryCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func configerCell() {
        let obj = self.object.object as! TServiceObject
        self.img.sd_setImage_(urlString: obj.photo ?? "")
        self.lblTitle.text = obj.name
    }
    
    override func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
        let obj = self.object.object as! TServiceObject
        let parVC = (self.parentVC as? HomeSearchViewController)
        if parVC?.screenType == .selection {
          //  parVC?.didSelect?("")
            parVC?.didSelect?(obj)
        } else {
            InitiateInstanceWithPush(vcClass: ServicesListViewController(), storyboard: .home) { vc in
                vc.categoryID = obj.pk_i_id
                vc.categoryName = obj.name
            }
        }
    }
    
    static func cellSize(_ collectionView:UICollectionView) -> CGSize {
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let size = (collectionView.width/2) - flowLayout.minimumInteritemSpacing
        return  CGSize(width: size + (flowLayout.minimumInteritemSpacing/2), height: size)
    }
}
