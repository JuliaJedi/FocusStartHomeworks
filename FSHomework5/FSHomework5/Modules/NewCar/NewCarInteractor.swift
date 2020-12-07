//
//  NewCarInteractor.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import Foundation

protocol INewCarInteractor {
	func updateCars(newCar: Car)
}

final class NewCarInteractor {
	private let newCarUpload: INewCarUpload
	
	init(newCarUpload: INewCarUpload) {
		self.newCarUpload = newCarUpload
	}
}

extension NewCarInteractor: INewCarInteractor {
	func updateCars(newCar: Car) {
		self.newCarUpload.writeToJSON(newCar: newCar)
	}
}
