//
//  VideoCollectionViewCell.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var playImageView: UIImageView!
    
    func setupCell(model: Video){
        videoImageView.image = UIImage(named: model.imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
