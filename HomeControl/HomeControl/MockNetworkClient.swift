//
//  MockNetworkClient.swift
//  HomeControl
//
//  Created by Jun Chen on 01/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

class MockNetworkClient: NetworkClient {
    
    static let DATE_FORMAT = "yyyy-MM-dd HH:mm:ss"
    
    let ERROR_MESSAGE = "Can't fetch data right now, sorry."
    let host = "http://localhost:9000"
    
    func httpGet(fromPath path: String, completionAction completionHandler: NSData -> Void, errorAction errorHandler: String -> Void) {
        let url = NetworkUtils.getUrl(fromHost: self.host, joinPath: path)
        let request = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) in
            if error != nil {
                errorHandler(self.ERROR_MESSAGE)
            } else {
                completionHandler(data)
            }
        }
        task.resume()
    }
    
}