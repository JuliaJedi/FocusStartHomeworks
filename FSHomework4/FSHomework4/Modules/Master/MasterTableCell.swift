//
//  MasterTableCell.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class MasterTableCell: UITableViewCell {
	static let identifier = "id"
	
	private let titleLabel = UILabel()
	private let secondTitleLabel = UILabel()
	private let dateLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.configureCellLayout()
		self.configureCellAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(news: News) {
		self.titleLabel.text = news.title
		self.secondTitleLabel.text = news.text
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		
		if let date = news.date {
			self.dateLabel.text = dateFormatter.string(from: date)
		}
	}
}

// MARK: Layout
private extension MasterTableCell {
	func configureCellLayout() {
		self.configureTitleLabel()
		self.configureSecondTitleLabel()
		self.configureDateLabel()
	}
	
	func configureTitleLabel() {
		self.addSubview(self.titleLabel)
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.offset),
			self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.offset)
		])
	}
	
	func configureSecondTitleLabel() {
		self.addSubview(self.secondTitleLabel)
		self.secondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.secondTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.offset),
			self.secondTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.offset),
			self.secondTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.offset)
		])
	}
	
	func configureDateLabel() {
		self.addSubview(self.dateLabel)
		self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.offset),
			self.dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.offset)
		])
	}
}

// MARK: Appearance
private extension MasterTableCell {
	func configureCellAppearance() {
		self.configureTitleLabelAppearance()
		self.configureSecondTitleLabelAppearance()
	}
	
	func configureTitleLabelAppearance() {
		self.titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
		self.titleLabel.numberOfLines = 0
	}
	
	func configureSecondTitleLabelAppearance() {
		self.secondTitleLabel.numberOfLines = 0
	}
}
