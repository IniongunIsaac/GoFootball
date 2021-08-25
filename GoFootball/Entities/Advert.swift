//
//  Advert.swift
//  Spottr
//
//  Created by Isaac Iniongun on 25/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct SpotOpportunity: Codable {
    let id, categoryID, offering, advertDescription: String
    let url: String
    let fromDate, toDate: AdvertDate
    let type, priority, userID: String
    let location: Location
    let isActive: Int
    let updatedAt, createdAt: String
    let user: User
    let category: Category
    let images: [Any]
    let distance: Distance
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case categoryID = "category_id"
        case offering
        case advertDescription = "description"
        case url
        case fromDate = "from_date"
        case toDate = "to_date"
        case type, priority
        case userID = "user_id"
        case location
        case isActive = "is_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case user, category, images, distance
    }
}
