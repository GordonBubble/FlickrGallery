//
//  PhotoCell.swift
//  FlickrGallery
//
//  Created by Mac on 23.03.2021.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageURL: String? {
        didSet {
            
            guard let imageURL = imageURL, let url = URL(string: imageURL) else {
                photoImageView.image = nil
                photoImageView.kf.cancelDownloadTask()
                return
            }
            
            
            photoImageView.kf.setImage(with: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageURL = nil
    }
}
