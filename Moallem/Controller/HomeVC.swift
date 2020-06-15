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
    // MARK: Outlets
    @IBOutlet private weak var subjectCollectionView: UICollectionView!
    @IBOutlet private weak var videoCollectionView: UICollectionView!
    
    // MARK: Properties
    private let subjectTypeIdentifier = "SubjectCollectionViewCell"
    private let videoCellIdentifier = "VideoCollectionViewCell"
    private var navBar: UINavigationBar{
        return self.navigationController!.navigationBar
    }
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    let Subjects: [Subject] = [
        Subject(title: "Algebra", imageName: "algebra"),
        Subject(title: "Biology", imageName: "biology"),
        Subject(title: "History", imageName: "history"),
        Subject(title: "Physics", imageName: "physics")
    ]
    let videos: [Video] = [
        Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo1", ofType: "mp4")!)),
        Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo1", ofType: "mp4")!)),
        Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo1", ofType: "mp4")!)),
        Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo1", ofType: "mp4")!))
    ]
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavController()
        collectionViewsConfig()
    }
    
    func setupNavController(){
        setupNavBar()
        setupLeftBarBtn()
        setupRightBarBtn()
    }
    // MARK: Self Defined Methods
    
    func setupNavBar(){
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.barStyle = UIBarStyle.default
        navBar.prefersLargeTitles = false
    }
    func setupLeftBarBtn(){
        let title = "Moallem"
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Helvetica-Bold", size: 31)!,
            .foregroundColor : UIColor(named: "tintColor")!
        ]
        let leftBarBtnItem = UIBarButtonItem(title: title, style: .done, target: self, action: nil)
        leftBarBtnItem.setTitleTextAttributes(titleAttributes, for: .normal)
        navBar.topItem?.leftBarButtonItem = leftBarBtnItem
    }
    
    func setupRightBarBtn(){
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "menu2"),
            style: .done, target: self,
            action: #selector(rightSideBarButtonItemTapped(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "tintColor")
    }
    
    @objc func rightSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        print("Menu Bar Button Action")
    }
    
    func collectionViewsConfig(){
        
        subjectCollectionView.delegate = self
        subjectCollectionView.dataSource = self
        subjectCollectionView.register(UINib.init(nibName: subjectTypeIdentifier, bundle: nil), forCellWithReuseIdentifier: subjectTypeIdentifier)
        
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        videoCollectionView.register(UINib.init(nibName: videoCellIdentifier, bundle: nil), forCellWithReuseIdentifier: videoCellIdentifier)
    }
    func playVideo(at indexPath: IndexPath){
        let videoPath = Bundle.main.path(forResource: "Demo1", ofType: "mp4")
        let videoPathURl = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURl)
        playerViewController.player = player
        player.play()
        self.present(playerViewController, animated: true, completion: nil)
    }
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Collectionview data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subjectCollectionView {
            return Subjects.count
        } else {
            return videos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == subjectCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subjectTypeIdentifier, for: indexPath) as! SubjectCollectionViewCell
            cell.setupCell(model: Subjects[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoCellIdentifier, for: indexPath) as! VideoCollectionViewCell
            cell.setupCell(model: videos[indexPath.row])
            return cell
        }
    }
    // MARK: - Collection Delegta FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == subjectCollectionView {
            return CGSize(width: 111, height: 153)
        }
        return CGSize(width: 175, height: 126)
    }
    // MARK: - Collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == videoCollectionView {
            collectionView.deselectItem(at: indexPath, animated: true)
            playVideo(at: indexPath)
        }
    }
    
}
