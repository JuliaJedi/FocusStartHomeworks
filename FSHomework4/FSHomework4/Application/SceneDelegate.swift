//
//  SceneDelegate.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	private let coordinatingController = CoordinatingController()
	private lazy var containerController = ContainerController(coordinatingController: self.coordinatingController)
	
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		if let windowScene = scene as? UIWindowScene {
			self.window = UIWindow(windowScene: windowScene)
			self.window?.rootViewController = self.containerController
			self.window?.makeKeyAndVisible()
		}
	}
}

