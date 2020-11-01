//
//  NewCarPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

final class NewCarPresenter {
	private let router: NewCarRouter
	private let interactor: NewCarInteractor
	private weak var viewController: NewCarViewController?
	private weak var ui: INewCarView?
	
	init(interactor: NewCarInteractor, router: NewCarRouter) {
		self.interactor = interactor
		self.router = router
	}
	
	func didLoad(ui: NewCarView, viewController: NewCarViewController) {
		self.viewController = viewController
		self.ui = ui
		
		ui.onTapCreateNewCar = { [weak self] result in
			self?.updateCars(newCar: result)
		}
	}
}

extension NewCarPresenter {
	func updateCars(newCar: Car) {
		self.interactor.updateCars(newCar: newCar)
		self.router.openCars(navigationController: (self.viewController?.navigationController)!)
	}
}
