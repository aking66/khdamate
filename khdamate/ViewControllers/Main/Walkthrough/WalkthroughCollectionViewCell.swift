/************************* Mo’min J.Abusaada *************************/
//
//  WalkthroughCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 03/10/2021.
//

import UIKit

class WalkthroughCollectionViewCell : GeneralCollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configerCell() {
        let obj = self.object.object as! TWalkthroughObject
        self.img.sd_setImage_(urlString: obj.photo ?? "")
//        self.img.image = "ic_walkthrough_img".image_
        self.lblTitle.text = obj.title
        self.lblDescription.text = obj.text
    }
    override func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
        
    }
}
