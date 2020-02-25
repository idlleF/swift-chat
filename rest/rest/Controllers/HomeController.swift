//
//  HomeController.swift
//  rest
//
//  Created by Irko Stoyanov on 16.12.18.
//  Copyright © 2018 Irko Stoyanov. All rights reserved.
//

import UIKit
import p2_OAuth2
import Alamofire

class HomeController: UIViewController {
    @IBOutlet weak var btnTest: UIButton!
    
    @IBAction func btnTest(_ sender: Any) {
      //self.performSegue(withIdentifier: "GoToViewController", sender:nil)
        //self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "GoToViewController") as UIViewController,animated: true)
        print("asdasdasd")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
