//
//  Measure.swift
//  HomeControl
//
//  Created by Jun Chen on 01/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import Foundation

class Measure {
    
    let value: Double
    let date: NSDate?
    
    init(value: Double, dateString: String, dateFormat: String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        self.value = value
        self.date = dateFormatter.dateFromString(dateString)
    }
    
    func getDateString() -> String? {
        if let date = self.date {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
            
            return dateFormatter.stringFromDate(date)
        } else {
            return "No date";
        }
    }
    
    static func convertJsonToMeasure(json: AnyObject, dateFormat: String) -> [Measure] {
        var measures: [Measure] = []
        
        func processJson(measureJson: [String: AnyObject]) {
            if let value = measureJson["value"] as? Double, date = measureJson["date"] as? String {
                measures.append(Measure(value: value, dateString: date, dateFormat: dateFormat))
            }
        }
        
        if let measureJson = json as? [String: AnyObject] {
            processJson(measureJson)
        } else if let measureList = json as? [[String: AnyObject]] {
            for measureJson in measureList {
                processJson(measureJson)
            }
        }

        return measures
    }
    
}