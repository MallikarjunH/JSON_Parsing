//
//  WebServices.swift
//  JSONParsing_Alamofire+SwiftyJSON
//
//  Created by mallikarjun on 08/11/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class webConstant:NSObject
{
    //    static let authenticate = "authenticate"
    //
    //    static let createTicket = "helpdesk/create"
    //    static let replyTicket = "helpdesk/reply"
}

public func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
    
    if Connectivity.isConnectedToInternet {
        
        // SVProgressHUD.show()
        Alamofire.request(strURL, method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { responseObject in
            
            
            // print(responseObject.request!)
            
            if responseObject.result.isSuccess {
                //  SVProgressHUD.dismiss()
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                //  SVProgressHUD.dismiss()
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }else{
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Alert", message: "Please,check your internet connection", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            
        }
    }
}
