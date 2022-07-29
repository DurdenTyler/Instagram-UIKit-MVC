//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Ivan White on 23.06.2022.
//

import UIKit

class SignUpViewController2: UIViewController {
    
    private let button_BackToSignIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(func_BackToSignIn), for: .touchUpInside)
        return button
    }()
    
    private let text_CreateName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Создание имени пользователя"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let text_info: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выберите имя пользователя для своего нового аккаунта. Вы сможете изменить его позже."
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "SFProDisplay-Light", size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let textField_login: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Имя пользователя"
        textfield.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .next
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont(name: "SFProDisplay-Light", size: 15)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        return textfield
    }()
    
    private let button_Next: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 15)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.4705882353, green: 0.7543902329, blue: 0.9803921569, alpha: 1)
        button.addTarget(self, action: #selector(func_Next), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        addTaps()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button_BackToSignIn)
        view.addSubview(text_CreateName)
        view.addSubview(text_info)
        view.addSubview(textField_login)
        view.addSubview(button_Next)
    }
    
    @objc private func func_BackToSignIn() {
        dismiss(animated: true)
    }
    
    @objc private func func_Next() {
        let vc = SignUpViewController2()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func setDelegates() {
        textField_login.delegate = self
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }


}

// MARK: Constraints
extension SignUpViewController2 {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            button_BackToSignIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            button_BackToSignIn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            text_CreateName.topAnchor.constraint(equalTo: button_BackToSignIn.bottomAnchor, constant: 3),
            text_CreateName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_CreateName.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            text_info.topAnchor.constraint(equalTo: text_CreateName.bottomAnchor, constant: 15),
            text_info.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_info.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            textField_login.topAnchor.constraint(equalTo: text_info.bottomAnchor, constant: 20),
            textField_login.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField_login.widthAnchor.constraint(equalToConstant: 350),
            textField_login.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            button_Next.topAnchor.constraint(equalTo: textField_login.bottomAnchor, constant: 20),
            button_Next.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button_Next.widthAnchor.constraint(equalToConstant: 350),
            button_Next.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: UITextFieldDelegate
extension SignUpViewController2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let vc = SignUpViewController2()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        return true
    }
}
