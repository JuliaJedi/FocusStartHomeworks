//
//  CarsRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarsRouter {
	func openAddNewCar(navigationController: UINavigationController) {
		let newCarModule = NewCarAssembly.createModule()
		navigationController.pushViewController(newCarModule, animated: true)
	}
	
	func openFilter(navigationController: UINavigationController, viewController: UIViewController) {
		viewController.present(navigationController, animated: true, completion: nil)
	}
}
