//
//  CustomCollectionViewCell.swift
//  ImagesDownloader
//
//  Created by Consultant on 4/3/19.
//  Copyright © 2019 JuanVitela. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(imageData : Data) {
        guard let image = UIImage(data:imageData) else { return }
        self.imageView.backgroundColor = UIColor.red
        self.imageView.image = image
    }

}
