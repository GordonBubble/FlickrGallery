//
//  PhotoViewController.swift
//  FlickrGallery
//
//  Created by Mac on 22.03.2021.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var photo: PhotoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let photo = photo, let url = URL(string: photo.smallImageURL) else {
            imageView.image = nil
            imageView.kf.cancelDownloadTask()
            return
        }
        
        
        imageView.kf.setImage(with: url)
    }
    
    @IBAction func saveAndShare(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно!")
            }
        }
        
        present(shareController, animated: true, completion: nil)
    }
    
}
