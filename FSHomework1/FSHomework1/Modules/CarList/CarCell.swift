//
//  CarCell.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarCell: UICollectionViewCell {
	static var identifier: String = "Cell"
	weak var textLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		let textLabel = UILabel(frame: .zero)
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.lineBreakMode = .byWordWrapping
		textLabel.numberOfLines = 0
		self.contentView.addSubview(textLabel)
		NSLayoutConstraint.activate([
			self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
			self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
		])
		self.textLabel = textLabel
		self.reset()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		self.reset()
	}
	
	func reset() {
		self.textLabel.textAlignment = .center
	}
	
	func configure(manufacturer: String, model: String, body: Car.Body, yearOfIssue: Int?, carNumber: String?) {
		var changedYearOfIssue: String = "-"
		if let yearOfIssue = yearOfIssue {
			changedYearOfIssue = String(yearOfIssue)
		}
		
		var text = "Производитель: " + manufacturer + "\n" +
			"Модель: " + model + "\n" +
			"Тип кузова: " + body.rawValue + "\n" +
			"Год выпуска: " + changedYearOfIssue + "\n"
		
		if let carNumber = carNumber {
			if carNumber != "" {
				text.append("Гос. номер: " + carNumber)
			}
		}
		
		self.textLabel.text = text
	}
}
