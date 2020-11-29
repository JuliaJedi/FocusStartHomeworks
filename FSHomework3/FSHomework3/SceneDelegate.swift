//
//  SceneDelegate.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			self.window = UIWindow(windowScene: windowScene)
			self.window?.rootViewController = TabBarController()
			self.window?.makeKeyAndVisible()
		}
	}
}

