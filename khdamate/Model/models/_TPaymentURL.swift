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

public enum TPaymentURLAttributes: String {
   case pk_i_id
   case url
}



public class _TPaymentURL: NSManagedObject {
   public class var entityName: String {
      return "TPaymentURL"
   }

   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var url: String?


   static let rKmapping : RKEntityMapping = {
        var TPaymentURLMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TPaymentURL.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TPaymentURLMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",
                "url":"url",

            ])
        TPaymentURLMapping?.identificationAttributes = ["pk_i_id"]
        return TPaymentURLMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["url"] = url


        return dictionary
    }

    func toNonDBObject() -> TPaymentURLObject {
       let obj = TPaymentURLObject()
       obj.pk_i_id = self.pk_i_id
       obj.url = self.url

       return obj
    }
    public override var description: String{
        var description: String = "<TPaymentURL: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"url\" : \(url != nil ? "\"\(url?.description ?? "nil")\"" : "\(url?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentURL?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentURL, right: _TPaymentURL) -> Bool {
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
    static func demoObject()-> TPaymentURL?{
        let obj = TPaymentURL.mr_createEntity()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.url = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentURL]{
        var arr = [TPaymentURL]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TPaymentURL.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TPaymentURLObject: NSObject {
   public class var entityName: String {
      return "TPaymentURLObject"
   }

   @objc public var pk_i_id: NSNumber?
   @objc public var url: String?


   static let rKmapping : RKObjectMapping = {
        var TPaymentURLObjectMapping = RKObjectMapping(for: TPaymentURLObject.classForCoder())
        TPaymentURLObjectMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",
                "url":"url",

            ])
        return TPaymentURLObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["url"] = url


        return dictionary
    }

    public override var description: String{
        var description: String = "<TPaymentURLObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"url\" : \(url != nil ? "\"\(url?.description ?? "nil")\"" : "\(url?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentURLObject?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentURLObject, right: _TPaymentURLObject) -> Bool {
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
    static func demoObject()-> TPaymentURLObject{
        let obj = TPaymentURLObject()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.url = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentURLObject]{
        var arr = [TPaymentURLObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TPaymentURLObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TPaymentURLObject: NSObject,NSCoding,NSCopying {
    @objc public var pk_i_id: NSNumber?
    @objc public var url: String?


    init(fromDictionary dictionary: NSDictionary){
        pk_i_id = dictionary.value(forKeyPath: "pk_i_id") as? NSNumber
        url = dictionary.value(forKeyPath: "url") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["url"] = url


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        pk_i_id = aDecoder.decodeObject(forKey:"pk_i_id") as? NSNumber
        url = aDecoder.decodeObject(forKey:"url") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "pk_i_id")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TPaymentURLObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TPaymentURLObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"url\" : \(url != nil ? "\"\(url?.description ?? "nil")\"" : "\(url?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentURLObject?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentURLObject, right: _TPaymentURLObject) -> Bool {
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
    static func demoObject()-> TPaymentURLObject{
        let obj = TPaymentURLObject(fromDictionary: ["":""])
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.url = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentURLObject]{
        var arr = [TPaymentURLObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TPaymentURLObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
