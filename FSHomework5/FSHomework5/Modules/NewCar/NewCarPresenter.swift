//
//  NewCarPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

protocol INewCarPresenter {
	func viewDidLoad(ui: INewCarView, viewController: NewCarViewController)
}

final class NewCarPresenter {
	private let router: INewCarRouter
	private let interactor: INewCarInteractor
	private weak var viewController: NewCarViewController?
	private weak var ui: INewCarView?
	
	init(interactor: INewCarInteractor, router: INewCarRouter) {
		self.interactor = interactor
		self.router = router
	}
}

extension NewCarPresenter: INewCarPresenter {
	func viewDidLoad(ui: INewCarView, viewController: NewCarViewController) {
		self.viewController = viewController
		self.ui = ui
		
		self.ui?.onTapCreateNewCar = { [weak self] result in
			self?.updateCars(newCar: result)
		}
	}
}

private extension NewCarPresenter {
	func updateCars(newCar: Car) {
		self.interactor.updateCars(newCar: newCar)
		
		if let viewController = self.viewController, let navigationController = viewController.navigationController {
			self.router.openCars(navigationController: navigationController)
		}
	}
}
