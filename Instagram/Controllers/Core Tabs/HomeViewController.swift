//
//  ViewController.swift
//  Instagram
//
//  Created by Ivan White on 23.06.2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated() {
        // check auth status
        if Auth.auth().currentUser == nil {
            // show log in
            let signInVC = SignInViewController()
            signInVC.modalPresentationStyle = .fullScreen
            present(signInVC, animated: false)
        }
    }


}

