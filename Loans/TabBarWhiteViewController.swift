//
//  TabBarWhiteViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class TabBarWhiteViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addedTabBarSetup()
    }
        
    private func addedTabBarSetup() {
        let tab1 = UINavigationController(rootViewController: WhiteLoansViewController())
        let tab2 = UINavigationController(rootViewController: WhiteCardsViewController())
        let tab3 = ProfileViewController()
        let tab4 = UINavigationController(rootViewController: SupportViewController())
        let tab5 = UINavigationController(rootViewController: FAQViewController())
        
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        
        tab1.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "tab1")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "tab1Active")?.withRenderingMode(.alwaysOriginal)
        )

        tab2.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "tab6")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "tab6Active")?.withRenderingMode(.alwaysOriginal)
        )
        
        tab3.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "tab7")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "tab7Active")?.withRenderingMode(.alwaysOriginal)
        )
        
        tab4.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "tab4")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "tab4Active")?.withRenderingMode(.alwaysOriginal)
        )
        
        tab5.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "tab5")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "tab5Active")?.withRenderingMode(.alwaysOriginal)
        )
        
        viewControllers = [tab1, tab2, tab3, tab4, tab5]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

