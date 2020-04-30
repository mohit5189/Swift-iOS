//
//  ViewController.swift
//  AppleLoginDemo
//
//  Created by Mohit Kumar on 28/4/2020.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
        let authButton = ASAuthorizationAppleIDButton()
        authButton.addTarget(self, action: #selector(didTapAuthButton), for: .touchUpInside)
        view.addSubview(authButton)

            authButton.frame = CGRect(x: 25, y: 200, width: view.frame.width - 50, height: 50)
        }
        
        view.backgroundColor = .white
    }
    
    @available(iOS 13.0, *)
    @objc func didTapAuthButton() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }

    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
               // Create an account in your system.
               let userIdentifier = appleIDCredential.user
               let userFirstName = appleIDCredential.fullName?.givenName
               let userLastName = appleIDCredential.fullName?.familyName
               let userEmail = appleIDCredential.email
               
               //Navigate to other view controller
           }
    }
    
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }



}

