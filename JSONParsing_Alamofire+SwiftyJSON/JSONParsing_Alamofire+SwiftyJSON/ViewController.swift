//
//  ViewController.swift
//  JSONParsing_Alamofire+SwiftyJSON
//
//  Created by mallikarjun on 08/11/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

//https://www.stablehelpdesk.faveodemo.com/api/v1/authenticate
//username=demo_admin&password=demopass

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD


class ViewController: UIViewController {

    let userName = "demo_admin"
    let userPassword = "demopass"
    
    var refreshedTokenValue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getLoginDetails()
    }

    func getLoginDetails(){
      
      let urlString = "https://www.stablehelpdesk.faveodemo.com/api/v1/authenticate"
    
        requestPOSTURL(urlString, params: ["username":userName as AnyObject,"password": userPassword as AnyObject], success: { (data) in
            
            print("JSON is: ",data)
            
            if data["message"].exists() &&  data["success"].exists() {
                
                //failure case
                
                let msg = data["message"].stringValue
               
                print(msg)
                if msg == "API key is required"{
                    //show alert that ...API Key is Required
                }
                else if msg == "API disabled"{
                     //show alert that ...API is disabled from Admin panel
                }
                else if msg == "Invalid credentials"{
                     //show alert that ...in valid credentials
                }
                
                SVProgressHUD.dismiss()
            }
            else  if data["success"].exists() && data["data"].exists() {
                
                let userRole  =  data["data"]["user"]["role"].stringValue
                
                 if userRole == "user" {
                  //show alert this app used by only Admin and Agents
                 }else{
                    
                    let tokenValue = data["data"]["token"].stringValue
                    print("Token is: \(tokenValue)")
                    self.refreshedTokenValue = tokenValue
                }
            }
            
        }) { (error) in
            print("Error in Login Method is :\(error.localizedDescription) ")
           // showAlert(title: "Error", message:error.localizedDescription , vc: self)
            SVProgressHUD.dismiss()
        }
    }
    
    func getInboxTickets(){
        
        let urlString = "https://www.stablehelpdesk.faveodemo.com/api/v2/helpdesk/get-tickets"
        
        requestGETURL(urlString, params:["token":self.refreshedTokenValue as AnyObject,"show":"inbox" as AnyObject,"api":"1" as AnyObject,"departments":"All" as AnyObject] , success: { (data) in
                   
            print("Inbox JSON is: \(data)")
            
            let msg = data["message"].stringValue
            print("Message is: ",msg)
            
            if msg == "Token expired"{
                
               self.getLoginDetails()
               self.getInboxTickets()
             }
            else if msg == "API disabled"{
              //API option is disabled in your Helpdesk, please enable it from Admin panel.
            }
            else{
                
                
            }
            
            
        }) { (error) in
             print(error)
        }
    }
    
}

