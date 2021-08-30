//
//  ViewController.swift
//  Alamofire_Example
//
//  Created by EOO61 on 23/08/21.
//

//https://johncodeos.com/how-to-make-post-get-put-and-delete-requests-with-alamofire-using-swift/


import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //request
    }

    //Use the HTTP method GET to retrieve information from REST API, like user info in a social media API (e.g. Facebook Graph API)
    @IBAction func getAPICall(_ sender: Any) {
        
        
        // Example 2  - GET Request with Headers
        let headers:HTTPHeaders = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "authorization": "Basic" + " " + "eyAnYWxnJzogJ25vbmUnLCAndHlwJzogJ0pXVCd9.eyJBdXRoVG9rZW4iOiJ5MnZEK3A5U1FjUCt2TGVpQklaZWRpNEc4TnkzSlRnSFhSWlE2TlJTd0djMVNBbjVieTQ0ZHM4RVRmZE9CT3d0IiwiSXNzdWVUaW1lIjoiMjQwODIwMjExMjU1MDNQTSIsIklzQWRtaW4iOnRydWV9.MjE0M2U2MTg3ZTMzOWM5ZWZkMWExYmI1MjI5M2FmMmYxYmI3ODA1NDkwNWIwODkwMjcxYWQxYjZlNzJkOGQ3Mw=="
        ]
        
        AF.request("https://fab-bank.emsigner.com/FABAPI/api/AccountProfile", parameters: nil, headers: headers).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }

                    print(prettyPrintedJson)
                    
                    if let urlString = jsonObject["url"] {
                        
                        print("URL is: \(urlString)")
                    }
                
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
        
        //
        
        // Exampple 1
        /*
        AF.request("https://httpbin.org/get", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }

                    print(prettyPrintedJson)
                    
                    if let urlString = jsonObject["url"] {
                        
                        print("URL is: \(urlString)")
                    }
                
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
        */
    }
    
    
    //If you want to send data to the server, as we do in this example by uploading an employee’s data(name, salary, and age) to the database, then use the HTTP method POST.
    @IBAction func postAPICall(_ sender: Any) {
        
      
        let headers:HTTPHeaders = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "authorization": "Basic 67b512715869fb25afccd64e9b46e5b882ad1012f251d6e148c50901e9e8a38f"
        ]
        
        let params: Parameters = [
            "UserName": "fabadmin@emudhra.com",
            "Password": "111111"
        ] as [String : Any]
        
        
        AF.request("https://fab-bank.emsigner.com/FABAPI/api/ValidateLogin", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                print(prettyPrintedJson)
                
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
    
    //If you have the data already, and you want to update them, you can use the HTTP method PUT. Sometimes you can do the same with the POST method.
    @IBAction func putAPICall(_ sender: Any) {
        
        let params: Parameters = [
                "name": "Nicole",
                "job": "iOS Developer"
            ]

            AF.request("https://reqres.in/api/users/2", method: .put, parameters: params, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }

                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
    }
    
    //Remove data from your REST API server using the HTTP method DELETE.
   //Note: In this example, the URL I’m using for the DELETE method doesn’t return any response after deleting the item. That’s why the results are empty.
    @IBAction func deleteAPICall(_ sender: Any) {
        
        AF.request("https://my-json-server.typicode.com/typicode/demo/posts/1", method: .delete, parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }

                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
    }
}

