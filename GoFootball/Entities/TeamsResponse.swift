//
//  TeamsResponse.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct TeamsResponse: Codable {
    let count: Int
    let filters: AnyStruct
    let competition: Competition
    let season: Season
    let teams: [Team]
}
