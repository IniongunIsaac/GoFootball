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
    
    fileprivate let remoteDatasource: IRemoteDatasource
    
    init(remoteDatasource: IRemoteDatasource) {
        self.remoteDatasource = remoteDatasource
    }
    
}
