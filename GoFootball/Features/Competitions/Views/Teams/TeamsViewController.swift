//
//  TeamsViewController.swift
//  GoFootball
//
//  Created by Isaac Iniongun on 25/08/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift

class TeamsViewController: UIViewController {
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    var teams = [Team]()
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTeamsCollectionView()
    }
    
    fileprivate func setupTeamsCollectionView() {
        teamsCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        teams.asObservable.map({ $0.isEmpty }).distinctUntilChanged().bind(to: teamsCollectionView.rx.isEmpty(message: "Teams will be shown here!")).disposed(by: disposeBag)
        
        teams.asObservable.bind(to: teamsCollectionView.rx.items(cellIdentifier: R.reuseIdentifier.teamCollectionViewCell.identifier, cellType: TeamCollectionViewCell.self)) { row, team, cell in
            
            cell.configureView(team: team)
            
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }

}

//MARK: - UICollectionViewDelegateFlowLayout
extension TeamsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.width / 3) - 15, height: 120)
    }
    
}
