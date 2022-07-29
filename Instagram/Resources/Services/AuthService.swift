//
//  AuthService.swift
//  Instagram
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private init() {}
    
    private let auth = Auth.auth()
    
    
}
