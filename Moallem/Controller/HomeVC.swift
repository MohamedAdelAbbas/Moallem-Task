//
//  HomeVC.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet private weak var subjectCollectionView: UICollectionView!
    @IBOutlet private weak var videoCollectionView: UICollectionView!
    fileprivate let subjectTypeIdentifier = "SubjectCollectionViewCell"
    fileprivate let videoCellIdentifier = "VideoCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavController()
       collectionViewsConfig()
        
        
    }
    
    func setupNavController(){
        // Customize the navigation bar
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(red: 58, green: 175, blue: 68, alpha: 1)
        ]
    }

    
    func collectionViewsConfig(){
        
        subjectCollectionView.delegate = self
        subjectCollectionView.dataSource = self
        subjectCollectionView.register(UINib.init(nibName: subjectTypeIdentifier, bundle: nil), forCellWithReuseIdentifier: subjectTypeIdentifier)
        
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        videoCollectionView.register(UINib.init(nibName: videoCellIdentifier, bundle: nil), forCellWithReuseIdentifier: videoCellIdentifier)
    }
    func goToDetailsVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailstViewController = storyboard.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        self.navigationController?.pushViewController(detailstViewController, animated: true)
    }
    
    
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subjectCollectionView {
            return database.count
        } else {
            return videoDB.count
        }
        //return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == subjectCollectionView {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subjectTypeIdentifier, for: indexPath) as! SubjectCollectionViewCell
            cell.setupCell(model: database[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoCellIdentifier, for: indexPath) as! VideoCollectionViewCell
            cell.setupCell(model: videoDB[indexPath.row])
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == subjectCollectionView {
            return CGSize(width: 100, height: 150)
        }
        return CGSize(width: 175, height: 126)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == videoCollectionView {
            let vc = DetailsVC()
            let selectedVideo = videoDB[indexPath.row]
            vc.modalPresentationStyle = .fullScreen
            vc.video = selectedVideo
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
    
}
