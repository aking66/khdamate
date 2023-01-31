//
//  ChatImageTableViewCell.swift
//  khdamate
//
//  Created by Yaser on 01/02/2022.
//

import UIKit
import MWPhotoBrowser

class ChatImageTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var imge: UIImageView!
    @IBOutlet weak var stackViewContaner: UIStackView!
    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var LayoutConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var LayoutConstraintLeft: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        let objOrder = (self.parentVC as? ChatOrderViewController)?.chatOrderObject
        self.imge.sd_setImage_(urlString: obj.value ?? "")
//        self.imgUser.sd_setImage_(urlString: objOrder?.customer?.photo ?? "")
//        self.imgServiceProvider.sd_setImage_(urlString: objOrder?.service_provider?.photo ?? "")
        if obj.my_messsage?.boolValue == true {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopRightCorner, radius: 10)
            self.stackViewContaner.alignment = .trailing
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 1000)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 250)
        } else {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopLeftCorner, radius: 10)
            self.stackViewContaner.alignment = .leading
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 250)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 1000)
        }
    }
    
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    @IBAction func btnEnlarge(_ sender: Any) {
        let obj = self.object.object as! TChatObject
        if let parent = self.parentVC as? ChatOrderViewController {
            parent.photos = []
            parent.photos.append(MWPhoto(url: URL(string: obj.value ?? "")))
            let browser = MWPhotoBrowser()
            
            browser.displayActionButton = true
            browser.displayNavArrows = false
            browser.displaySelectionButtons = false
            browser.zoomPhotosToFill = false
            browser.alwaysShowControls = false
            browser.enableGrid = true
            browser.startOnGrid = false
            browser.autoPlayOnAppear = false
            browser.delegate = parent
            browser.setCurrentPhotoIndex(UInt(0))
            let navigationController = UINavigationController(rootViewController: browser)
            self.parentVC.present(navigationController, animated: true, completion: nil)
        }
    }
}
