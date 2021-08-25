//
//  RemoteDataSourceConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 04/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Endpoints {
    
    fileprivate static let BASE_URL = AppConstants.Keys.BASE_URL
    
    static let COMPETITIONS = "\(BASE_URL)competitions"
    
    static func MATCHES(competitionId: String) -> String { "\(COMPETITIONS)/\(competitionId)/matches" }
    
    static func TEAMS(competitionId: String) -> String { "\(COMPETITIONS)/\(competitionId)/teams" }
    
    static func STANDINGS(competitionId: String) -> String { "\(COMPETITIONS)/\(competitionId)/standings" }
    
    struct Inventory {
        
        fileprivate static let _BASE_URL = "\(BASE_URL)inventory/"
        
        static let MAKES = "\(_BASE_URL)make?popular=true"
        
        static let CAR_SEARCH = "\(_BASE_URL)car/search"
        
        static func CAR_DETAILS(id: String) -> String { "\(_BASE_URL)car/\(id)" }
        
        static let CAR_MEDIA = "\(_BASE_URL)car_media"
        
    }
    
}
