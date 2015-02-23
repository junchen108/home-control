//
//  JsonEnvironmentParser.swift
//  HomeControl
//
//  Created by Jun Chen on 23/02/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

class JsonEnvironmentParser {
    
    class func convertLastDataToEnvironment(jsonString: String) -> Environment {
        var environment: Environment?
        
        func jsonStringToArray(jsonString: String) -> [AnyObject]? {
            if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
                if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
                    return array
                }
            }
            return nil
        }
        
        if let array = jsonStringToArray(jsonString) {
            let lastElement = array.last as [String: String]
            let temperature = lastElement["temperature"]
            let date = lastElement["date"]
            environment = Environment(temperature: temperature!, date: date!)
        }
        
        return environment!
    }
    
}