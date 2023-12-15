//
//  WhiteCreditsViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class WhiteCreditsViewController: UIViewController {

    let creditLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
}

extension WhiteCreditsViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        creditLabel.text = "Кредиты"
        creditLabel.textColor = .black
        creditLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        creditLabel.textAlignment = .center
        creditLabel.numberOfLines = 0
        creditLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditLabel)
        
        tableView.register(CreditsWhiteCell.self, forCellReuseIdentifier: CreditsWhiteCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 113
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
}

extension WhiteCreditsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            creditLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: creditLabel.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                creditLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                creditLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}

extension WhiteCreditsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreditsWhiteCell.reuseID, for: indexPath) as? CreditsWhiteCell else {
            fatalError("Could not cast to CreditsWhiteCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
