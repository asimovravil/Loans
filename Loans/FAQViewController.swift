//
//  FAQViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

struct CellData {
    var isExpanded: Bool = false
    var question: String
    var answer: String
}

class FAQViewController: UIViewController {

    let FAQLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    var data = [
        CellData(question: "Вопрос 1", answer: "Ответ 1"),
        CellData(question: "Вопрос 2", answer: "Ответ 2"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
}

extension FAQViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        FAQLabel.text = "FAQs"
        FAQLabel.textColor = .black
        FAQLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        FAQLabel.textAlignment = .center
        FAQLabel.numberOfLines = 0
        FAQLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(FAQLabel)
        
        tableView.register(FAQCell.self, forCellReuseIdentifier: FAQCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 64.0
        tableView.rowHeight = UITableView.automaticDimension        
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
}

extension FAQViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            FAQLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: FAQLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                FAQLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                FAQLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}

extension FAQViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQCell.reuseID, for: indexPath) as? FAQCell else {
            fatalError("Could not cast to FAQCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        let cellData = data[indexPath.row]
        cell.configure(with: cellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].isExpanded.toggle()

        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.row].isExpanded ? 99 : 64
    }
}
