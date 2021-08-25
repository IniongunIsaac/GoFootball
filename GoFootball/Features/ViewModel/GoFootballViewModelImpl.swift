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
    
}
