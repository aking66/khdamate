/************************* Mo’min J.Abusaada *************************/
//
//  HomeSliderCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class HomeSliderCollectionViewCell : GeneralCollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configerCell() {
        if let obj = self.object.object as? TAdvertisementObject {
        self.img.sd_setImage_(urlString: obj.adv_picture_url ?? "")
        self.lblTitle.isHidden = true
        self.lblSubTitle.isHidden = true
        }
    }
    
    override func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
    }
    
    @IBAction func btnAction(_ sender: Any) {
        if let obj = self.object.object as? TAdvertisementObject {
            if obj.type == "internal" {
//                InitiateInstanceWithPush(vcClass: WebViewViewController(), storyboard: .home) { vc in
//                    vc.type = .adv
//                    vc.url = obj.adv_url
//                }
            } else if obj.type == "external" {
                InitiateInstanceWithPush(vcClass: WebViewViewController(), storyboard: .home) { vc in
                    vc.type = .adv
                    vc.url = obj.adv_url
                }
            }
        }
    }
}

