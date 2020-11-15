//
//  KeyboardHandler.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 15.11.2020.
//

import UIKit

final class KeyboardHandler {
	
	public var willShowKeyboardHandler: ((_ keyboardHeight: CGFloat, _ animationDuration: TimeInterval) -> Void)?
	public var willHideKeyboardHandler: ((_ animationDuration: TimeInterval) -> Void)?
	
	deinit {
		NotificationCenter.default.removeObserver(self,
												  name: UIResponder.keyboardWillShowNotification,
												  object: nil)
		NotificationCenter.default.removeObserver(self,
												  name: UIResponder.keyboardWillHideNotification,
												  object: nil)
	}
	
	init() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(self.keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(self.keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo,
			  let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
			  let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
		
		self.willShowKeyboardHandler?(keyboardSize.cgRectValue.height, animationDuration)
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		guard let userInfo = notification.userInfo,
			  let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
		
		self.willHideKeyboardHandler?(animationDuration)
	}
}
