//
//  ChatOrderAttachmentTableViewCell.swift
//  khdamate
//
//  Created by Yaser on 01/02/2022.
//

import UIKit

class ChatOrderAttachmentTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var btnComplete: UIImage!
    @IBOutlet weak var stackViewContaner: UIStackView!
    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var LayoutConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var LayoutConstraintLeft: NSLayoutConstraint!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        if obj.my_messsage?.boolValue == true {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopRightCorner, radius: 10)
            self.lblText.textAlignment = .right
            self.stackViewContaner.alignment = .trailing
            self.viewContaner.backgroundColor = UIColor(named: "#0096B4")
            self.lblText.textColor = .white
            self.imgIcon.imageTintColor = .white
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 1000)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 250)
        } else {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopLeftCorner, radius: 10)
            self.lblText.textAlignment = .left
            self.stackViewContaner.alignment = .leading
            self.viewContaner.backgroundColor = .white
            self.lblText.textColor = UIColor(named: "#0096B4")
            self.imgIcon.imageTintColor = UIColor(named: "#0096B4") ?? UIColor.blue
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
    
    @IBAction func btnComplete(_ sender: Any) {
        DispatchQueue.main.async {
            let obj = self.object.object as! TChatObject
            let url = URL(string: obj.value ?? "")
            let pdfData = try? Data.init(contentsOf: url!)
            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
            let pdfNameFromUrl = "Pro Service File-\(Date().dateToString(customFormat: "ddMMMyyyyHHmmss")).pdf"
            let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
            do {
                try pdfData?.write(to: actualPath, options: .atomic)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                    AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Alert".localize_, message: "File download success".localize_)
                }
                //file is downloaded in app data container, I can find file from x code > devices > MyApp > download Container >This container has the file
            } catch {
                print("Pdf could not be saved")
            }
        }
    }
}

