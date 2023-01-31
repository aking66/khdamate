/************************* Mo’min J.Abusaada *************************/
//
//  UIImageViewEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
//    func setImageFromURL(urlString: String?, placeholderImage: UIImage? = KDefaultImageName.image_){
//        if let url = URL(string: (urlString ?? GlobalConstants.APIUrl).addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") {
//            MWImageCacheConfig.default.diskCacheClass = MWDiskCache.self
//            self.mw_imageIndicator = MWWebImageActivityIndicator.gray
//            self.mw_setImage(with: url, placeholderImage: placeholderImage)
//        } else if let url = URL.init(string: urlString ?? GlobalConstants.APIUrl) {
//            MWImageCacheConfig.default.diskCacheClass = MWDiskCache.self
//            self.mw_imageIndicator = MWWebImageActivityIndicator.gray
//            self.mw_setImage(with: url, placeholderImage: placeholderImage)
//        }
//    }
    
    func sd_setImage_(urlString:String,placeholderImage:UIImage? = UIImage(named: KDefaultImageName),completedBlock: SDWebImageCompletionBlock? = nil){
        self.setIndicatorStyle(.gray)
        self.setShowActivityIndicator(true)
        self.sd_setImage(with: URL(string: urlString ), placeholderImage: placeholderImage, options: .refreshCached) { (image, err, type, url) in
            completedBlock?(image, err,type,url)
        }
    }
    
    
    @IBInspectable
    var localizedImg: String? {
        get {
            return UserDefaults.standard.value(forKey: "localizedImg IMG-\(self.hash)") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey:"localizedImg IMG-\(self.hash)")
            UserDefaults.standard.synchronize()
            self.image = UIImage(named: newValue?.localize_ ?? "")
        }
    }
    @IBInspectable var imageTintColor: UIColor {
        get {
            return self.tintColor
        }
        set {
            let image = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = image
            self.tintColor = newValue
        }
    }
}
