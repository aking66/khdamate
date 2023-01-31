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

public enum TTermsAttributes: String {
   case content
   case pk_i_id
   case title
}



public class _TTerms: NSManagedObject {
   public class var entityName: String {
      return "TTerms"
   }

   @objc @NSManaged public var content: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var title: String?


   static let rKmapping : RKEntityMapping = {
        var TTermsMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TTerms.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TTermsMapping?.addAttributeMappings(from: [
                "content":"content",
                "id":"pk_i_id",
                "title":"title",

            ])
        TTermsMapping?.identificationAttributes = ["pk_i_id"]
        return TTermsMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["content"] = content
        dictionary["id"] = pk_i_id
        dictionary["title"] = title


        return dictionary
    }

    func toNonDBObject() -> TTermsObject {
       let obj = TTermsObject()
       obj.content = self.content
       obj.pk_i_id = self.pk_i_id
       obj.title = self.title

       return obj
    }
    public override var description: String{
        var description: String = "<TTerms: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"content\" : \(content != nil ? "\"\(content?.description ?? "nil")\"" : "\(content?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTerms?) -> Bool {
        return self == object
    }
    static func == (left: _TTerms, right: _TTerms) -> Bool {
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
    static func demoObject()-> TTerms?{
        let obj = TTerms.mr_createEntity()
        obj?.content = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TTerms]{
        var arr = [TTerms]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TTerms.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TTermsObject: NSObject {
   public class var entityName: String {
      return "TTermsObject"
   }

   @objc public var content: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var title: String?


   static let rKmapping : RKObjectMapping = {
        var TTermsObjectMapping = RKObjectMapping(for: TTermsObject.classForCoder())
        TTermsObjectMapping?.addAttributeMappings(from: [
                "content":"content",
                "id":"pk_i_id",
                "title":"title",

            ])
        return TTermsObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["content"] = content
        dictionary["id"] = pk_i_id
        dictionary["title"] = title


        return dictionary
    }

    public override var description: String{
        var description: String = "<TTermsObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"content\" : \(content != nil ? "\"\(content?.description ?? "nil")\"" : "\(content?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTermsObject?) -> Bool {
        return self == object
    }
    static func == (left: _TTermsObject, right: _TTermsObject) -> Bool {
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
    static func demoObject()-> TTermsObject{
        let obj = TTermsObject()
        obj.content = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TTermsObject]{
        var arr = [TTermsObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TTermsObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TTermsObject: NSObject,NSCoding,NSCopying {
    @objc public var content: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var title: String?


    init(fromDictionary dictionary: NSDictionary){
        content = dictionary.value(forKeyPath: "content") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        title = dictionary.value(forKeyPath: "title") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["content"] = content
        dictionary["id"] = pk_i_id
        dictionary["title"] = title


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        content = aDecoder.decodeObject(forKey:"content") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        title = aDecoder.decodeObject(forKey:"title") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TTermsObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TTermsObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"content\" : \(content != nil ? "\"\(content?.description ?? "nil")\"" : "\(content?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"title\" : \(title != nil ? "\"\(title?.description ?? "nil")\"" : "\(title?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTermsObject?) -> Bool {
        return self == object
    }
    static func == (left: _TTermsObject, right: _TTermsObject) -> Bool {
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
    static func demoObject()-> TTermsObject{
        let obj = TTermsObject(fromDictionary: ["":""])
        obj.content = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.title = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TTermsObject]{
        var arr = [TTermsObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TTermsObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
