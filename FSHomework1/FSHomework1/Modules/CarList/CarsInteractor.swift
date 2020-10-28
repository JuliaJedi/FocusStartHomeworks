//
//  CarsInteractor.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import Foundation

final class CarsInteractor {
	func getCars(completion: @escaping ([Car]) -> (Void)) {
		let carsArray: [Car] = self.readFromJSON()
		completion(carsArray)
	}
}

private extension CarsInteractor {
	func readFromJSON() -> [Car] {
		do {
			if let path = Bundle.main.path(forResource: "Cars", ofType: "json") {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let jsonData = try JSONDecoder().decode([Car].self, from: data)
				return jsonData
			}
		}
		catch {
			assertionFailure("Не удалось распарсить json")
		}
		return []
	}
}
