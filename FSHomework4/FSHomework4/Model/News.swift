//
//  News.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

struct News: Decodable, Encodable {
	var title: String
	var text: String?
	var date: Date?
	var details: Details
}

struct Details: Decodable, Encodable {
	var text: String
	var firstImage: String
	var secondImage: String
}
