//
//  FbVC.swift
//  breakpoint
//
//  Created by kaiz on 11/13/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
class FbVC: UIViewController {
    var loginButton = FBSDKLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        //  Converted to Swift 4 with Swiftify v1.0.6519 - https://objectivec2swift.com/
        
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        view.addSubview(loginButton as? UIView ?? UIView())
        //  Converted to Swift 4 with Swiftify v1.0.6519 - https://objectivec2swift.com/
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self as! FBSDKLoginButtonDelegate
        self.view!.addSubview(loginButton)
        //  Converted to Swift 4 with Swiftify v1.0.6519 - https://objectivec2swift.com/
        if (FBSDKAccessToken.current() != nil) {
            // User is logged in, do work such as go to next view controller.
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
