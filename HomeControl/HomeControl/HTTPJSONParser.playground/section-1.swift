// Playground - learn how to parse JSON

import Foundation
import XCPlayground

class Quiz {
    let owner: String
    let question: String
    
    init(owner: String, question: String) {
        self.owner = owner
        self.question = question
    }
}

var quizzes: [Quiz] = []

let url = NSURL(string: "http://sweng-quiz.appspot.com/quizquestions/random")!

func httpGet(request: NSURLRequest, callback: AnyObject -> Void, handleErr: String -> Void) {
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request){
        (data, response, error) in
        if error != nil {
            handleErr(error.localizedDescription)
        } else {
            let result: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)!
            callback(result)
        }
    }
    task.resume()
}

func readData(json: AnyObject) {
    if let quiz = json as? [String: AnyObject],
        owner     = quiz["owner"]    as? String,
        question  = quiz["question"] as? String {
            quizzes.append(Quiz(owner: owner, question: question))
    }
}

func handleException(error: String) {
    println(error)
}

let request = NSURLRequest(URL: url)

httpGet(request, readData, handleException)

println(quizzes)

//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)