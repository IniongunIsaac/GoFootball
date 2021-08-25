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
    
    func getDefaultMatches()
    
    func emitEmptyDefaultMatches()
    
}
