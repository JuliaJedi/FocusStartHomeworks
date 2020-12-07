//
//  CarFilterAssembly.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 02.11.2020.
//

final class CarFilterAssembly {
	static func createModule() -> CarFilterTableViewController {
		let router = CarFilterRouter()
		let presenter = CarFilterPresenter(router: router)
		let viewController = CarFilterTableViewController(presenter: presenter)
		
		return viewController
	}
}
