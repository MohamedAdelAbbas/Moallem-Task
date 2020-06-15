//
//  HomeVC.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class HomeVC: UIViewController {
    
    @IBOutlet private weak var subjectCollectionView: UICollectionView!
    @IBOutlet private weak var videoCollectionView: UICollectionView!
    fileprivate let subjectTypeIdentifier = "SubjectCollectionViewCell"
    fileprivate let videoCellIdentifier = "VideoCollectionViewCell"
    final var navBar: UINavigationBar{
        return self.navigationController!.navigationBar
    }
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavController()
        collectionViewsConfig()
        
        
    }
    
    func setupNavController(){
        // Customize the navigation bar
        
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.barStyle = UIBarStyle.default
        navBar.prefersLargeTitles = false
        
        // MARK: right Button
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "menu2"),
            style: .done, target: self,
            action: #selector(rightSideBarButtonItemTapped(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "tintColor")
        
        
        let title = "Moallem"
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Helvetica-Bold", size: 31)!,
            .foregroundColor : UIColor(named: "tintColor")!
        ]
        let leftBarBtnItem = UIBarButtonItem(title: title, style: .done, target: self, action: nil)
        leftBarBtnItem.setTitleTextAttributes(titleAttributes, for: .normal)
        navBar.topItem?.leftBarButtonItem = leftBarBtnItem
        
    }
    @objc func rightSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        
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

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: 111, height: 153)
        }
        return CGSize(width: 175, height: 126)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == videoCollectionView {
            collectionView.deselectItem(at: indexPath, animated: true)
            playVideo(at: indexPath)
            
        }
    }
    
    
    func playVideo(at indexPath: IndexPath){
        // let selectedVideo = videoDB[indexPath.row]
        let videoPath = Bundle.main.path(forResource: "Demo 1", ofType: "mp4")
        let videoPathURl = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURl)
        playerViewController.player = player
        self.present(playerViewController, animated: true, completion: nil)
    }
    
    
    
    
}
