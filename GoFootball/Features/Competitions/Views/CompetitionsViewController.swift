//
//  CompetitionsViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift

class CompetitionsViewController: BaseViewController {

    @IBOutlet weak var competitionsTableView: UITableView!
    
    var viewModel: IGoFootballViewModel!
    override var kViewModel: BaseViewModel { viewModel as! BaseViewModel }
    override var views: [UIView] { [competitionsTableView] }
    
    fileprivate let searchController: UISearchController = {
        UISearchController(searchResultsController: nil).apply {
            $0.dimsBackgroundDuringPresentation = false
        }
    }()
    
    fileprivate var competitionName = ""
    
    override func configureViews() {
        super.configureViews()
        
        title = "Competitions"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupSearchBar()
        
        setupCompetitionsTableView()
        
        viewModel.do {
            $0.emitEmptyCompetitions()
            $0.getCompetitions()
        }
    }
    
    fileprivate func setupCompetitionsTableView() {
        viewModel.competitions.map({ $0.isEmpty }).distinctUntilChanged().bind(to: competitionsTableView.rx.isEmpty(message: "Competitions will be shown here!")).disposed(by: disposeBag)
        viewModel.competitions.bind(to: competitionsTableView.rx.items(cellIdentifier: R.reuseIdentifier.competitionTableViewCell.identifier)) { index, competition, cell in
            
            cell.textLabel?.text = competition.name
            
            cell.animateViewOnTapGesture { [weak self] in
                self?.competitionName = competition.name
                self?.viewModel.getCompetitionDetails(id: competition.id)
            }
            
        }.disposed(by: disposeBag)
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        
        searchController.searchBar.rx.text.orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] text in
                self?.viewModel.filterCompetitions(text: text)
            }.disposed(by: disposeBag)
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeShowCompetitionDetails()
    }
    
    fileprivate func observeShowCompetitionDetails() {
        viewModel.showCompetitionDetails.bind { [weak self] show in
            if show {
                self?.showCompetitionDetails()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showCompetitionDetails() {
        presentViewController(R.storyboard.competitions.competionDetailsViewController()!.apply {
            $0.matches = viewModel.competitionMatches
            $0.standings = viewModel.standings
            $0.teams = viewModel.teams
            $0.competitionName = competitionName
        })
    }
    
}
