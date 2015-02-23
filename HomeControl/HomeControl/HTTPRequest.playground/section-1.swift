// Playground - learn how to use NSURLSession

import Foundation
import XCPlayground

/*
    we use a default session with data task to retrieve contents. NSURLSession.sharedSession() returns a singleton session based on default configuration. Then, use this session to create a data task(session.dataTaskWithRequest), bring the URLRequest in and handle the Closures. Finally, execute this task by calling task.resume().
*/

let url = NSURL(string: "https://sweng-quiz.appspot.com/quizquestions/random")

func httpGet(request: NSURLRequest!, callback: (String, String?) -> Void) {
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request){
        (data, response, error) -> Void in
        if error != nil {
            callback("", error.localizedDescription)
        } else {
            let result = NSString(data: data, encoding:
                NSASCIIStringEncoding)!
            callback(result, nil)
        }
    }
    task.resume()
}

let request = NSURLRequest(URL: NSURL(string: "https://sweng-quiz.appspot.com/quizquestions/random")!)

httpGet(request){
    (data, error) -> Void in
    if error != nil {
        println(error)
    } else {
        println(data)
    }
}

//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
