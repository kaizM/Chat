//
//  AuthVC.swift
//  breakpoint
//
//  Created by Caleb Stultz on 7/24/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class AuthVC: UIViewController , GIDSignInUIDelegate , GIDSignInDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = "1098835378078-1ah043s8or3jga4edsrsenuocgqk61ov.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        //  Converted to Swift 4 with Swiftify v1.0.6519 - https://objectivec2swift.com/
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
      print(user.authentication)
        loginwithgmail(authentication: user.authentication)
    }
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
       
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
        
        print("google sign in ")
        GIDSignIn.sharedInstance().signIn()
       // loginwithgmail()
        
       
    }
    func loginwithgmail(authentication : GIDAuthentication){
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user : User?, error : Error?) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }else{
                print(user?.email)
                print(user?.displayName)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainboard = storyboard.instantiateViewController(withIdentifier: "mainboard")
                self.present(mainboard, animated: true, completion: nil)
            }
        }
        
    }

}
