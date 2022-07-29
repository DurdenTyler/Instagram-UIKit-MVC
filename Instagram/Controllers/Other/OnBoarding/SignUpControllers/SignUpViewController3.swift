//
//  SignUpViewController2.swift
//  Instagram
//
//  Created by Ivan White on 18.07.2022.
//

import UIKit

class SignUpViewController3: UIViewController {
    
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
        label.text = "Придумайте пароль"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let text_info: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Мы можем запомнить пароль, чтобы вам больше не нужно было вводить его на ваших устройствах, подключенных к iCloude."
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "SFProDisplay-Light", size: 14)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private let textField_password: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Пароль"
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
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let checkbox: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "square"), for: .normal)
        button.setImage(UIImage.init(systemName: "checkmark.square"), for: .selected)
        button.tintColor = .secondaryLabel
        button.addTarget(self, action: #selector(toggleCheckboxSelection), for: .touchUpInside)
        return button
    }()
    
    private let text_savePass: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сохранить пароль"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "SFProDisplay-Light", size: 13)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
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
        view.addSubview(textField_password)
        view.addSubview(checkbox)
        view.addSubview(text_savePass)
        view.addSubview(button_Next)
    }
    
    @objc private func func_BackToSignIn() {
        dismiss(animated: true)
    }
    
    @objc private func func_Next() {
        ///
    }
    
    @objc private func toggleCheckboxSelection() {
        checkbox.isSelected = !checkbox.isSelected
    }
    
    private func setDelegates() {
        textField_password.delegate = self
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
extension SignUpViewController3 {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            button_BackToSignIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            button_BackToSignIn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            text_CreateName.topAnchor.constraint(equalTo: button_BackToSignIn.bottomAnchor, constant: 3),
            text_CreateName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_CreateName.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            text_info.topAnchor.constraint(equalTo: text_CreateName.bottomAnchor, constant: 15),
            text_info.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_info.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            textField_password.topAnchor.constraint(equalTo: text_info.bottomAnchor, constant: 20),
            textField_password.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField_password.widthAnchor.constraint(equalToConstant: 350),
            textField_password.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: textField_password.bottomAnchor, constant: 15),
            checkbox.leadingAnchor.constraint(equalTo: textField_password.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            text_savePass.topAnchor.constraint(equalTo: textField_password.bottomAnchor, constant: 17.5),
            text_savePass.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            button_Next.topAnchor.constraint(equalTo: checkbox.bottomAnchor, constant: 20),
            button_Next.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button_Next.widthAnchor.constraint(equalToConstant: 350),
            button_Next.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: UITextFieldDelegate
extension SignUpViewController3: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        return true
    }
}
