//
//  WhiteLoansViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

enum LoansType {
    case credit
    case loans
}

class WhiteLoansViewController: UIViewController {

    let loansOnlineLabel = UILabel()
    let warningImage = UIImageView()
    
    let sections: [LoansType] = [.credit, .loans]
    
    lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CreditCell.self, forCellWithReuseIdentifier: CreditCell.reuseID)
        collectionView.register(LoansCell.self, forCellWithReuseIdentifier: LoansCell.reuseID)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sections[sectionIndex] ?? .credit
            switch section {
            case .credit:
                return self?.creditSection()
            case .loans:
                return self?.loansSection()
            }
        }
    }
    
    private func creditSection() -> NSCollectionLayoutSection {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(300),
                heightDimension: .absolute(160)
            ),
            subitems: [item]
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    
    private func loansSection() -> NSCollectionLayoutSection {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(390),
                heightDimension: .absolute(90)
            )
        )
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(90)
            ),
            subitem: item,
            count: 1
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 10,
            trailing: 0
        )
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(43)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
    }
}

extension WhiteLoansViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        loansOnlineLabel.text = "Займы онлайн"
        loansOnlineLabel.textColor = .black
        loansOnlineLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        loansOnlineLabel.textAlignment = .center
        loansOnlineLabel.numberOfLines = 0
        loansOnlineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loansOnlineLabel)
        
        warningImage.image = UIImage(named: "warning")
        warningImage.layer.masksToBounds = true
        warningImage.contentMode = .scaleAspectFill
        warningImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(warningImage)
        
        view.addSubview(mainCollectionView)
    }
}

extension WhiteLoansViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loansOnlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            warningImage.topAnchor.constraint(equalTo: loansOnlineLabel.bottomAnchor, constant: 24),
            warningImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainCollectionView.topAnchor.constraint(equalTo: warningImage.bottomAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                loansOnlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                loansOnlineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}


extension WhiteLoansViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .credit:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CreditCell.reuseID,
                for: indexPath
            ) as? CreditCell else {
                fatalError("Could not cast to CreditCell")
            }
            return cell
        case .loans:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LoansCell.reuseID,
                for: indexPath
            ) as? LoansCell else {
                fatalError("Could not cast to LoansCell")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .credit:
            return 3
        case .loans:
            return 10
        }
    }
}
