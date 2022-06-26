//
//  StorageService.swift
//  Instagram
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class FirestoreService {
    static let shared = FirestoreService()
    
    private init() {}
    
    func getUsers(completion: @escaping ([String]) -> ()) {
        Firestore.firestore().collection("users").getDocuments { snap, err in
            if err == nil {
                var emailList = [String]()
                if let docs = snap?.documents {
                    for doc in docs {
                        let data = doc.data()
                        let email = data["email"] as! String
                        emailList.append(email)
                    }
                }
                completion(emailList)
            }
        }
    }
}
