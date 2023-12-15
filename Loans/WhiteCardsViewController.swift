//
//  WhiteCardsViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class WhiteCardsViewController: UIViewController {

    let cardLabel = UILabel()
    let cardSubLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
}

extension WhiteCardsViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        cardLabel.text = "Карты"
        cardLabel.textColor = .black
        cardLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        cardLabel.textAlignment = .center
        cardLabel.numberOfLines = 0
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardLabel)
        
        cardSubLabel.text = "Кредитные"
        cardSubLabel.textColor = .black
        cardSubLabel.font = UIFont(name: "Inter-Medium", size: 18)
        cardSubLabel.textAlignment = .center
        cardSubLabel.numberOfLines = 0
        cardSubLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardSubLabel)
        
        tableView.register(CardWhiteCell.self, forCellReuseIdentifier: CardWhiteCell.reuseID)
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

extension WhiteCardsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardSubLabel.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 24),
            cardSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                cardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}

extension WhiteCardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardWhiteCell.reuseID, for: indexPath) as? CardWhiteCell else {
            fatalError("Could not cast to CardCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
