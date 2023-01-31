//
//  KHPagination.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHPagination: Codable {

  enum CodingKeys: String, CodingKey {
    case itemsOnPage = "items_on_page"
    case totalPages = "total_pages"
    case totalObjects = "total_objects"
    case perPage = "per_page"
    case currentPage = "current_page"
  }

  var itemsOnPage: Int?
  var totalPages: Int?
  var totalObjects: Int?
  var perPage: Int?
  var currentPage: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(String.self, forKey:.itemsOnPage) {
 itemsOnPage = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.itemsOnPage) {
itemsOnPage = value 
}
    if let value = try? container.decode(String.self, forKey:.totalPages) {
 totalPages = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.totalPages) {
totalPages = value 
}
    if let value = try? container.decode(String.self, forKey:.totalObjects) {
 totalObjects = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.totalObjects) {
totalObjects = value 
}
    if let value = try? container.decode(String.self, forKey:.perPage) {
 perPage = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.perPage) {
perPage = value 
}
    if let value = try? container.decode(String.self, forKey:.currentPage) {
 currentPage = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.currentPage) {
currentPage = value 
}
  }

}
