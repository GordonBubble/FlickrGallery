//
//  AlamofireFetch.swift
//  FlickrGallery
//
//  Created by Mac on 25.03.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD

class AlamofireFetch {
    

static func fetchFlickrPhoto(searchText: String? = nil, completion: (([PhotoModel]?) -> Void)? = nil) {
    let url = URL(string: "https://api.flickr.com/services/rest/")!
    
    if let searchText = searchText {
        Constants.param["method"] = "flickr.photos.search"
        Constants.param["text"] = searchText
    }
    
    AF.request(url, method: .get, parameters: Constants.param).validate().responseData { (responce) in
        
        switch responce.result {
        case .success:
            guard let data = responce.data,
                  let json = try? JSON(data: data) else { return }
            
            let photosJSON = json["photos"]["photo"]
            let photos = photosJSON.arrayValue.compactMap({ PhotoModel(json: $0)})
            completion?(photos)
            
        case .failure(let error):
            print("error: \(error.localizedDescription)")
            completion?(nil)
        }
    }
}
    
    
}
