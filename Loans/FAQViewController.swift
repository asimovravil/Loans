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
        CellData(question: "Что такое займ?", answer: "Займ - это денежное обязательство, которое одна сторона берет у другой стороны с обязательством вернуть его с уплатой процентов."),
        CellData(question: "Какие виды займов существуют?", answer: "Существует множество видов займов, включая потребительские займы, ипотеки, кредитные карты, микрозаймы и др."),
        CellData(question: "Разница - кредитом и займом?", answer: "Основное отличие между кредитом и займом заключается в том, что кредит предоставляется банком, а займ - частными организациями или лицами."),
        CellData(question: "Процентная ставка по займу это?", answer: "Процентная ставка по займу - это процент, который заемщик обязан выплатить сверх суммы займа как вознаграждение за пользование деньгами."),
        CellData(question: "Документы для займа", answer: "Документы могут варьироваться, но обычно требуются удостоверение личности, справка о доходах и банковские реквизиты."),
        CellData(question: "Что такое кредитный рейтинг?", answer: "Кредитный рейтинг - это числовая оценка, отражающая кредитоспособность заемщика. Он влияет на возможность получения займа и условия его предоставления."),
        CellData(question: "Какие риски связаны с займами?", answer: "Риски могут включать высокие проценты, задолженность, потерю имущества при невыплате, и повреждение кредитного рейтинга."),
        CellData(question: "Советы по управлению займами?", answer: "Управляйте финансами, следите за кредитным рейтингом, берите займы только при необходимости и сравнивайте условия разных кредиторов."),
        CellData(question: "Что такое займ под залог?", answer: "Займ под залог - это займ, для получения которого заемщик предоставляет в залог какое-либо имущество или ценности."),
        CellData(question: "Вернуть займ раньше срока", answer: "Да, обычно можно вернуть займ раньше срока, но могут быть условия и штрафы за досрочное погашение."),
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
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
