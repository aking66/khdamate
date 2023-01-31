//
//  TProvider+CoreDataProperties.swift
//  
//
//  Created by Ahmed ios on 27/11/2022.
//
//

import Foundation
import CoreData


extension TProvider {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TProvider> {
        return NSFetchRequest<TProvider>(entityName: "TProvider")
    }

    @NSManaged public var pk_i_id: NSNumber?
    @NSManaged public var image_url: String?
    @NSManaged public var rate: NSNumber?
    @NSManaged public var name: String?

}
