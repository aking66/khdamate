/************************* Mo’min J.Abusaada *************************/
//
//  URLEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import MobileCoreServices

extension URL {
    func getImage() -> UIImage {
      //  var image: UIImage = nil
        if let imageFromCache = imageCache.object(forKey: self.absoluteString as NSString){
           // self.contentMode =  .scaleAspectFill

            return imageFromCache
        }
        
        if let imageData = try? Data(contentsOf: self) {
            if let image = UIImage(data: imageData) {
                imageCache.setObject(image, forKey: self.absoluteString as NSString)
                return(image)
            }
        }
        return UIImage(named: "demo_1-1") ?? UIImage()
    }
    
    func MIMEType() -> String? {
        if !(self.pathExtension.isEmpty) {
            let UTIRef = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, self.pathExtension as CFString, nil)
            let UTI = UTIRef?.takeUnretainedValue()
            UTIRef?.release()
            
            let MIMETypeRef = UTTypeCopyPreferredTagWithClass(UTI!, kUTTagClassMIMEType)
            if MIMETypeRef != nil
            {
                let MIMEType = MIMETypeRef?.takeUnretainedValue()
                MIMETypeRef?.release()
                return MIMEType! as String
            }
        }
        return nil
    }
}

extension NSURL {
    func MIMEType() -> String? {
        if !((self.pathExtension?.isEmpty)!) {
            let UTIRef = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, self.pathExtension! as CFString, nil)
            let UTI = UTIRef?.takeUnretainedValue()
            UTIRef?.release()
            
            let MIMETypeRef = UTTypeCopyPreferredTagWithClass(UTI!, kUTTagClassMIMEType)
            if MIMETypeRef != nil
            {
                let MIMEType = MIMETypeRef?.takeUnretainedValue()
                MIMETypeRef?.release()
                return MIMEType! as String
            }
        }
        return nil
    }
}
