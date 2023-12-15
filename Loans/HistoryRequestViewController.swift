//
//  HistoryRequestViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

struct LoanRequest {
    var amount: String
    var date: String
}

class HistoryRequestViewController: UIViewController {
    
    var loanRequests = [LoanRequest]()

    let historyLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateHistoryCell(_:)), name: NSNotification.Name("LoanAmountNotification"), object: nil)
    }
}

extension HistoryRequestViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        historyLabel.text = "История займов"
        historyLabel.textColor = .black
        historyLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        historyLabel.textAlignment = .center
        historyLabel.numberOfLines = 0
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyLabel)
        
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 103
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
}

extension HistoryRequestViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            historyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                historyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                historyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
    
    @objc private func updateHistoryCell(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String: String],
           let loanAmount = userInfo["loanAmount"],
           let currentDate = userInfo["currentDate"] {
            let newLoanRequest = LoanRequest(amount: loanAmount, date: currentDate)
            loanRequests.append(newLoanRequest)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HistoryRequestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loanRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.reuseID, for: indexPath) as? HistoryCell else {
            fatalError("Could not cast to HistoryCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        let loanRequest = loanRequests[indexPath.row]
        cell.labelAmount.text = loanRequest.amount
        cell.descAmount.text = "На рассмотрении \(loanRequest.date)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
