//
//  Car.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

struct Car: Decodable, Encodable {
	var manufacturer: String
	var model: String
	var body: Body
	var yearOfIssue: Int?
	var carNumber: String?
	
	enum Body: String, Decodable, Encodable, CaseIterable {
		case sedan
		case coupe
		case hatchback
		case SUV
	}
	
	public init(manufacturer: String, model: String, body: Body, yearOfIssue: Int?, carNumber: String?) {
		self.manufacturer = manufacturer
		self.model = model
		self.body = body
		self.yearOfIssue = yearOfIssue
		self.carNumber = carNumber
	}
}
