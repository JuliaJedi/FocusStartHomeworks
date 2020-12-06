//
//  ModelController.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class ModelController {
	static func getNews() -> [News] {
		do {
			if let path = Bundle.main.path(forResource: "splitViewData", ofType: "json") {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let jsonData = try JSONDecoder().decode([News].self, from: data)
				return jsonData
			}
		}
		catch {
			assertionFailure("Не удалось распарсить json")
		}
		return []
	}
}
