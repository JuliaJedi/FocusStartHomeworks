//
//  SecondView.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class SecondView: UIView {
	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let titleLabel = UILabel()
	private let textLabel = UILabel()
	
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []
	
	private enum Constants {
		static let imageSize = CGSize(width: 300, height: 300)
		static let offset: CGFloat = 16
	}
	
	init() {
		super.init(frame: .zero)
		
		self.configureViewsLayout()
		self.configureViewAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		
		self.changeViewsLayout(traitCollection: traitCollection)
	}
}

// MARK: Appearance
private extension SecondView {
	func configureViewAppearance() {
		self.configureImageViewAppearance()
		self.configureTitleLabelAppearance()
		self.configureTextLabelAppearance()
	}
	
	func configureImageViewAppearance() {
		self.imageView.image = UIImage(named: "mtn")
		self.imageView.contentMode = .scaleAspectFill
		self.imageView.clipsToBounds = true
	}
	
	func configureTitleLabelAppearance() {
		self.titleLabel.numberOfLines = 0
		self.titleLabel.textAlignment = .center
		self.titleLabel.font = .boldSystemFont(ofSize: 18)
		self.titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ⛰"
	}
	
	func configureTextLabelAppearance() {
		self.textLabel.numberOfLines = 0
		self.textLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	}
}

// MARK: Layout
private extension SecondView {
	func configureViewsLayout() {
		self.backgroundColor = .systemBackground
		
		self.configureSharedLayout()
		self.configureCompactLayout()
		self.configureRegularLayout()
		
		self.changeViewsLayout(traitCollection: traitCollection)
	}
	
	func changeViewsLayout(traitCollection: UITraitCollection) {
		switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular):
			NSLayoutConstraint.deactivate(self.regularConstraints)
			NSLayoutConstraint.activate(self.compactConstraints)
		default:
			NSLayoutConstraint.deactivate(self.compactConstraints)
			NSLayoutConstraint.activate(self.regularConstraints)
		}
	}
}

// MARK: Shared Layout
private extension SecondView {
	func configureSharedLayout() {
		self.configureScrollViewLayout()
		self.configureImageViewLayout()
		self.configureTitleLayout()
		self.configureTextLayout()
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
	
	func configureImageViewLayout() {
		self.scrollView.addSubview(self.imageView)
		self.imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.imageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height)
		])
	}
	
	func configureTitleLayout() {
		self.scrollView.addSubview(self.titleLabel)
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configureTextLayout() {
		self.scrollView.addSubview(self.textLabel)
		self.textLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.textLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													constant: Constants.offset),
			self.textLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													 constant: -Constants.offset),
			self.textLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor,
												   constant: -Constants.offset)
		])
	}
}

// MARK: Compact Layout
private extension SecondView {
	func configureCompactLayout() {
		self.configureImageViewCompactLayout()
		self.configureTitleCompactLayout()
		self.configureTextCompactLayout()
	}
	
	func configureImageViewCompactLayout() {
		self.compactConstraints.append(contentsOf: [
			self.imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
		])
	}
	
	func configureTitleCompactLayout() {
		self.compactConstraints.append(contentsOf: [
			self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													 constant: Constants.offset),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													  constant: -Constants.offset),
			self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor,
												 constant: Constants.offset),
			self.titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
		])
	}
	
	func configureTextCompactLayout() {
		self.compactConstraints.append(contentsOf: [
			self.textLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
												constant: Constants.offset)
		])
	}
}

// MARK: Regular Layout
private extension SecondView {
	func configureRegularLayout() {
		self.configureImageViewRegularLayout()
		self.configureTitleRegularLayout()
		self.configureTextRegularLayout()
	}
	
	func configureImageViewRegularLayout() {
		self.regularConstraints.append(contentsOf: [
			self.imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													constant: Constants.offset),
			self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,
												constant: Constants.offset),
			self.imageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width)
		])
	}
	
	func configureTitleRegularLayout() {
		self.regularConstraints.append(contentsOf: [
			self.titleLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor,
													 constant: Constants.offset),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													  constant: -Constants.offset),
			self.titleLabel.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor),
			self.titleLabel.heightAnchor.constraint(equalTo: self.imageView.heightAnchor)
		])
	}
	
	func configureTextRegularLayout() {
		self.regularConstraints.append(contentsOf: [
			self.textLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor,
												constant: Constants.offset)
		])
	}
}
