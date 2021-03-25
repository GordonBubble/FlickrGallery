//
//  Extensions.swift
//  FlickrGallery
//
//  Created by Mac on 25.03.2021.
//

import Foundation
import MBProgressHUD

extension MainViewController: UISearchBarDelegate {
    
    func getFlickrPhotos(searchText: String? = nil) {
        MBProgressHUD.showAdded(to: view, animated: true)
        
        
        
            AlamofireFetch.fetchFlickrPhoto(searchText: searchText) { [weak self] (photos) in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            
            
            guard let photos = photos else { return }
            strongSelf.photos = photos
                strongSelf.collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        getFlickrPhotos(searchText: searchBar.text)
    }
}
