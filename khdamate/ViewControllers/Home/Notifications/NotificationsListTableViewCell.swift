/************************* Mo’min J.Abusaada *************************/
//
//  NotificationsListTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 02/11/2021.
//

import UIKit
import CloudKit

class NotificationsListTableViewCell : GeneralTableViewCell {
    
    enum NotificationType: String {
    case chat
    case offer
    case order
        
        var image: UIImage {
            switch self {
            case .chat:
                return "ic_notification_chat".image_ ?? UIImage()
            case .offer:
                return "ic_notification_inovice".image_ ?? UIImage()
            case .order:
                return "ic_notification_new_offer".image_ ?? UIImage()
            }
        }
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!

    var type: NotificationType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TNotificationObject
        self.type =  NotificationType(rawValue: obj.category ?? "")
        self.img.image = type?.image
        self.img.imageTintColor = "#0096B4".color_
        self.lblTitle.text = obj.notification_body
        self.lblSubTitle.text = obj.date_time?.dateString(customFormat: "MM-dd-yyyy hh:mm:ss")
    }
    
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
    }
    
}
