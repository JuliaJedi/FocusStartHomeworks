//
//  CarsRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarsRouter {
	static func createModule() -> CarsViewController {
		let interactor = CarsInteractor()
		let router = CarsRouter()
		let presenter = CarsPresenter(interactor: interactor, router: router)
		let viewController = CarsViewController(presenter: presenter)
		
		interactor.presenter = presenter
		
		return viewController
	}
	
	func pushToAddNewCar(navigationController: UINavigationController) {
		let newCarModule = NewCarRouter.createModule()
		navigationController.pushViewController(newCarModule, animated: true)
	}
}
