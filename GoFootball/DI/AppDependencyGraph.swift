//
//  AppDependencyGraph.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    public static func setup() {
        
        defaultContainer.register(IRemoteDatasource.self) { _ in RemoteDatasourceImpl() }
        
        defaultContainer.register(IGoFootballViewModel.self) {
            GoFootballViewModelImpl(remoteDatasource: $0.resolve(IRemoteDatasource.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(MatchesViewController.self) { res, cntrl in
            cntrl.viewModel = res.resolve(IGoFootballViewModel.self)
        }
        
        defaultContainer.storyboardInitCompleted(CompetitionsViewController.self) { res, cntrl in
            cntrl.viewModel = res.resolve(IGoFootballViewModel.self)
        }
        
    }
    
}
