//
//  NetworkUtils.swift
//  HomeControl
//
//  Created by Jun Chen on 01/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

class NetworkUtils {
    
    static func getUrl(fromHost host: String, joinPath path: String) -> NSURL {
        let url: String
        if path[path.startIndex] == "/" {
            url = host + path
        } else {
            url = host + "/" + path
        }
        
        return NSURL(string: url)!
    }
    
}