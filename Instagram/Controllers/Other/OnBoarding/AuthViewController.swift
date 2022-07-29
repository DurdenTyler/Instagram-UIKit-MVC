//
//  AuthViewController.swift
//  Instagram
//
//  Created by Ivan White on 26.07.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let image_Logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    private let button_signUp: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Создать новый аккаунт", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.5388471013, blue: 0.9647058824, alpha: 1)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let button_signIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.tintColor = #colorLiteral(red: 0.003921568627, green: 0.5388471013, blue: 0.9647058824, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(image_Logo)
        view.addSubview(button_signUp)
        view.addSubview(button_signIn)
    }
    
    @objc private func signUp() {
        let vc = SignUpViewController1()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc private func signIn() {
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}


// MARK: Constraints
extension AuthViewController {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            image_Logo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -55),
            image_Logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            image_Logo.heightAnchor.constraint(equalToConstant: 60),
            image_Logo.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            button_signUp.topAnchor.constraint(equalTo: image_Logo.bottomAnchor, constant: 30),
            button_signUp.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            button_signUp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            button_signUp.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        NSLayoutConstraint.activate([
            button_signIn.topAnchor.constraint(equalTo: button_signUp.bottomAnchor, constant: 15),
            button_signIn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 5)
        ])
        
        
    }
}
