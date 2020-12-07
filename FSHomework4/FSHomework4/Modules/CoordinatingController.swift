//
//  CoordinatingController.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

protocol INavigationModule {
	var viewController: UIViewController { get }
	func set<Parameters>(parameters: Parameters) 
}

enum Module {
	case master
	case detail
}

final class CoordinatingController {
	private var modules = [Module: INavigationModule]()
	
	func register(module: Module, navigationModule: INavigationModule) {
		self.modules[module] = navigationModule
	}
}

extension CoordinatingController {
	func showDetailViewController(news: News) {
		guard let masterNavigationModule = self.modules[.master],
			  let detailNavigationModule = self.modules[.detail] else {
			assertionFailure("Modules didn't registered")
			return
		}
		
		detailNavigationModule.set(parameters: news)
		let navigationController = UINavigationController(rootViewController: detailNavigationModule.viewController)
		masterNavigationModule.viewController.showDetailViewController(navigationController, sender: nil)
	}
}
