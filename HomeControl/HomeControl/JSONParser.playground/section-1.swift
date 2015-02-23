// Playground - learn how to parse JSON

import Foundation

let stringForArray = "[ {\"name\": \"John\", \"age\": 21}, {\"name\": \"Bob\", \"age\": 35} ]"

func jsonToArray(jsonString: String) -> [AnyObject] {
    if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
        if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
            return array
        }
    }
    return [AnyObject]()
}

for elem: AnyObject in jsonToArray(stringForArray) {
    let name = elem["name"] as String
    let age = elem["age"] as Int
    println("Name: \(name), Age: \(age)")
}

