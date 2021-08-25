//
//  RemoteDatasourceImpl.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

class RemoteDatasourceImpl: BaseRemoteDataSourceImpl, IRemoteDatasource {
    
    func getCompetitions() -> Observable<CompetitionsResponse> {
        makeAPIRequest(responseType: CompetitionsResponse.self, url: Endpoints.COMPETITIONS)
    }
    
    func getStandings(competitionId: String) -> Observable<StandingsResponse> {
        makeAPIRequest(responseType: StandingsResponse.self, url: Endpoints.STANDINGS(competitionId: competitionId))
    }
    
    func getMatches(competitionId: String) -> Observable<MatchesResponse> {
        makeAPIRequest(responseType: MatchesResponse.self, url: Endpoints.MATCHES(competitionId: competitionId))
    }
    
    func getTeams(competitionId: String) -> Observable<TeamsResponse> {
        makeAPIRequest(responseType: TeamsResponse.self, url: Endpoints.TEAMS(competitionId: competitionId))
    }
    
}
