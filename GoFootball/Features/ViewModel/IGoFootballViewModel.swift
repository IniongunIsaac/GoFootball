//
//  IGoFootballViewModel.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IGoFootballViewModel: Scopable {
    
    var defaultMatches: PublishSubject<[Match]> { get }
    
    var competitions: PublishSubject<[Competition]> { get }
    
    var standings: [Table] { get set }
    
    var teams: [Team] { get set }
    
    var competitionMatches: [Match] { get set }
    
    var showCompetitionDetails: PublishSubject<Bool> { get }
    
    func getDefaultMatches()
    
    func emitEmptyDefaultMatches()
    
    func emitEmptyCompetitions()
    
    func getCompetitions()
    
    func filterCompetitions(text: String)
    
    func getCompetitionDetails(id: Int)
    
}
