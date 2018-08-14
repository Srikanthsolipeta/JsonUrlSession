//
//  myViewController.swift
//  jasonDownload
//
//  Created by Srikanth Solipeta on 8/8/18.
//  Copyright © 2018 apex. All rights reserved.
//

import UIKit

class myViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    @IBOutlet weak var myTV: UITableView!
    
    var tableArray = [String : Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
myTV.delegate=self
    }  // Do any additional setup after loading the view.
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(tableArray,tableArray.count)
            return self.tableArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tcell", for: indexPath) as! myTableViewCell
            
            cell.updateCell(name: tableArray["name"] as! String, dob: tableArray["dob"] as! String, image: tableArray["image"] as! String, height: tableArray["height"] as! String, desc: tableArray["description"] as! String, country: tableArray["country"] as! String)
            
            return cell
        }
        
        
    }


