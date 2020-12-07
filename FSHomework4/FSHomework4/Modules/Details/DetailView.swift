//
//  DetailView.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class DetailView: UIView {
	private let scrollView = UIScrollView()
	private let textLabel = UILabel()
	private let firstImageView = RoundedShadowImageView()
	private let secondImageView = RoundedShadowImageView()
	
	init() {
		super.init(frame: .zero)
		
		self.configureLayout()
		self.configureAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DetailView {
	func configure(details: Details) {
		self.textLabel.text = details.text
		self.firstImageView.image = UIImage(named: details.firstImage)
		self.secondImageView.image = UIImage(named: details.secondImage)
	}
}

// MARK: Appearance
private extension DetailView {
	func configureAppearance() {
		self.backgroundColor = .systemBackground
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = UIScreen.main.scale
		
		self.configureTextLabelAppearance()
	}
	
	func configureTextLabelAppearance() {
		self.textLabel.numberOfLines = 0
	}
}

// MARK: Layout
private extension DetailView {
	func configureLayout() {
		self.configureScrollViewLayout()
		self.configureTextLabelLayout()
		self.configureFirstImageViewLayout()
		self.configureSecondImageViewLayout()
	}
	
	func configureScrollViewLayout() {
		self.addSubview(self.scrollView)
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			self.scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
		])
	}
	
	func configureTextLabelLayout() {
		self.scrollView.addSubview(self.textLabel)
		self.textLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.textLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.offset),
			self.textLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.offset),
			self.textLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Constants.offset)
		])
	}
	
	func configureFirstImageViewLayout() {
		self.scrollView.addSubview(self.firstImageView)
		self.firstImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.firstImageView.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: Constants.offset),
			self.firstImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.firstImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
			self.firstImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height)
		])
	}
	
	func configureSecondImageViewLayout() {
		self.scrollView.addSubview(self.secondImageView)
		self.secondImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.secondImageView.topAnchor.constraint(equalTo: self.firstImageView.bottomAnchor, constant: Constants.offset),
			self.secondImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.secondImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
			self.secondImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height)
		])
	}
}
