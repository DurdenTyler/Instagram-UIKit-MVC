//
//  CodesCollectionViewController.swift
//  Instagram
//
//  Created by Ivan White on 26.07.2022.
//

import UIKit

class CodesTableViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.bounces = true
        table.showsHorizontalScrollIndicator = true
        table.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        return table
    }()
    
    private let text_ChooseCountry: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выберите страну"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        return label
    }()
    
    private let button_back: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отмена", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Light", size: 17)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    private let idTableCodeCell = "idTableCodeCell"
    
    override func viewDidLoad() {
        setupViews()
        setContraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(CodeCell.self, forCellReuseIdentifier: idTableCodeCell)
        view.addSubview(text_ChooseCountry)
        view.addSubview(button_back)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @objc private func back() {
        dismiss(animated: true)
    }
    
    private let regions = [
        Region(country: "Австралия", code: "+61"),
        Region(country: "Австрия", code: "+43"),
        Region(country: "Германия", code: "+49"),
        Region(country: "Россия", code: "+7"),
        Region(country: "Соединенные Штаты Америки", code: "+1")
    ]
}

// MARK: - CodesTableViewController: Constraints
extension CodesTableViewController {
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            button_back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            button_back.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            text_ChooseCountry.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text_ChooseCountry.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
   }
}

// MARK: - CodesTableViewController: UITableViewDataSource
extension CodesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        regions.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeader = CustomHeaderForSection()
        return customHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableCodeCell, for: indexPath) as? CodeCell else {
            return UITableViewCell()
        }
        let region = regions[indexPath.row]
        cell.cellConfigure(region: region)
        return cell
    }
}

// MARK: - CodesTableViewController: UITableViewDelegate
extension CodesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        35
    }
}


struct Region {
    let country: String
    let code: String
}
