//
//  ViewController.swift
//  HomeControl
//
//  Created by Jun Chen on 22/02/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    let networkClient = NetworkClient(serverUrlString: "http://localhost:9000/environment_data")
        
    @IBOutlet weak var temperatureDisplay: UILabel!
    
    @IBOutlet weak var dateDisplay: UILabel!
    
    @IBAction func displayEnvironmentData() {
        networkClient.fetchData() {
            (data, error) -> Void in
            if error != nil {
                println("ERROR")
            } else {
                println(data)
                let lastEnvironmentInfo = JsonEnvironmentParser.convertLastDataToEnvironment(data)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.temperatureDisplay.text = lastEnvironmentInfo.temperature
                    self.dateDisplay.text = lastEnvironmentInfo.date
                })
            }
        }

    }
    
}

