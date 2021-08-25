//
//  IRemoteDatasource.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IRemoteDatasource {
    
    func getCompetitions() -> Observable<CompetitionsResponse>
    
    func getStandings(competitionId: String) -> Observable<StandingsResponse>
    
    func getMatches(competitionId: String) -> Observable<MatchesResponse>
    
    func getTeams(competitionId: String) -> Observable<TeamsResponse>
    
}
