//
//  ViewController.swift
//  jasonDownload
//
//  Created by Srikanth Solipeta on 8/8/18.
//  Copyright © 2018 apex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableArray : [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
    
        let operationQueue = OperationQueue()
    let operation1 :BlockOperation = BlockOperation (block: {
        self.makeservicecall()
    })
    operationQueue.addOperation(operation1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destinationVC = segue.destination as? myViewController {
                
                let s = sender as? ViewController
                guard let tb = s?.tableArray else { return}
                destinationVC.tableArray = tb
                //print(tb)
                
            }
        }
    }
    

    func makeservicecall(){
        let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard error == nil else {
                //print("returning error")
                return
            }
            
            guard let content = data else {
               // print("not returning data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Error")
                return
            }
            self.tableArray = json
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "segue", sender: self)
            }
            
        }
        
        task.resume()
    }
    

}

