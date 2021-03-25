//
//  PhotoModel.swift
//  FlickrGallery
//
//  Created by Mac on 22.03.2021.
//

import Foundation
import SwiftyJSON


struct PhotoModel {
    
    var bigImageURL: String
    var smallImageURL: String
    
    init?(json: JSON) {
        guard let urlQ = json["url_q"].string, let urlZ = json["url_z"].string else { return nil }
        self.bigImageURL = urlQ
        self.smallImageURL = urlZ
    }
}
