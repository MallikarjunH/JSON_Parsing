//
//  AppExtensions.swift
//  APIManagerClass_URLSession
//
//  Created by EOO61 on 19/01/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ title: String, message: String) {
        self.showAlert(title, message: message, onDismiss: nil)
    }
    
    func showAlert(_ title: String, message: String, onDismiss: (() -> Void)?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (_) in
            onDismiss?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithActionForSessionExpired(){
        let alert = UIAlertController(title: "Notice", message: "Your session has timed out. Please login again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
            UserDefaults.standard.set(true, forKey: "showOnboardingScreen")
            UserDefaults.standard.set(false, forKey: "isPasswordlessLoginEnabled")
            AppDelegate.shared().showLoginViewController()
        }))
        //alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension Date {
    
    static func getCurrentDate(dateFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: Date())
    }
}

extension UIButton{
    
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}

public extension UIColor {
    
    static func fromHex(hexString: String) -> UIColor {
        let hex = hexString.trimmingCharacters(
            in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return UIColor.clear
        }
        
        return UIColor(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255)
    }
}
