//
//  NewCarRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class NewCarRouter {
	static func createModule() -> NewCarViewController {
		let interactor = NewCarInteractor()
		let router = NewCarRouter()
		let presenter = NewCarPresenter(interactor: interactor, router: router)
		let viewController = NewCarViewController(presenter: presenter)
		
		return viewController
	}
	
	func pushToCarsView(navigationController: UINavigationController) {
		let carsModule = CarsRouter.createModule()
		navigationController.pushViewController(carsModule, animated: true)
	}
}
