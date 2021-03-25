//
//  Constants.swift
//  FlickrGallery
//
//  Created by Mac on 23.03.2021.
//

import Foundation

struct Constants {
   static var param = [
        "method" : "flickr.interestingness.getList",
        "api_key" : "536c4bbba68c6dc5d7c1ca890e21a497",
        "sort" : "relevance",
        "per_page" : "30",
        "format" : "json",
        "nojsoncallback" : "1",
        "extras" : "url_q,url_z"
    ]
}
