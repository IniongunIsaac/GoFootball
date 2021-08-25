//
//  GoFootballViewModelImpl.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

class GoFootballViewModelImpl: BaseViewModel, IGoFootballViewModel {
    
    var defaultMatches: PublishSubject<[Match]> = PublishSubject()
    var competitions: PublishSubject<[Competition]> = PublishSubject()
    fileprivate var competitionsList = [Competition]()
    var standings: [Table] = []
    var teams: [Team] = []
    var competitionMatches: [Match] = []
    var showCompetitionDetails: PublishSubject<Bool> = PublishSubject()
    
    fileprivate let remoteDatasource: IRemoteDatasource
    
    init(remoteDatasource: IRemoteDatasource) {
        self.remoteDatasource = remoteDatasource
    }
    
    func getDefaultMatches() {
        subscribe(remoteDatasource.getMatches(competitionId: "PL"), success: { [weak self] matchesRes in
            self?.defaultMatches.onNext(matchesRes.matches)
        })
    }
    
    func emitEmptyDefaultMatches() {
        defaultMatches.onNext([])
    }
    
    func emitEmptyCompetitions() {
        competitions.onNext([])
    }
    
    func getCompetitions() {
        subscribe(remoteDatasource.getCompetitions(), success: { [weak self] competitionsRes in
            self?.competitionsList = competitionsRes.competitions
            self?.competitions.onNext(competitionsRes.competitions)
        })
    }
    
    func filterCompetitions(text: String) {
        if text.isEmpty {
            competitions.onNext(competitionsList)
        } else {
            competitions.onNext(competitionsList.filter { $0.name.insensitiveContains(text) })
        }
    }
    
    func getCompetitionDetails(id: Int) {
        subscribe(
            Observable.zip(
                remoteDatasource.getMatches(competitionId: id.string),
                remoteDatasource.getStandings(competitionId: id.string),
                remoteDatasource.getTeams(competitionId: id.string)),
            errorMessage: "Subscription might be required to view details of this competition, please try another competition!",
            success: { [weak self] matchesRes, standingsRes, teamsRes in
                self?.competitionMatches = matchesRes.matches
                self?.standings = standingsRes.standings.first?.table ?? []
                self?.teams = teamsRes.teams
                self?.showCompetitionDetails.onNext(true)
            }
        )
    }
    
}
