//
//  CarFilterPresenter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

final class CarFilterPresenter {
	private var viewController: CarFilterTableViewController?
	private var ui: CarFilterTable?
	
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
		self.ui?.carFilterViewDelegate?.filter(body: carBody)
		self.viewController?.dismiss(animated: true, completion: nil)
	}
}
