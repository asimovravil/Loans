//
//  SceneDelegate.swift
//  Loans
//
//  Created by Ravil on 14.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let isUserLoggedIn = UserDefaults.standard.string(forKey: "userEmail") != nil && UserDefaults.standard.string(forKey: "userPassword") != nil

        window.rootViewController = isUserLoggedIn ?
            UINavigationController(rootViewController: TabBarViewController()) :
            UINavigationController(rootViewController: TabBarWhiteViewController())

        window.makeKeyAndVisible()
        self.window = window
    }
}

