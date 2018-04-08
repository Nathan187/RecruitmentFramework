//
//  LoginRelated.swift
//  RecruitmentFramework
//
//  Created by mobiledeveloper on 3/20/18.
//  Copyright © 2018 Oxy. All rights reserved.
//

import Foundation
import PopupDialog
import SVProgressHUD

public class LoginRelated {
    
    public class var ReturnLoginRelatedDialog : AnyObject?
    {
        
        if Connectivity.isConnectedToInternet
        {
            //Very interesting.  When you are using a framework and you are going to show views (xibs especially)
            //from the framework...make sure you use the correct bundle!  Frameworks have their own bundles
            //https://stackoverflow.com/questions/8471334/unable-to-access-nibxib-files-from-a-framework-in-ios
            
            let bundle = Bundle(identifier:"com.oxy.recruitmentframework.RecruitmentFramework")
            var authenticateViewController : AuthenticateViewController?
            if !(bundle == nil){
                authenticateViewController = AuthenticateViewController(nibName: "AuthenticateViewController", bundle: bundle)
            }
            
            
            let vc = authenticateViewController!// AuthenticateViewController(nibName: "AuthenticateViewController", bundle: nil)
            let popup = PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 300, gestureDismissal: true, hideStatusBar: true, completion: {
                //
            })
            
            // Create first button
            let buttonCancel = CancelButton(title: "CANCEL") {}
            
            // Create second button
            let buttonAuthenticate = DefaultButton(title: "PROCEED") {
                
                let authVC = popup.viewController as! AuthenticateViewController
                authVC.delegate?.AddRemoveCredentials(store: authVC.swSaveCredentials.isOn,
                                                      username : vc.txtUsername.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                                                      password :vc.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                
                
                //make call to authenticate and send data
                print("make call to server")
                authVC.delegate?.UploadDataToServer(options: nil)
                
            }
            
            // Add buttons to dialog
            popup.addButtons([buttonCancel, buttonAuthenticate])
            
            return popup
        }
        else
        {
            let popup = PopupDialog(title: "",
                                    message: "You're not connected to the internet.  Check your settings and try again.",
                                    buttonAlignment: .horizontal,
                                    transitionStyle: .zoomIn,
                                    gestureDismissal: true,
                                    hideStatusBar: true) {
                                        print("Completed...dialog shown")
            }
            
            // Create first button
            let buttonOne = CancelButton(title: "OK") {
                //self.label.text = "You canceled the default dialog"
            }
            
            
            
            // Add buttons to dialog
            popup.addButtons([buttonOne])
            
            return popup
        }
        
    }
    
}


