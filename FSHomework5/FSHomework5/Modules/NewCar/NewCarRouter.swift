//
//  NewCarRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

protocol INewCarRouter {
	func openCars(navigationController: UINavigationController)
}

final class NewCarRouter: INewCarRouter {
	func openCars(navigationController: UINavigationController) {
		let carsModule = CarsAssembly.createModule()
		navigationController.pushViewController(carsModule, animated: true)
	}
}
