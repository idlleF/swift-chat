//
//  ViewController.swift
//  quizz
//
//  Created by Irko Stoyanov on 5.01.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import UIKit

class ShareController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toHomeMenu", sender: nil)
    }
}
