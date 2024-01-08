//
//  WhiteCreditsViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class WhiteCreditsViewController: UIViewController {

    var credits: [Loan] = []
    let creditLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        loadCreditData()
    }
    
    private func loadCreditData() {
        let networkManager = NetworkManager()
        networkManager.fetchLoans { [weak self] loans, error in
            DispatchQueue.main.async {
                if let loans = loans {
                    self?.credits = loans.filter { $0.type == .credit }
                    self?.tableView.reloadData()
                } else if let error = error {
                    print("Ошибка: \(error)")
                }
            }
        }
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
        return credits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreditsWhiteCell.reuseID, for: indexPath) as? CreditsWhiteCell else {
            fatalError("Could not cast to CreditsWhiteCell")
        }
        let credit = credits[indexPath.row]
        cell.amountLabel.text = credit.amount
        cell.percentLabel.text = credit.title
        cell.webLoansLabel.text = credit.description
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        if let iconURL = URL(string: credit.icon) {
            cell.loadImage(from: iconURL)
        }
        return cell
    }
}

extension WhiteCreditsViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let credit = credits[indexPath.row]
        if let url = URL(string: credit.url) {
            openWebView(with: url)
        }
    }

    private func openWebView(with url: URL) {
        let webViewController = WebViewController()
        webViewController.url = url
        present(webViewController, animated: true)
    }
}
