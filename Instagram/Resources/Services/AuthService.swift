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
    
    func signUp(data: UserModel, completion: @escaping (Result<User, Error>)->()) {
        auth.createUser(withEmail: data.email, password: data.password) { [weak self] result, error in
            if let result = result {
                let userId = result.user.uid
                let email = data.email
                let data:[String: Any] = ["email":email]
                Firestore.firestore().collection("users").document(userId).setData(data)
                completion(.success(result.user))
            }else if let error = error{
                completion(.failure(error))
            }
        }
    }
    
    
    func signIn(data: UserModel, completion: @escaping (Result<User, Error>)->()) {
        auth.signIn(withEmail: data.email, password: data.password) { [weak self] result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error  {
                completion(.failure(error))
            }
        }
    }
}
