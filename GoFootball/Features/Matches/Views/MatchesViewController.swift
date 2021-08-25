//
//  MatchesViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class MatchesViewController: BaseViewController {

    @IBOutlet weak var matchesTableView: UITableView!
    
    var viewModel: IGoFootballViewModel!
    override var kViewModel: BaseViewModel { viewModel as! BaseViewModel }
    
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "EPL Matches"
        
        setupMatchesTableView()
        
        viewModel.do {
            $0.emitEmptyDefaultMatches()
            $0.getDefaultMatches()
        }
    }
    
    fileprivate func setupMatchesTableView() {
        viewModel.defaultMatches.map({ $0.isEmpty }).distinctUntilChanged().bind(to: matchesTableView.rx.isEmpty(message: "Matches will be shown here!")).disposed(by: disposeBag)
        viewModel.defaultMatches.bind(to: matchesTableView.rx.items(cellIdentifier: R.reuseIdentifier.matchTableViewCell.identifier, cellType: MatchTableViewCell.self)) { index, item, cell in
            
            cell.matchView.setup(with: item)
            
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }
    
}
