//
//  ViewController.swift
//  Swift_NetworkRequest_URLSession
//
//  Created by mallikarjun on 07/11/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var idArray = [Int]()
    var titleArray = [String]()
    
    //Developer data
    var idArrayForDeveloper = [Int]()
    var nameArrayForDeveloper = [String]()
    var salaryArrayForDeveloper = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callApiButtonClicked(_ sender: Any) {
  
      // getAPICallExample1()
      // getAPICallExample2()
         getAPICallExample3()
    }

    
    func getAPICallExample1(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
              //  print("JSON Response: \(jsonResponse)") //Response result
                
                //get the data from dictionary
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                      return
                }
    
              //  print("JSON Array: \(jsonArray)")
                
                if jsonArray.count > 0{
                    
                    self.idArray = []
                    self.titleArray = []
                    
                    for dictData:Dictionary<String,Any> in jsonArray{
                        
                        let idValue:Int = dictData["id"] as? Int ?? 0
                        let title:String = dictData["title"] as? String ?? "Not Title"
                
                        self.idArray.append(idValue)
                        self.titleArray.append(title)
                    }
                    
                    print("Id Array is: \(self.idArray)")
                    print("Title Array is: \(self.idArray)")
                    
                }else{
                    //array is empty
                }
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
    
    func getAPICallExample2(){
        
        guard let url = URL(string: "http://182.72.79.154/iphonetest/getTheData.php") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
              //  print("JSON Response: \(jsonResponse)") //Response result
                
                //get the data from dictionary
                guard let jsonDict = jsonResponse as? NSDictionary else {
                      return
                }
                //print("JSON Dictionary: \(jsonDict)")
                
                //Get Array inside dictionary
                
               // guard let arrayData = jsonDict["result"] as? [[String:Any]] else {
                guard let arrayData = jsonDict.object(forKey: "result") as? [[String:Any]] else {
                      return
                }
             //   print("Array is: \(arrayData)") //array of dictionary
                
                if arrayData.count > 0{
                    
                    self.idArrayForDeveloper = []
                    self.nameArrayForDeveloper = []
                    self.salaryArrayForDeveloper = []
                    
                    for developerDataDict:Dictionary<String,Any> in arrayData{
                        
                        let userId:Int = developerDataDict["id"] as? Int ?? 0
                        let name:String = developerDataDict["name"] as? String ?? "No name"
                        let salary:Int = developerDataDict["salary"] as? Int ?? 0
                        
                        self.idArrayForDeveloper.append(userId)
                        self.nameArrayForDeveloper.append(name)
                        self.salaryArrayForDeveloper.append(salary)
                    }
                    
                    print("Developer name Array: \(self.nameArrayForDeveloper)")
                }
                else{
                    print("Array is empty")
                }
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
    
    
    func getAPICallExample3(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
             //   print("JSON Response: \(jsonResponse)") //Response result
                
                var idArray:[Int] = []
                var titleArray:[String] = []
                
                for jsonDataDict:[String:Any] in  jsonResponse as! [[String:Any]] {
                    
                    let idValue:Int = jsonDataDict["id"] as? Int ?? 0
                    let titleValue:String = jsonDataDict["title"] as? String ?? "No Title"
                    
                    idArray.append(idValue)
                    titleArray.append(titleValue)
                }
                
                print("Id Array: \(idArray)")
                print("Title Array: \(titleArray)")
                 
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
}

