//
//  SignInViewController.swift
//  Instagram
//
//  Created by Ivan White on 23.06.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let image_Logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    private let textField_login: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Телефон, имя пользователя или эл. адрес"
        textfield.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .done
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont(name: "Roboto-Medium", size: 15)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        return textfield
    }()
    
    private let textField_password: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Пароль"
        textfield.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .done
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont(name: "Roboto-Medium", size: 15)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let button_forgetPass: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 15)
        button.addTarget(self, action: #selector(forgetPass), for: .touchUpInside)
        return button
    }()
    
    private let button_signIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 15)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private let view_separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        return separator
    }()
    
    private let text_or: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "ИЛИ"
        text.font = UIFont(name: "Roboto-Medium", size: 13)
        text.textColor = .gray
        return text
    }()
    
    private let view_separator2: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        return separator
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(image_Logo)
        view.addSubview(textField_login)
        view.addSubview(textField_password)
        view.addSubview(button_forgetPass)
        view.addSubview(button_signIn)
        view.addSubview(view_separator)
        view.addSubview(text_or)
        view.addSubview(view_separator2)
        
    }
    
    @objc private func forgetPass() {
        //
    }
    
    @objc private func signIn() {
        //
    }
}

extension SignInViewController {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            image_Logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            image_Logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            image_Logo.heightAnchor.constraint(equalToConstant: 60),
            image_Logo.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            textField_login.topAnchor.constraint(equalTo: image_Logo.bottomAnchor, constant: 40),
            textField_login.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textField_login.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textField_login.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            textField_password.topAnchor.constraint(equalTo: textField_login.bottomAnchor, constant: 15),
            textField_password.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textField_password.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textField_password.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            button_forgetPass.topAnchor.constraint(equalTo: textField_password.bottomAnchor, constant: 15),
            button_forgetPass.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            button_signIn.topAnchor.constraint(equalTo: button_forgetPass.bottomAnchor, constant: 25),
            button_signIn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            button_signIn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            button_signIn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            text_or.topAnchor.constraint(equalTo: button_signIn.bottomAnchor, constant: 30),
            text_or.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            view_separator.centerYAnchor.constraint(equalTo: text_or.centerYAnchor),
            view_separator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            view_separator.trailingAnchor.constraint(equalTo: text_or.leadingAnchor, constant: -15),
            view_separator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            view_separator2.centerYAnchor.constraint(equalTo: text_or.centerYAnchor),
            view_separator2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            view_separator2.leadingAnchor.constraint(equalTo: text_or.trailingAnchor, constant: 15),
            view_separator2.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}


