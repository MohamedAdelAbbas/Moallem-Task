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
        // Initialization code
    }

}
