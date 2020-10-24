//
//  CarsPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarsPresenter {
	private let router: CarsRouter
	private let interactor: CarsInteractor
	private var viewController: CarsViewController?
	private var ui: CarsView?
	
	init(interactor: CarsInteractor, router: CarsRouter) {
		self.interactor = interactor
		self.router = router
	}
	
	func didLoad(ui: CarsView, viewController: CarsViewController) {
		self.viewController = viewController
		self.ui = ui
		self.getCars()
		
		viewController.addButton = { [weak self] in
			self?.addNewCar()
		}
		
		viewController.filterButton = { [weak self] in
			self?.filterCars()
		}
	}
}

private extension CarsPresenter {
	func getCars() {
		self.interactor.getCars { [weak self] cars in
			self?.ui?.cars = cars
		}
	}
	
	func addNewCar() {
		self.router.pushToAddNewCar(navigationController: (self.viewController?.navigationController)!)
	}
	
	func filterCars() {
		let filterCarModule = CarFilterRouter.createModule()
		filterCarModule.carsFilterView.carFilterViewDelegate = self.ui
		let navigationController = UINavigationController(rootViewController: filterCarModule)
		self.viewController?.present(navigationController, animated: true, completion: nil)
	}
}
