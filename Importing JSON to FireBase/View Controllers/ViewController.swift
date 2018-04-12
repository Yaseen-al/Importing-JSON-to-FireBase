//
//  ViewController.swift
//  Importing JSON to FireBase
//
//  Created by Yaseen Al Dallash on 4/12/18.
//  Copyright © 2018 Yaseen Al Dallash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     //This function will only load the JSON File from the project directory
    private func loadJSONFile()->Any?{
        if let path = Bundle.main.path(forResource: "GOT House", ofType: "json"){
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL){
                do{
                    let rawJSON = try JSONSerialization.jsonObject(with: data, options: [])
                    return rawJSON
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        return nil
    }
    
    
    @IBAction func AddJsonAction(_ sender: UIButton) {
        
        guard let json = loadJSONFile() else{
            print("Dev: error loading the json file")
            return
        }
        DataBaseService.manager.addGOTJSON(json: json)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

