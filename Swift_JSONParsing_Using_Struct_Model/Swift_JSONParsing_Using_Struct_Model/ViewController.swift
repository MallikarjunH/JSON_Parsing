//
//  ViewController.swift
//  Swift_JSONParsing_Using_Struct_Model
//
//  Created by mallikarjun on 08/11/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

//creating model object for storing JSON

struct WebSiteDescription: Decodable {
    
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?  //made as optional
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // getSingleCourseApiCall()
          
        getMultpleCoursesApiCall()
    }
    
    func getSingleCourseApiCall() {
        
       let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/course"
    
       guard let url = URL(string: jsonURL) else { return }
        
       URLSession.shared.dataTask(with: url) { (data, response, err) in
           
           guard let data = data else { return }
           
          do{
            /* //Traditional methods
             guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
           
             print(json) // this will print serialized data (Pretty JSON)
            
            
            let name:String = (json["name"] as? String)!
            print(name) //prints Instagram Firebase
            */
            
            //  Swift 4 using Decodable - with model (struct)
            
            let course = try JSONDecoder().decode(Course.self, from: data)
            //print(course)
            
            let idValue = course.id
            let nameValue = course.name
            let linkValue = course.link
            let imageURLValue = course.link
            
           //  print("\(idValue) \(nameValue) \(linkValue) \(imageURLValue)")\
             print("\(idValue!) \(nameValue!) \(linkValue!) \(imageURLValue!)")
            
           }catch let jsonError{
                      
              print("Error while Serializing JSON : \(jsonError)") // It will print an error if it get any error while serializaing the JSON
            
        }
           
           
           }.resume()
    }
    
    func getMultpleCoursesApiCall() {
        
          let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
           guard let url = URL(string: jsonURL) else { return }
            
           URLSession.shared.dataTask(with: url) { (data, response, err) in
               
               guard let data = data else { return }
               
              do{
              
                /* //for URL 1 - https://api.letsbuildthatapp.com/jsondecodable/course
                 let course = try JSONDecoder().decode(Course.self, from: data)
                 print(course)
                 */
                
                /* // for URL 2 - https://api.letsbuildthatapp.com/jsondecodable/courses
                 let courses = try JSONDecoder().decode([Course].self, from: data)
                 print(courses)
                 */
                  // for URL 3 - https://api.letsbuildthatapp.com/jsondecodable/website_description
                 let courses = try JSONDecoder().decode(WebSiteDescription.self, from: data)
                 // print("Courses are: \(courses)")
                 print(courses.name,"\n", courses.description)
                 
                
               }catch let jsonError{
                          
                  print("Error while Serializing JSON : \(jsonError)") // It will print an error if it get any error while serializaing the JSON
                
            }
               
               
               }.resume()
    }
           
    
}

