//
//  ThirdView.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 15.11.2020.
//

import UIKit

final class ThirdView: UIView {
	private let view = UIView()
	private let loginField = UITextField()
	private let passwordField = UITextField()
	private let enterButton = UIButton()
	
	private let keyboardHandler = KeyboardHandler()
	private var enterButtonConstraint = NSLayoutConstraint()
	
	private enum Constants {
		static let enterButtonSize = CGSize(width: 200, height: 50)
		static let offset: CGFloat = 8
	}
	
	init() {
		super.init(frame: .zero)
		
		self.configureView()
		self.configureHandlers()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureView() {
		self.configureViewsLayout()
		self.configureViewAppearance()
		
		self.loginField.delegate = self
		self.passwordField.delegate = self
	}
}

// MARK: Appearance
private extension ThirdView {
	func configureViewAppearance() {
		self.backgroundColor = .systemBackground
		
		self.configureLoginFieldAppearance()
		self.configurePasswordFieldAppearance()
		self.configureEnterButtonAppearance()
	}
	
	func configureLoginFieldAppearance() {
		self.loginField.placeholder = "Login"
		self.loginField.borderStyle = .roundedRect
		self.loginField.clearButtonMode = .whileEditing
		self.loginField.keyboardType = .default
	}
	
	func configurePasswordFieldAppearance() {
		self.passwordField.placeholder = "Password"
		self.passwordField.borderStyle = .roundedRect
		self.passwordField.clearButtonMode = .whileEditing
		self.passwordField.keyboardType = .default
		self.passwordField.isSecureTextEntry = true
	}
	
	func configureEnterButtonAppearance() {
		self.enterButton.setTitle("Enter", for: .normal)
		self.enterButton.setTitleColor(.black, for: .normal)
		self.enterButton.layer.cornerRadius = 8
		self.enterButton.layer.borderWidth = 1
		self.enterButton.layer.borderColor = UIColor.black.cgColor
	}
}

// MARK: Layout
private extension ThirdView {
	func configureViewsLayout() {
		self.addSubview(self.view)
		self.view.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
											   constant: Constants.offset),
			self.view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
												constant: -Constants.offset),
			self.view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
										   constant: Constants.offset),
			self.view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
											  constant: -Constants.offset)
		])

		self.view.addSubview(self.loginField)
		self.view.addSubview(self.passwordField)
		self.view.addSubview(self.enterButton)
		
		self.configureLoginFieldLayout()
		self.configurePasswordFieldLayout()
		self.configureEnterButtonLayout()
	}
	
	func configureLoginFieldLayout() {
		self.loginField.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.loginField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.loginField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.loginField.topAnchor.constraint(equalTo: self.view.topAnchor)
		])
	}
	
	func configurePasswordFieldLayout() {
		self.passwordField.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.passwordField.topAnchor.constraint(equalTo: self.loginField.bottomAnchor, constant: Constants.offset)
		])
	}
	
	func configureEnterButtonLayout() {
		self.enterButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.enterButton.widthAnchor.constraint(equalToConstant: Constants.enterButtonSize.width),
			self.enterButton.heightAnchor.constraint(equalToConstant: Constants.enterButtonSize.height)
		])
		
		self.enterButtonConstraint = self.enterButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
		enterButtonConstraint.isActive = true
	}
}

// MARK: Keyboard Handlers
private extension ThirdView {
	func configureHandlers() {
		self.keyboardHandler.willShowKeyboardHandler = { [weak self] height, animationDuration in
			guard let self = self else { return }
			self.enterButtonConstraint.constant = self.safeAreaInsets.bottom - height
			
			UIView.animate(withDuration: animationDuration) {
				self.layoutIfNeeded()
			}
		}
		
		self.keyboardHandler.willHideKeyboardHandler = { [weak self] animationDuration in
			guard let self = self else { return }
			self.enterButtonConstraint.constant = 0
			
			UIView.animate(withDuration: animationDuration) {
				self.layoutIfNeeded()
			}
		}
	}
}

// MARK: UITextFieldDelegate
extension ThirdView: UITextFieldDelegate {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
}
