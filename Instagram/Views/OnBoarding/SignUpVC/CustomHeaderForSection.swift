//
//  CustomHeaderForSection.swift
//  Instagram
//
//  Created by Ivan White on 29.07.2022.
//

import UIKit

class CustomHeaderForSection: UIView {
    
    private let view_Background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ВСЕ СТРАНЫ"
        label.textColor = .darkGray
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        return label
    }()
    
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
        
        self.addSubview(text)

    }
}


// MARK: Constraints
extension CustomHeaderForSection {
    
    private func setConstraints() {


        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            text.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
}
