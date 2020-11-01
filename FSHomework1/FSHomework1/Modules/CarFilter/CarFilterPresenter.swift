//
//  CarFilterPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

final class CarFilterPresenter {
	private let router: CarFilterRouter
	private weak var viewController: CarFilterTableViewController?
	private weak var ui: ICarFilterTable?
	
	init(router: CarFilterRouter) {
		self.router = router
	}
	
	func didLoad(ui: CarFilterTable, viewController: CarFilterTableViewController) {
		self.viewController = viewController
		self.ui = ui
		
		self.ui?.didSelectBody = { [weak self] carBody in
			self?.saveFilter(carBody: carBody)
		}
	}
}

private extension CarFilterPresenter {
	func saveFilter(carBody: Car.Body) {
		self.ui?.carViewDelegate?.set(selectedBody: carBody)
		
		if let viewController = self.viewController {
			self.router.closeFilter(viewController: viewController)
		}
	}
}
