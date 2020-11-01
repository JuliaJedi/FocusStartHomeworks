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
	private weak var viewController: CarsViewController?
	private weak var ui: ICarsView?
	
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
		self.router.openAddNewCar(navigationController: (self.viewController?.navigationController)!)
	}
	
	func filterCars() {
		let filterCarModule = CarFilterAssembly.createModule()
		filterCarModule.carsFilterView.carViewDelegate = self.ui
		
		let navigationController = UINavigationController(rootViewController: filterCarModule)
		
		if let viewController = self.viewController {
			self.router.openFilter(navigationController: navigationController, viewController: viewController)
		}
	}
}
