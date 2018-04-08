//
//  AuthenticateViewController.swift
//  RecruitmentFramework
//
//  Created by mobiledeveloper on 3/20/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import UIKit

public protocol AuthenticateViewControllerDelegate : class  {
    func AddRemoveCredentials(store : Bool, username : String, password : String)
    func UploadDataToServer(options : [String:AnyObject]?)
}

public class AuthenticateViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swSaveCredentials: UISwitch!
    @IBOutlet weak var lblSaveCredentials: UILabel!
    
    public weak var delegate : AuthenticateViewControllerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Provide functions to update view
    public func set(username text: String) {
        self.txtUsername.text = text
    }
    public func set(password text: String) {
        self.txtPassword.text = text
    }
    
    public func set(saveCredentialsValue value : Bool)
    {
        self.swSaveCredentials.isOn = value
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
