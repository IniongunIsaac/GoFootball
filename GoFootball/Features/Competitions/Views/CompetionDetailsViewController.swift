//
//  CompetionDetailsViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import BottomPopup

class CompetionDetailsViewController: BottomPopupViewController {
    
    @IBOutlet weak var competitionNameLabel: UILabel!
    @IBOutlet weak var tabsStackView: UIStackView!
    @IBOutlet weak var standingsView: DetailsTabView!
    @IBOutlet weak var matchesView: DetailsTabView!
    @IBOutlet weak var teamsView: DetailsTabView!
    
    var matches = [Match]()
    var standings = [Table]()
    var teams = [Team]()
    var competitionName = ""
    
    fileprivate var currentlyVisibleViewController: UIViewController?
    
    fileprivate lazy var standingsViewController: StandingsViewController = {
        R.storyboard.competitions.standingsViewController()!.apply {
            $0.standings = standings
        }
    }()
    
    fileprivate lazy var matchesViewController: CompetitionMatchesViewController = {
        R.storyboard.competitions.competitionMatchesViewController()!.apply {
            $0.matches = matches
        }
    }()
    
    fileprivate lazy var teamsViewController: TeamsViewController = {
        R.storyboard.competitions.teamsViewController()!.apply {
            $0.teams = teams
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        competitionNameLabel.text = competitionName
        [standingsView, matchesView, teamsView].addClearBackground()
        
        showDetailsTab(.standings)
        
        standingsView.animateViewOnTapGesture { [weak self] in
            self?.showDetailsTab(.standings)
        }
        
        matchesView.animateViewOnTapGesture { [weak self] in
            self?.showDetailsTab(.matches)
        }
        
        teamsView.animateViewOnTapGesture { [weak self] in
            self?.showDetailsTab(.teams)
        }
    }
    
    fileprivate func showDetailsTab(_ tab: DetailsTab) {
        if let vc = currentlyVisibleViewController {
            remove(asChildViewController: vc)
        }
        
        switch tab {
        case .standings:
            currentlyVisibleViewController = standingsViewController
            standingsView.activate()
            matchesView.activate(false)
            teamsView.activate(false)
            
        case .matches:
            currentlyVisibleViewController = matchesViewController
            standingsView.activate(false)
            matchesView.activate()
            teamsView.activate(false)
            
        case .teams:
            currentlyVisibleViewController = teamsViewController
            standingsView.activate(false)
            matchesView.activate(false)
            teamsView.activate()
        }
        
        showChildViewController(currentlyVisibleViewController!)
    }
    
    fileprivate func showChildViewController(_ viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.anchor(top: tabsStackView.bottomAnchor, paddingTop: 30, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
        
    }
    
    override var popupHeight: CGFloat { height - 100 }
    
    override var popupTopCornerRadius: CGFloat { 20 }

}
