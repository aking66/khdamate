/************************* Mo’min J.Abusaada *************************/
//
//  StringEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension String {
    func getImage() -> UIImage {
      //  var image: UIImage = nil
        if let imageFromCache = imageCache.object(forKey: self as NSString){
           // self.contentMode =  .scaleAspectFill

            return imageFromCache
        }
        
        if let imageURL = URL(string: self) {
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    imageCache.setObject(image, forKey: self as NSString)
                return(image)
                }
            }
        }
        return UIImage(named: "demo_1-1") ?? UIImage()
    }
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    func heightForWithFont(font: UIFont, width: CGFloat, insets: UIEdgeInsets) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0,width: width + insets.left + insets.right,height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        
        label.sizeToFit()
        return label.frame.height + insets.top + insets.bottom
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    mutating func stripHTML() -> String {
        self = self.replacingOccurrences(of: "&ndash;", with: "-")
        self = self.replacingOccurrences(of: "&nbsp;", with: " ")
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map { result.range(at: $0).location != NSNotFound
                ? nsString.substring(with: result.range(at: $0))
                : ""
            }
        }
    }
    
    func URLEncodedString() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    }
    func isEmptyOrWhiteSpace()->Bool{
        let str = self
        return (str ?? "").replacingOccurrences(of: " ", with: "").count == 0
    }
    var localize_ : String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(with variables: CVarArg...) -> String {
        return String(format: self.localize_, arguments: variables)
    }
    func  toDate( dateFormat format  : String) -> Date
    {
        let dateFormatter = NSDate.commonDateFormatter
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self)
        {
            return date
        }
        print("Invalid arguments ! Returning Current Date . ")
        return Date()
    }
    
    func toDictionary() -> Dictionary<String, Any> {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                return jsonDictionary ?? [:]
            } catch {
                return [:]
            }
        }
        return [:]
    }
    var removeWhiteSpaceAndArabicNumbers : String{
        return self.replacingOccurrences(of: " ", with: "").removeArabicNumbers
    }
    var removeArabicNumbers : String{
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    func html(font: UIFont? = UIFont(name: AppFontName.regular, size: 13),isWKWebView:Bool = false)-> String {
        var html = ""
        if isWKWebView == true {
            html = """
            <html dir="\(UserProfile.sharedInstance.isRTL() ? "rtl" : "ltr")">
            <head>
            <link rel="stylesheet" type="text/css" href="webView.css">
            <meta name="viewport" content="initial-scale=1.0" />
            </head>
            <body>
            \(self)
            </body>
            </html>
            """
        }else{
            html = """
            <html dir=\"\(UserProfile.sharedInstance.isRTL() ? "rtl" : "ltr")\"><head>
            <meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'><meta name='theme-color' content='#000000'><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' /><meta name='theme-color' content='#5A9C14'><meta name='msapplication-navbutton-color' content='#5A9C14'><meta name='apple-mobile-web-app-status-bar-style' content='#5A9C14'><link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'><style>:root,* {font-family: \(font?.fontName ?? "inherit");font-size: \(font?.pointSize ?? 20)px;color: rgb(114, 114, 114);text-align: justify;-webkit-user-select: none;user-select: none;}
            <style>
            html{color:#000;background:#FFF}body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{margin:0;padding:0}table{border-collapse:collapse;border-spacing:0}fieldset,img{border:0}address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal}ol,ul{list-style:none}caption,th{text-align:left}h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal}q:before,q:after{content:''}abbr,acronym{border:0;font-variant:normal}sup{vertical-align:text-top}sub{vertical-align:text-bottom}input,textarea,select{font-family:inherit;font-size:inherit;font-weight:inherit;*font-size:100%}legend{color:#000}#yui3-css-stamp.cssreset{display:none}
            body{
            font-family: \(font?.fontName ?? "inherit"); font-size:medium !important;text-align:justify;
            }
            p{padding:10px 10px}
            iframe, embed{
            width:80% !important;
            height:auto !important;
            }
            img{
            max-width:95% !important;
            height:auto !important;
            margin-right: auto !important;
            margin-left: auto !important;
            }
            </style></head><body>
            \(self)
            </body></html>
            """
        }
        return html
    }
    var image_ : UIImage? {
        return UIImage(named: self)
    }
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    var color_: UIColor {
        return UIColor(named: self) ?? UIColor.hexColor(hex: self)
    }
    func queryURL(params: [String: String]) -> String {
        var components = URLComponents(string: self)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value) }
        return components?.url?.absoluteString ?? self
    }
    
    var html: String {
        let str = """
        <html dir=\"\(UserProfile.sharedInstance.isRTL() ? "rtl" : "ltr")\">
        <meta charset='utf-8'>
        <style>
        body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{margin:0;padding:20}
        table{border-collapse:collapse;border-spacing:0}
        fieldset,img{border:0}
        html{
        background-color: #F4F5FB !important}
        address,caption,cite,code,dfn,em,strong,th,ol,ul{list-style:none}
        caption,th{text-align:left}
        q:before,q:after{content:''}abbr,acronym{border:0}
        sup{vertical-align:text-top}sub{vertical-align:text-bottom}
        font-weight:inherit;*font-size:30px}#yui3-css-stamp.cssreset{display:none}
        body{
        background-color: #F4F5FB !important;
        font-size:30pt !important;text-align:justify;
        text-align:justify;
        }
        p {
            padding:10px 10px
        }
        iframe, embed {
        width:80% !important;
        height:auto !important;
        }
        img{
        max-width:95% !important;
        height:auto !important;
        margin-right: auto !important;
        margin-left: auto !important;
        }
        </style>
        <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        </head>
        <body>
        \(self)
        </body>
        """
        return str
    }
    
    
    var htmlAr: String {
        let str = """
        <html dir=\"\(UserProfile.sharedInstance.isRTL() ? "rtl" : "ltr")\">
        <meta charset='utf-8'>
        <style>
        body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{margin:0;padding:20}
        table{border-collapse:collapse;border-spacing:0}
        fieldset,img{border:0}
        html{
        background-color: #F4F5FB !important}
        address,caption,cite,code,dfn,em,strong,th,ol,ul{list-style:none}
        caption,th{text-align:left}
        q:before,q:after{content:''}abbr,acronym{border:0}
        sup{vertical-align:text-top}sub{vertical-align:text-bottom}
        font-weight:inherit;*font-size:30px}#yui3-css-stamp.cssreset{display:none}
        body{
        background-color: #F4F5FB !important;
        font-size:30pt !important;text-align:justify;
        text-align:justify;
        }
        p {
            padding:10px 10px
        }
        iframe, embed {
        width:80% !important;
        height:auto !important;
        }
        img{
        max-width:95% !important;
        height:auto !important;
        margin-right: auto !important;
        margin-left: auto !important;
        }
        </style>
        <head>
        <link rel="stylesheet" type="text/css" href="styleAR.css">
        </head>
        <body>
        \(self)
        </body>
        """
        return str
    }
}
