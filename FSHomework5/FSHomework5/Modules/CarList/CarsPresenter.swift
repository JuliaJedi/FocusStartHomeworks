//
//  CarsPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

protocol ICarsPresenter {
	func viewDidLoad(ui: ICarsView, viewController: CarsViewController)
}

final class CarsPresenter {
	private let router: ICarsRouter
	private let interactor: ICarsInteractor
	private weak var viewController: CarsViewController?
	private weak var ui: ICarsView?
	
	init(interactor: ICarsInteractor, router: ICarsRouter) {
		self.interactor = interactor
		self.router = router
	}
}

extension CarsPresenter: ICarsPresenter {
	func viewDidLoad(ui: ICarsView, viewController: CarsViewController) {
		self.viewController = viewController
		self.ui = ui
		self.getCars()
		
		self.viewController?.addButton = { [weak self] in
			self?.addNewCar()
		}
		
		self.viewController?.filterButton = { [weak self] in
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
		if let viewController = self.viewController, let navigationController = viewController.navigationController {
			self.router.openAddNewCar(navigationController: navigationController)
		}
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
