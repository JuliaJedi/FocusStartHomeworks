//
//  CarsAssembly.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 02.11.2020.
//

final class CarsAssembly {
	static func createModule() -> CarsViewController {
		let interactor = CarsInteractor()
		let router = CarsRouter()
		let presenter = CarsPresenter(interactor: interactor, router: router)
		let viewController = CarsViewController(presenter: presenter)
		
		return viewController
	}
}
