//
//  LatestValueViewController.swift
//  HomeControl
//
//  Created by Jun Chen on 01/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import UIKit

class LatestStatusViewController: UIViewController {

    @IBOutlet weak var latestStatusButton: LatestStatusButton!
    @IBOutlet weak var latestDateLabel: UILabel!
    
    let networkClient = MockNetworkClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenRect = UIScreen.mainScreen().bounds
        let verticalOffSet = screenRect.height * 0.1
        JLToastView.setDefaultValue(
            verticalOffSet as NSNumber ,
            forAttributeName: JLToastViewPortraitOffsetYAttributeName,
            userInterfaceIdiom: .Phone
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func FetchLatestMeasureAndShowAsTitle() {
        func displayNewValueAsTitle(data: NSData) -> Void {
            let result: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)!
            let measures = Measure.convertJsonToMeasure(result, dateFormat: MockNetworkClient.DATE_FORMAT)
            if measures.count != 1 {
                displayDataFormatError("Can't diplay the fetched data, sorry.")
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.latestStatusButton.setTitle(String(format:"%.2f", measures.first!.value), forState: UIControlState.Normal)
                    self.latestDateLabel.text = measures.first!.getDateString()
                    // TODO: If same date, diplay no new value
                })
                
            }
        }
        
        networkClient.httpGet(fromPath: "/last", completionAction: displayNewValueAsTitle, errorAction: displayNetworkError)
    }

    func displayNetworkError(errorMessage: String) {
        JLToast.makeText(errorMessage, duration: JLToastDelay.ShortDelay).show()
    }
    
    func displayDataFormatError(errorMessage: String) {
        JLToast.makeText(errorMessage, duration: JLToastDelay.ShortDelay).show()
    }
    
}
