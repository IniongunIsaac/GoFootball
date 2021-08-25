//
//  Competition.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Competition: Codable {
    let id: Int
    let area: Area
    let name: String
    let code, plan: String?
    let lastUpdated: String
}
