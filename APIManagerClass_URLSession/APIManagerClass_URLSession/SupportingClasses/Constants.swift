//
//  Constants.swift
//  APIManagerClass_URLSession
//
//  Created by EOO61 on 19/01/24.
//

import Foundation
import UIKit

struct API {
    
    //Main URL
    static let baseURL =  "https://www.xyz.com/clientapi/api/"
    
    
    //Other URL's
    static let ValidateLogin =  API.baseURL + "Login"
    static let AccountProfile = API.baseURL + "AccountProfile"
    
}


struct Headers {
    static var qaHeaders = [
        "content-type": "application/json",
        "cache-control": "no-cache",
        "SecretKey": "4767e127b1a2493d9796eee3f6830c0e",
        "AppName": "TestApp"
    ]
}

struct AlertMessages {
    
    static let somethingWentWrong = "Something went wrong"
    static let sessionTimedOut = "Your session has timed out. Please login again"
}
