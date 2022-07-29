//
//  PickerAndTextfield.swift
//  Instagram
//
//  Created by Ivan White on 18.07.2022.
//

import UIKit

protocol ChangeCodeProtocol: AnyObject {
    func changeCode()
}

class PickerAndTextfield: UIView {
    
    private let view_Background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9536301494, green: 0.9779675603, blue: 0.977543056, alpha: 1)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let button_code: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .none
        button.tintColor = #colorLiteral(red: 0.3647058824, green: 0.5525633527, blue: 0.8431372549, alpha: 1)
        button.setTitle("RU +7", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 13)
        button.addTarget(self, action: #selector(toChangeCode), for: .touchUpInside)
        return button
    }()
    
    private let view_Separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    let textField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Номер телефона"
        textfield.backgroundColor = .none
        textfield.textColor = .darkText
        textfield.clearButtonMode = .always
        textfield.keyboardType = .numberPad
        textfield.borderStyle = .none
        textfield.font = UIFont(name: "SFProDisplay-Light", size: 13)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        return textfield
    }()
    
    weak var delegate: ChangeCodeProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view_Background)
        self.addSubview(button_code)
        self.addSubview(view_Separator)
        self.addSubview(textField)

    }
    
    @objc private func toChangeCode() {
        delegate?.changeCode()
    }
}


// MARK: Constraints
extension PickerAndTextfield {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            view_Background.topAnchor.constraint(equalTo: self.topAnchor),
            view_Background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view_Background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view_Background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button_code.centerYAnchor.constraint(equalTo: view_Background.centerYAnchor),
            button_code.leadingAnchor.constraint(equalTo: view_Background.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            view_Separator.centerYAnchor.constraint(equalTo: view_Background.centerYAnchor),
            view_Separator.leadingAnchor.constraint(equalTo: button_code.trailingAnchor, constant: 10),
            view_Separator.widthAnchor.constraint(equalToConstant: 1),
            view_Separator.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view_Background.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view_Separator.trailingAnchor, constant: 2),
            textField.widthAnchor.constraint(equalToConstant: 233)
        ])
    }
}
