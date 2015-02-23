//
//  NetworkClient.swift
//  HomeControl
//
//  Created by Jun Chen on 22/02/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

class NetworkClient {
    
    let serverUrlString: String
    
    init(serverUrlString: String) {
        self.serverUrlString = serverUrlString
    }
    
    func fetchData(callback: (String, String?) -> Void) {
        let request = NSURLRequest(URL: NSURL(string: serverUrlString)!)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if error != nil {
                callback("", error.localizedDescription)
            } else {
                let result = NSString(data: data, encoding: NSASCIIStringEncoding)!
                callback(result, nil)
            }
        }
        
        task.resume()
    }
    
}