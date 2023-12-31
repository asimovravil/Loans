//
//  HistoryRequestViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

struct LoanRequest: Codable {
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
        loadLoanRequests()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveLoanRequests()
    }
    
    func saveLoanRequests() {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(loanRequests)
            UserDefaults.standard.set(encoded, forKey: "SavedLoanRequests")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error saving loan requests: \(error)")
        }
    }
    
    func loadLoanRequests() {
        if let savedRequests = UserDefaults.standard.object(forKey: "SavedLoanRequests") as? Data {
            let decoder = JSONDecoder()
            if let loadedRequests = try? decoder.decode([LoanRequest].self, from: savedRequests) {
                loanRequests = loadedRequests
            }
        }
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
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

extension HistoryRequestViewController: LoanRequestDelegate {
    func didReceiveNewLoanRequest(amount: String, date: String) {
        let newLoanRequest = LoanRequest(amount: amount, date: date)
        loanRequests.append(newLoanRequest)
        saveLoanRequests()
        tableView.reloadData()
    }
}
