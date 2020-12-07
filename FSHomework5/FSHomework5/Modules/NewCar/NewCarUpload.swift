//
//  NewCarUpload.swift
//  FSHomework5
//
//  Created by Афанасьева Юлия Геннадьевна on 07.12.2020.
//

import Foundation

protocol INewCarUpload {
	func writeToJSON(newCar: Car)
}

final class NewCarUpload: INewCarUpload {
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
