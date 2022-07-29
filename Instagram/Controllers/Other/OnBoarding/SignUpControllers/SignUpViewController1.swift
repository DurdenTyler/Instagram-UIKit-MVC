//
//  SignUpViewController3.swift
//  Instagram
//
//  Created by Ivan White on 18.07.2022.
//

import UIKit

class SignUpViewController1: UIViewController {
    
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
        label.text = "Введите телефон или электронный адрес"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let segControl: UISegmentedControl = {
        let titles = ["Телефон", "Эл. адрес"]
        let seg = UISegmentedControl(items: titles)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 0
        seg.backgroundColor = .none
        seg.selectedSegmentTintColor = .none
        seg.setTitleTextAttributes([.foregroundColor : UIColor.black, .font : UIFont(name: "SFProDisplay-Bold", size: 17)!], for: .selected)
        seg.setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .normal)
        seg.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
        return seg
    }()
    
    private let pickerAndTextfield = PickerAndTextfield()
    
    private let textField_email: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Электронный адрес"
        textfield.backgroundColor = #colorLiteral(red: 0.9536301494, green: 0.9779675603, blue: 0.977543056, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .next
        textfield.borderStyle = .roundedRect
        textfield.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textfield.layer.borderWidth = 0.5
        textfield.font = UIFont(name: "SFProDisplay-Light", size: 15)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        textfield.isHidden = true
        return textfield
    }()
    
    private let button_Next: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.backgroundColor = .specialLightBlue
        button.addTarget(self, action: #selector(func_Next), for: .touchUpInside)
        return button
    }()
    
    private let text_info: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вы можете получать от нас SMS-уведомления в целях безопасности и выполнения входа."
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "SFProDisplay-Light", size: 12)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        addTaps()
        setDelegates()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        buttonConfigure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button_BackToSignIn)
        view.addSubview(text_CreateName)
        view.addSubview(segControl)
        view.addSubview(pickerAndTextfield)
        view.addSubview(textField_email)
        view.addSubview(button_Next)
        view.addSubview(text_info)
    }
    
    private func setDelegates() {
        pickerAndTextfield.delegate = self
    }
    
    @objc private func func_BackToSignIn() {
        dismiss(animated: true)
    }
    
    @objc private func func_Next() {
        ///
    }
    
    @objc private func segmentChange() {
        if segControl.selectedSegmentIndex == 0 {
            textField_email.isHidden = true
            pickerAndTextfield.isHidden = false
        } else {
            textField_email.isHidden = false
            pickerAndTextfield.isHidden = true
        }
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
    
    private func buttonConfigure() {
        if pickerAndTextfield.textField.text != "" || textField_email.text != "" {
            button_Next.backgroundColor = .specialActiveBlue
        } else {
            button_Next.backgroundColor = .specialLightBlue
        }
    }


}

// MARK: Constraints
extension SignUpViewController1 {
    
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
            segControl.topAnchor.constraint(equalTo: text_CreateName.bottomAnchor, constant: 20),
            segControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            segControl.widthAnchor.constraint(equalToConstant: 300),
            segControl.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            pickerAndTextfield.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: 15),
            pickerAndTextfield.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pickerAndTextfield.heightAnchor.constraint(equalToConstant: 40),
            pickerAndTextfield.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            textField_email.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: 15),
            textField_email.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField_email.heightAnchor.constraint(equalToConstant: 40),
            textField_email.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            button_Next.topAnchor.constraint(equalTo: pickerAndTextfield.bottomAnchor, constant: 15),
            button_Next.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button_Next.heightAnchor.constraint(equalToConstant: 40),
            button_Next.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            text_info.topAnchor.constraint(equalTo: button_Next.bottomAnchor, constant: 15),
            text_info.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_info.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}

extension SignUpViewController1: ChangeCodeProtocol {
    func changeCode() {
        let vc = CodesTableViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
