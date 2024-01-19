//
//  ViewController.swift
//  APIManagerClass_URLSession
//
//  Created by Mallikarjun H on 19/01/24.
//

import UIKit

class ViewController: UIViewController {

    let userId = 10091
    let userType = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: POST API Call Sample
    func loginServerCall(userName:String, password:String){
        
       // SVProgressHUD.show(withStatus: "Validating...")
        
        let parameters = [
            "UserName": "",
            "Password": ""
        ] as [String : Any]
        
        
        APIManager.shared.postAPICallMethod(apiUrl: API.ValidateLogin, params: parameters) { statusCode, isSuccess, msgValue, errorValue, result in
            
            if isSuccess {
                //AppPrefsManager.sharedInstance.saveAuthToken(accessToken: self.objUserData.response?.AuthToken ?? "")
                
                //Add your logic
                
                // SVProgressHUD.dismiss()
            }else {
               // SVProgressHUD.dismiss()
                self.showAlert("Error", message: msgValue)
            }
        }
        
    }
    
    
    //MARK: GET API Call Sample
    func getUserProfileDetails() {
        
       // SVProgressHUD.show(withStatus: "Loading...")
        
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "authorization": "Basic" + " " + AppPrefsManager.sharedInstance.getAuthToken()
        ]
        //let url = API.GetDocumentDetailsById + "?documentId=\(docID)&workflowType=\(workFlowType)"
        let url = API.AccountProfile + "?userId=\(userId)&userType=\(userType)"
        
        APIManager.shared.getAPICallMethod(apiUrl: url, params: [:]) { statusCode, isSuccess, msgValue, errorValue, result in
            
            
            if isSuccess  {
                
                //Add your logic
                
                // SVProgressHUD.dismiss()
            }
            else {
                // SVProgressHUD.dismiss()
                 self.showAlert("Error", message: msgValue)
            }
            
        }
    }
    
    
}

