//
//  LoginViewController.swift
//  HomeWork_FaceBook_Redo
//
//  Created by Tomek Gulik on 2/9/15.
//  Copyright (c) 2015 Tom Gulik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var LoginBaseView: UIView!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    @IBOutlet var buttonLogin: UIButton!
    @IBOutlet var loginSpinner: UIActivityIndicatorView!
    
    
    func checkAllFields(){
        if(EmailTextField.text.isEmpty || PasswordTextField.text.isEmpty){
            self.buttonLogin.enabled = false;
        } else {
            self.buttonLogin.enabled = true;
        }
    }
    
    func fetchPassword(#password: String) -> (Bool){
        loginSpinner.startAnimating()
        
        let correctPass : String = "password"
        var canLogin : Bool
        if(password == correctPass) {
            canLogin = true;
        } else {
            canLogin = false
        }
        return canLogin
    }
    
    @IBAction func onEditLoginChange(sender: AnyObject) {
        checkAllFields()
    }
    
    @IBAction func onEditStart(sender: AnyObject) {
        checkAllFields()
    }
    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTapLoginButton(sender: AnyObject) {
        var canGoIn = fetchPassword(password: PasswordTextField.text)
        println("RETURNED \(canGoIn)")
        delay(2){
            if(canGoIn == false){
            var wrongAlertWarning = UIAlertView(title: "Incorrect", message: "Wrong Password", delegate: self, cancelButtonTitle: "OK")
            wrongAlertWarning.show()
            } else {
                println("RUN SEGUE HERE")
            }
            self.loginSpinner.stopAnimating()
        }
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoginBaseView.layer.cornerRadius = 4
        self.buttonLogin.enabled = false;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}