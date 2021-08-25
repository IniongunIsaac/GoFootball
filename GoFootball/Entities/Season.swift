//
//  Season.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
}
