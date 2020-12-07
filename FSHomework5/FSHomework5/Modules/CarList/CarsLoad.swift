//
//  CarsLoad.swift
//  FSHomework5
//
//  Created by Афанасьева Юлия Геннадьевна on 07.12.2020.
//

import Foundation

protocol ICarsLoad {
	func readFromJSON() -> [Car]
}

final class CarsLoad: ICarsLoad {
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
