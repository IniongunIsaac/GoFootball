//
//  Table.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Table: Codable, Scopable {
    let position: Int
    let team: Team
    let playedGames: Int
    let form: String?
    let won, draw, lost, points: Int
    let goalsFor, goalsAgainst, goalDifference: Int
}
