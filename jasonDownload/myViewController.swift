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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.tableArray["actors"] as! [Any]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tcell", for: indexPath) as! myTableViewCell
        let row = indexPath.row
        print(tableArray)
        let dictData = ((tableArray["actors"] as! [Any])[row] as! [String:String])
        cell.updateCell(name: dictData["name"] as! String, dob: dictData["dob"] as! String, image: dictData["image"] as! String, height: dictData["height"] as! String, desc: dictData["description"] as! String, country: dictData["country"] as! String)
        
        return cell
    }
    
    
    
}


