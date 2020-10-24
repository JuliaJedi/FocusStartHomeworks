//
//  NewCarInteractor.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import Foundation

final class NewCarInteractor {
	var presenter: NewCarPresenter?
	
	func updateCars(newCar: Car) {
		self.writeToJSON(newCar: newCar)
	}
}

private extension NewCarInteractor {
	func writeToJSON(newCar: Car) {
		do {
			if let path = Bundle.main.path(forResource: "Cars", ofType: "json") {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				var cars = try JSONDecoder().decode([Car].self, from: data)
				cars.append(newCar)
				let updatedCars = try JSONEncoder().encode(cars)
				try updatedCars.write(to: URL(fileURLWithPath: path))
			}
		}
		catch {
			assertionFailure("Не удалось распарсить json")
		}
	}
}
