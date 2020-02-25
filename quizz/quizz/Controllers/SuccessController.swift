//
//  ViewController.swift
//  quizz
//
//  Created by Irko Stoyanov on 5.01.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import UIKit

class SuccessController: UIViewController {
    
    var strikes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toHomeMenu", sender: nil)
    }
}
