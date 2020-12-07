//
//  NewCarAssembly.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 02.11.2020.
//

final class NewCarAssembly {
	static func createModule() -> NewCarViewController {
		let newCarUpload = NewCarUpload()
		let interactor = NewCarInteractor(newCarUpload: newCarUpload)
		let router = NewCarRouter()
		let presenter = NewCarPresenter(interactor: interactor, router: router)
		let viewController = NewCarViewController(presenter: presenter)
		
		return viewController
	}
}
