//
//  CodeCell.swift
//  Instagram
//
//  Created by Ivan White on 26.07.2022.
//

import UIKit


class CodeCell: UITableViewCell {
    
    private let text_Country: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Австралия"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Light", size: 16)
        return label
    }()
    
    private let text_Code: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+61"
        label.textColor = #colorLiteral(red: 0.4596298191, green: 0.4560158735, blue: 0.501960814, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Light", size: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setContrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        self.addSubview(text_Country)
        self.addSubview(text_Code)
    }
    
    public func cellConfigure(region: Region) {
        text_Country.text = region.country
        text_Code.text = region.code
    }
    
}

// MARK: - setContrains
extension CodeCell {
    private func setContrains() {
        NSLayoutConstraint.activate([
            text_Country.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            text_Country.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            text_Code.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            text_Code.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

