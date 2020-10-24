//
//  CarFilterRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import Foundation

final class CarFilterRouter {
	static func createModule() -> CarFilterTableViewController {
		let viewController = CarFilterTableViewController(presenter: CarFilterPresenter())
		return viewController
	}
}
