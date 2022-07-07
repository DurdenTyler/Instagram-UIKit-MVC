//
//  SignInViewController.swift
//  Instagram
//
//  Created by Ivan White on 23.06.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let authService = AuthService.shared
    
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
        textfield.font = UIFont(name: "SFProDisplay-Light", size: 15)
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
        textfield.font = UIFont(name: "SFProDisplay-Light", size: 15)
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
        button.tintColor = #colorLiteral(red: 0.3647058824, green: 0.5525633527, blue: 0.8431372549, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 13)
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
        button.backgroundColor = #colorLiteral(red: 0.4705882353, green: 0.7543902329, blue: 0.9803921569, alpha: 1)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private let view_separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = #colorLiteral(red: 0.9061687589, green: 0.9061687589, blue: 0.9061687589, alpha: 1)
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
        separator.backgroundColor = #colorLiteral(red: 0.9061687589, green: 0.9061687589, blue: 0.9061687589, alpha: 1)
        return separator
    }()
    
    private let image_FB: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "facebook")
        return logo
    }()
    
    private let button_signInWithFB: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти через Facebook", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3647058824, green: 0.5525633527, blue: 0.8431372549, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 13)
        button.addTarget(self, action: #selector(func_SignInFB), for: .touchUpInside)
        return button
    }()
    
    private let view_separator3: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = #colorLiteral(red: 0.9061687589, green: 0.9061687589, blue: 0.9061687589, alpha: 1)
        return separator
    }()
    
    private let text_notAcc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "У вас нет аккаунта?"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "SFProDisplay-Light", size: 13)
        return label
    }()
    
    private let button_signUp: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрируйтесь", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3647058824, green: 0.5525633527, blue: 0.8431372549, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 13)
        button.addTarget(self, action: #selector(func_SignUp), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        addTaps()
        setDelegates()
    }
    
    private func setDelegates() {
        textField_login.delegate = self
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
        view.addSubview(button_signInWithFB)
        view.addSubview(image_FB)
        view.addSubview(view_separator3)
        view.addSubview(text_notAcc)
        view.addSubview(button_signUp)
    }
    
    @objc private func forgetPass() {
        //
    }
    
    @objc private func func_SignInFB() {
        //
    }
    
    @objc private func func_SignUp() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc private func signIn() {
        var email: String?
        var username: String?
        var phoneNumber: String?
        
        guard let login = textField_login.text else { return }
        guard let password = textField_password.text else { return }
        guard login.count >= 4 else { return }
        guard password.count >= 4 else { return }
        
        if login.contains("@") && login.contains(".") {
            email = login
            
        } else if !login.contains("1") || !login.contains("2") || !login.contains("3") || !login.contains("4") || !login.contains("5") || !login.contains("6") || !login.contains("7") || !login.contains("8") || !login.contains("9") {
            username = login
            
        } else {
            phoneNumber = login
            
        }
        
        authService.signIn(email: email, username: username, phoneNumber: phoneNumber, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.dismiss(animated: true, completion: nil)
                case .failure(let error):
                    let alert = UIAlertController(title: "Ошибка входа", message: "Мы не можем залогинить тебя", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Скрыть", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}


// MARK: Constraints
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
        
        NSLayoutConstraint.activate([
            button_signInWithFB.topAnchor.constraint(equalTo: text_or.bottomAnchor, constant: 25),
            button_signInWithFB.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            image_FB.topAnchor.constraint(equalTo: text_or.bottomAnchor, constant: 30),
            image_FB.trailingAnchor.constraint(equalTo: button_signInWithFB.leadingAnchor, constant: -5),
            image_FB.heightAnchor.constraint(equalToConstant: 19),
            image_FB.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            view_separator3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            view_separator3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view_separator3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view_separator3.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            text_notAcc.topAnchor.constraint(equalTo: view_separator3.bottomAnchor, constant: 29.5),
            text_notAcc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 76)
        ])
        
        NSLayoutConstraint.activate([
            button_signUp.topAnchor.constraint(equalTo: view_separator3.bottomAnchor, constant: 24),
            button_signUp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -76)
        ])
    }
}


// MARK: UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField_login.resignFirstResponder()
        return textField_password.resignFirstResponder()
    }
}

