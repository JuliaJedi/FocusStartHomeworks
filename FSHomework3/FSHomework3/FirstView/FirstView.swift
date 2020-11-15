//
//  FirstView.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class FirstView: UIView {
	private var stackView = UIStackView()
	
	private var smallLabel = UILabel()
	private var mediumLabel = UILabel()
	private var largeLabel = UILabel()
	
	public var roundButton = UIButton()
	private var roundedButton = UIButton()
	
	private var image = UIImageView()
	private var activityIndicator = UIActivityIndicatorView()
	
	private enum Constants {
		static let offset: CGFloat = 8
		
		static let mediumFont: CGFloat = 20
		static let largeFont: CGFloat = 25
		
		static let roundButtonSize = CGSize(width: 50, height: 50)
		static let roundedButtonSize = CGSize(width: 150, height: 50)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.roundButton.layer.cornerRadius = self.roundButton.frame.size.width / 2
	}
	
	func configureView() {
		self.configureViewAppearance()
		self.configureLayout()
		
		self.layoutIfNeeded()
	}
}

// MARK: Appearance
private extension FirstView {
	func configureViewAppearance() {
		self.backgroundColor = .systemBackground
		
		self.configureSmallLabelAppearance()
		self.configureMediumLabelAppearance()
		self.configureLargeLabelAppearance()
		self.configureRoundButtonAppearance()
		self.configureRoundedButtonAppearance()
		self.configureImageAppearance()
		self.configureActivityIndicatorAppearance()
	}
	
	func configureSmallLabelAppearance() {
		self.smallLabel.text = "Small text"
		self.smallLabel.textAlignment = .center
		self.smallLabel.numberOfLines = 0
	}
	
	func configureMediumLabelAppearance() {
		self.mediumLabel.text = "Medium text"
		self.mediumLabel.textAlignment = .center
		self.mediumLabel.font = .monospacedDigitSystemFont(ofSize: Constants.mediumFont, weight: .bold)
		self.mediumLabel.numberOfLines = 0
	}
	
	func configureLargeLabelAppearance() {
		self.largeLabel.text = "Text text text text text text text text text text text text text text text"
		self.largeLabel.textAlignment = .center
		self.largeLabel.font = UIFont(name: "Kohinoor Bangla", size: Constants.largeFont)
		self.largeLabel.numberOfLines = 2
	}
	
	func configureRoundButtonAppearance() {
		self.roundButton.layer.borderWidth = 1
		self.roundButton.layer.borderColor = UIColor.black.cgColor
	}
	
	func configureRoundedButtonAppearance() {
		self.roundedButton.layer.cornerRadius = 8
		self.roundedButton.layer.borderWidth = 1
		self.roundedButton.layer.borderColor = UIColor.black.cgColor
	}
	
	func configureImageAppearance() {
		self.image.translatesAutoresizingMaskIntoConstraints = false
		self.image.image = UIImage(named: "cloud_mtn")
		self.image.contentMode = .scaleAspectFill
		self.image.clipsToBounds = true
	}
	
	func configureActivityIndicatorAppearance() {
		self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		self.activityIndicator.color = .black
		self.activityIndicator.startAnimating()
	}
}

// MARK: Layout
private extension FirstView {
	func configureLayout() {
		self.configureStackViewLayout()
		self.configureSmallLabelLayout()
		self.configureMediumLabelLayout()
		self.configureLargeLabelLayout()
		self.configureRoundButtonLayout()
		self.configureRoundedButtonLayout()
		self.configureImageLayout()
		self.configureActivityIndicatorLayout()
	}
	
	func configureStackViewLayout() {
		self.addSubview(self.stackView)
		self.stackView.translatesAutoresizingMaskIntoConstraints = false
		self.stackView.axis = .vertical
		self.stackView.alignment = .center
		self.stackView.distribution = .equalSpacing
		self.stackView.spacing = 8
		
		NSLayoutConstraint.activate([
			self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
												constant: Constants.offset),
			self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
												   constant: -Constants.offset)
		])
	}
	
	func configureSmallLabelLayout() {
		self.stackView.addArrangedSubview(self.smallLabel)
		self.smallLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configureMediumLabelLayout() {
		self.stackView.addArrangedSubview(self.mediumLabel)
		self.mediumLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configureLargeLabelLayout() {
		self.stackView.addArrangedSubview(self.largeLabel)
		self.largeLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configureRoundButtonLayout() {
		self.stackView.addArrangedSubview(self.roundButton)
		self.roundButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.roundButton.heightAnchor.constraint(equalToConstant: Constants.roundButtonSize.height),
			self.roundButton.widthAnchor.constraint(equalToConstant: Constants.roundButtonSize.width)
		])
	}
	
	func configureRoundedButtonLayout() {
		self.stackView.addArrangedSubview(self.roundedButton)
		self.roundedButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.roundedButton.heightAnchor.constraint(equalToConstant: Constants.roundedButtonSize.height),
			self.roundedButton.widthAnchor.constraint(equalToConstant: Constants.roundedButtonSize.width)
		])
	}
	
	func configureImageLayout() {
		self.stackView.addArrangedSubview(self.image)
		self.image.translatesAutoresizingMaskIntoConstraints = false
		self.image.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
		
		NSLayoutConstraint.activate([
			self.image.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
			self.image.widthAnchor.constraint(equalTo: self.stackView.widthAnchor)
		])
	}
	
	func configureActivityIndicatorLayout() {
		self.image.addSubview(self.activityIndicator)
		self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.activityIndicator.centerXAnchor.constraint(equalTo: self.image.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: self.image.centerYAnchor)
		])
	}
}
