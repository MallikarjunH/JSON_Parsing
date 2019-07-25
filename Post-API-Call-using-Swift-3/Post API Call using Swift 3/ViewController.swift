//
//  ViewController.swift
//  Post API Call using Swift 3
//
//  Created by Mallikarjun on 27/11/18.
//  Copyright © 2018 Ladybird Web Solution. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textViewToShowResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func postAPIMethodCalled(_ sender: Any) {
        
        
        let parameters = ["username" : "demoadmin", "password": "demopass"];
        
        guard let url = URL(string: "http://productdemourl.com/servicedesk38t/public/api/v1/authenticate") else { return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
       
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            
            if let data = data{
                
                do{
                    
                   // let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(json)
                    
                } catch{
                    print(error)
                }
            }
            
            
        }.resume()
        
        
    }
    


}

