//
//  NetworkClient.swift
//  HomeControl
//
//  Created by Jun Chen on 01/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

protocol NetworkClient {
    
    func httpGet(fromPath path: String, completionAction completionHandler: NSData -> Void, errorAction errorHandler: String -> Void)
    
}