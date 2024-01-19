//
//  AppPrefsManager.swift
//  APIManagerClass_URLSession
//
//  Created by EOO61 on 19/01/24.
//

import UIKit

class AppPrefsManager: NSObject {

    static let sharedInstance = AppPrefsManager()
    
    
    let AuthToken =  "AuthToken"
    
    func setDataToPreference(data: AnyObject, forKey key: String) {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(archivedData, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func getDataFromPreference(key: String) -> AnyObject? {
        let archivedData = UserDefaults.standard.object(forKey: key)
        if archivedData != nil {
            return (NSKeyedUnarchiver.unarchiveObject(with: (archivedData! as? Data)!) as AnyObject?)
        }
        return nil
    }
    
    
    func getAuthToken() -> String {
        return getDataFromPreference(key: AuthToken) as? String ?? ""
    }
    func saveAuthToken(accessToken: String) {
        setDataToPreference(data: accessToken as AnyObject, forKey: AuthToken)
    }
    
}
