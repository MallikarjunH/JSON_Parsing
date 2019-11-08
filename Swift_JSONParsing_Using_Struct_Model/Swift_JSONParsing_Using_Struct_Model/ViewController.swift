//
//  ViewController.swift
//  Swift_JSONParsing_Using_Struct_Model
//
//  Created by mallikarjun on 08/11/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getSingleCourseApiCall()
    }
    
    func getSingleCourseApiCall() {
        
       let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/course"
    
       guard let url = URL(string: jsonURL) else { return }
        
       URLSession.shared.dataTask(with: url) { (data, response, err) in
           
           guard let data = data else { return }
           
          do{
             guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
           
             print(json) // this will print serialized data (Pretty JSON)
           }catch let jsonError{
                      
              print("Error while Serializing JSON : \(jsonError)") // It will print an error if it get any error while serializaing the JSON
        }
           
           
           }.resume()
    }
    
    func getMultpleCoursesApiCall() {
        //https://api.letsbuildthatapp.com/jsondecodable/courses
    }
           
    
}

