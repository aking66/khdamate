/************************* Mo’min J.Abusaada *************************/
//
//  OrdersTypeCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 02/11/2021.
//

import UIKit

class OrdersTypeCollectionViewCell : GeneralCollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewSelection: roundedView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configerCell() {
        let obj = self.object.object as! OrderListType
        self.lblTitle.text = obj.s_title
        self.viewSelection.alpha = self.isSubObjectSelected == true ? 1 : 0
        self.lblTitle.alpha = self.isSubObjectSelected == true ? 1 : 0.5

    }
    override func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
        
    }
}
