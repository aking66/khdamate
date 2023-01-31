//
//  HomeSearchView.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class HomeSearchView: UIView,NibLoadable {

    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBInspectable var isSearchText: Bool = false
    
    var didFinish:((_ text:String?)->Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupFromNib()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.configerView()
    }
    
    func configerView(){
        self.txtSearch.delegate = self
        self.btnSelect.isUserInteractionEnabled = !self.isSearchText
    }
    
    @IBAction func txtEndSearch(_ sender: Any) {
        if (self.txtSearch.text?.count ?? 0) >= 2 || self.txtSearch.text?.count == 0{
            self.didFinish?(self.txtSearch.text)
        }
    }
    
    @IBAction func btnSelect(_ sender: Any) {
            self.didFinish?(nil)
    }
}

extension HomeSearchView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
