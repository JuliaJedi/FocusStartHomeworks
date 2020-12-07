//
//  CarsInteractor.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import Foundation

protocol ICarsInteractor {
	func getCars(completion: @escaping ([Car]) -> (Void))
}

final class CarsInteractor {
	private let carsLoad: ICarsLoad
	
	init(carsLoad: ICarsLoad) {
		self.carsLoad = carsLoad
	}
}

extension CarsInteractor: ICarsInteractor {
	func getCars(completion: @escaping ([Car]) -> (Void)) {
		let carsArray: [Car] = self.carsLoad.readFromJSON()
		completion(carsArray)
	}
}
