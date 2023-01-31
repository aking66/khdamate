/************************* Mo’min J.Abusaada *************************/
//
//  OrderDetailsImagesCollectionViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/11/2021.
//

import UIKit
import MWPhotoBrowser

class OrderDetailsImagesCollectionViewCell : GeneralCollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnRemove: roundedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configerCell() {
        if let obj = self.object.object as? String {
        self.img.sd_setImage_(urlString: obj)
        }
        if let obj = self.object.object as? UIImage {
            self.img.image = obj
            }
        
        if let vc = self.parentVC as? OrderDetailsViewController {
            if vc.routeType == .orderDetails || vc.routeType == .makeOffer {
                self.btnRemove.isHidden = true
            } else {
                self.btnRemove.isHidden = false
            }
        }
    }
    
    override func didselect(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, forObject object:GeneralCollectionViewData) {
        self.openPhotoBrowser(indexPath: indexPath)
    }
    
    @IBAction func btnRemove(_ sender: Any) {
        let alertController = UIAlertController(title: "Attention".localize_, message:"alert_delete_image".localize_, preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "OK".localize_, style:.destructive, handler: { (action) in
            self.collectionView.objects.removeObject(self.object)
            self.collectionView.reloadData()
            (self.parentVC as? OrderDetailsViewController)?.checkPhotosCount()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
            
        }))
        self.parentVC?.present(alertController, animated: true, completion: nil)
    }
}

extension OrderDetailsImagesCollectionViewCell :MWPhotoBrowserDelegate{
    func openPhotoBrowser(indexPath: IndexPath) {
            let browser = MWPhotoBrowser(delegate: self)
            browser?.displayActionButton = false
            browser?.displayNavArrows = false
            browser?.displaySelectionButtons = false
            browser?.zoomPhotosToFill = true
            browser?.alwaysShowControls = false
            browser?.enableGrid = true
            browser?.startOnGrid = false
            browser?.reloadData()
            browser?.setCurrentPhotoIndex(UInt(self.indexPath.row))
            self.parentVC.presentVC(UINavigationController(rootViewController: browser!))
    }
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt((self.parentVC as? OrderDetailsViewController)?.imagesToPreview.count ?? 0)
    }
    
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        if index < (self.parentVC as? OrderDetailsViewController)?.imagesToPreview.count ?? 0 {
            return MWPhoto(image: (self.parentVC as? OrderDetailsViewController)?.imagesToPreview[Int(index)])
        }
        return nil
    }
}

