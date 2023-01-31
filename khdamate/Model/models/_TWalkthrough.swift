/************************* Mo’min J.Abusaada *************************/
// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to  instead.

#if canImport(SwiftRandom)
import SwiftRandom
#endif

#if canImport(RestKit)

import Foundation
import CoreData
import RestKit

public enum TWalkthroughAttributes: String {
   case photo
   case pk_i_id
   case text
   case title
}



public class _TWalkthrough: NSManagedObject {
   public class var entityName: String {
      return "TWalkthrough"
   }

   @objc @NSManaged public var photo: String?
   @objc @NSManaged public var pk_i_id: String?
   @objc @NSManaged public var text: String?
   @objc @NSManaged public var title: String?


   static let rKmapping : RKEntityMapping = {
        var TWalkthroughMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TWalkthrough.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TWalkthroughMapping?.addAttributeMappings(from: [
                "photo":"photo",
                "id":"pk_i_id",
                "text":"text",
                "title":"title",

            ])
        TWalkthroughMapping?.identificationAttributes = ["pk_i_id"]
        return TWalkthroughMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["text"] = text
        dictionary["title"] = title


        return dictionary
    }

    func toNonDBObject() -> TWalkthroughObject {
       let obj = TWalkthroughObject()
       obj.photo = self.photo
       obj.pk_i_id = self.pk_i_id
       obj.text = self.text
       obj.title = self.title

       return obj
    }
    public override var description: String{
        var description: String = "<TWalkthrough: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"text\" : \(text != nil ? "\"\(text?.description ?? "nil")\"" : "\(text?.description ?? "nil")");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TWalkthrough?) -> Bool {
        return self == object
    }
    static func == (left: _TWalkthrough, right: _TWalkthrough) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TWalkthrough?{
        let obj = TWalkthrough.mr_createEntity()
        obj?.photo = Randoms.randomFakeName()
        obj?.pk_i_id = Randoms.randomFakeName()
        obj?.text = Randoms.randomFakeName()
        obj?.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TWalkthrough]{
        var arr = [TWalkthrough]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TWalkthrough.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TWalkthroughObject: NSObject {
   public class var entityName: String {
      return "TWalkthroughObject"
   }

   @objc public var photo: String?
   @objc public var pk_i_id: String?
   @objc public var text: String?
   @objc public var title: String?


   static let rKmapping : RKObjectMapping = {
        var TWalkthroughObjectMapping = RKObjectMapping(for: TWalkthroughObject.classForCoder())
        TWalkthroughObjectMapping?.addAttributeMappings(from: [
                "photo":"photo",
                "id":"pk_i_id",
                "text":"text",
                "title":"title",

            ])
        return TWalkthroughObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["text"] = text
        dictionary["title"] = title


        return dictionary
    }

    public override var description: String{
        var description: String = "<TWalkthroughObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"text\" : \(text != nil ? "\"\(text?.description ?? "nil")\"" : "\(text?.description ?? "nil")");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TWalkthroughObject?) -> Bool {
        return self == object
    }
    static func == (left: _TWalkthroughObject, right: _TWalkthroughObject) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TWalkthroughObject{
        let obj = TWalkthroughObject()
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = Randoms.randomFakeName()
        obj.text = Randoms.randomFakeName()
        obj.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TWalkthroughObject]{
        var arr = [TWalkthroughObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TWalkthroughObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TWalkthroughObject: NSObject,NSCoding,NSCopying {
    @objc public var photo: String?
    @objc public var pk_i_id: String?
    @objc public var text: String?
    @objc public var title: String?


    init(fromDictionary dictionary: NSDictionary){
        photo = dictionary.value(forKeyPath: "photo") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? String
        text = dictionary.value(forKeyPath: "text") as? String
        title = dictionary.value(forKeyPath: "title") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["text"] = text
        dictionary["title"] = title


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        photo = aDecoder.decodeObject(forKey:"photo") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? String
        text = aDecoder.decodeObject(forKey:"text") as? String
        title = aDecoder.decodeObject(forKey:"title") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if text != nil{
            aCoder.encode(text, forKey: "text")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TWalkthroughObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TWalkthroughObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"text\" : \(text != nil ? "\"\(text?.description ?? "nil")\"" : "\(text?.description ?? "nil")");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TWalkthroughObject?) -> Bool {
        return self == object
    }
    static func == (left: _TWalkthroughObject, right: _TWalkthroughObject) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TWalkthroughObject{
        let obj = TWalkthroughObject(fromDictionary: ["":""])
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = Randoms.randomFakeName()
        obj.text = Randoms.randomFakeName()
        obj.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TWalkthroughObject]{
        var arr = [TWalkthroughObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TWalkthroughObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
