//
//  LoginCV.swift
//  swift-chat
//
//  Created by Macbook Pro on 23/10/2018.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class LoginCV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
