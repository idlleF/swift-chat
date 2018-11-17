//
//  addChannleVC.swift
//  swift-chat
//
//  Created by Irko Stoyanov on 17.11.18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class addChannleVC: UIViewController {
    
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var channelDesc: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(addChannleVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        channelDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
