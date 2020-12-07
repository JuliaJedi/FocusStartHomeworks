//
//  SceneDelegate.swift
//  FSHomework5
//
//  Created by Афанасьева Юлия Геннадьевна on 07.12.2020.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			self.window = UIWindow(windowScene: windowScene)
			guard let window = window else {
				return assertionFailure()
			}

			let rootView = CarsAssembly.createModule()

			let navigationController = UINavigationController()
			navigationController.navigationBar.prefersLargeTitles = true
			navigationController.viewControllers = [rootView]

			window.rootViewController = navigationController
			window.makeKeyAndVisible()
		}
	}
}
