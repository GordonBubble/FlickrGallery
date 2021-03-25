//
//  MainViewController.swift
//  FlickrGallery
//
//  Created by Mac on 22.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MainViewController: UIViewController {
    
    let sectionInserts = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    let itemsPerRow: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos: [PhotoModel] = []
    var layoutType: LayoutType = .grid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getFlickrPhotos()
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        self.layoutType = LayoutType(rawValue: sender.selectedSegmentIndex) ?? .grid
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoVC = segue.destination as? PhotoViewController, let indexPath = collectionView.indexPathsForSelectedItems?.first {
            
            photoVC.photo = photos[indexPath.row]
        }
    }
    
}



extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum LayoutType: Int {
        case grid
        case list
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.item]
        
        cell.imageURL = layoutType == .grid ? photo.smallImageURL : photo.bigImageURL
        
        DispatchQueue.main.async {
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if layoutType == .grid {
            let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
            let availableWidth = collectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemsPerRow
            let heightPerItem = availableWidth / 1.5
            return CGSize(width: widthPerItem, height: heightPerItem)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if layoutType == .grid {
            return sectionInserts
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

