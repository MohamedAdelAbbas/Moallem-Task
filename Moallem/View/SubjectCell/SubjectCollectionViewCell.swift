//
//  SubjectCollectionViewCell.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var supjectImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    
    func setupCell(model: Subject){
        supjectImageView.image = UIImage(named: "\(model.imageName)")
        subjectLabel.text = model.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        supjectImageView.layer.masksToBounds = false
        supjectImageView.backgroundColor = .white
        supjectImageView.layer.shadowColor = #colorLiteral(red: 0.2269999981, green: 0.6859999895, blue: 0.2669999897, alpha: 1)
        supjectImageView.layer.shadowRadius = 10
        supjectImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        supjectImageView.layer.shadowOpacity = 0.3
        supjectImageView.layer.cornerRadius = 20
    }
    
}
