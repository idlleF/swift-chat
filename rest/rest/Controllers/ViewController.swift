//
//  ViewController.swift
//  rest
//
//  Created by Irko Stoyanov on 14.12.18.
//  Copyright © 2018 Irko Stoyanov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var list = JSON()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        spinner.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        getRealmData()
    }
    

    func getRealmData() {
        
        AuthService.instance.auth(context: self)
//        spinner.isHidden = false
//        spinner.startAnimating()
//
//        let body: [String: Any] = [
//            "access_token":"USiAKristFG7Aqmo5Ss82tADjQaTLBqvG3",
//            "locale":"en_US"
//            //"clientID": "67caf04ac8c547e79fe658ac82d2b5e1",
//            //"secret": "uWpsxtRr8p260HhCB8vA3688ZRvSgeb3"
//        ]
//
//        Alamofire.request(REALMS_URL, method: .get, parameters: body, headers: HEADER).responseJSON { (response) in
//            do {
//                if response.result.error == nil {
//                    guard let data = response.data else { return }
//                    let json = try JSON(data: data)
//                    self.list = json["realms"]
//                    self.tableView.reloadData()
//                    self.spinner.isHidden = true
//                    self.spinner.stopAnimating()
//                } else {
//
//                    let alert = UIAlertController(title: "Alert", message: "Invalid token", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                    self.spinner.isHidden = true
//                    //debugPrint(response.result.error as Any)
//                }
//            } catch let error {
//                print("Error: \(error)")
//            }
//
//        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        let cellValue = self.list[indexPath.row]
        let name = cellValue["name"]
        cell.textLabel?.text = "\(name)"
        return cell
    }
    
}

