//
//  ViewController.swift
//  Messenger
//
//  Created by Jai  on 29/04/23.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        DatabaseManager.shared.test()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
        
//        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav =  UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav,animated:true)
        }
        
    
    
    }


}

