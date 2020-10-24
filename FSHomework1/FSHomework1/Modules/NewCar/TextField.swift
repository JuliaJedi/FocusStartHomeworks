//
//  TextField.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

final class TextField: UITextField {
	weak var textLabel: UILabel!
	
	init(placeholder: String) {
		super.init(frame: .zero)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.placeholder = placeholder
		self.font = UIFont.systemFont(ofSize: 15)
		self.borderStyle = UITextField.BorderStyle.roundedRect
		self.autocorrectionType = UITextAutocorrectionType.no
		self.keyboardType = UIKeyboardType.default
		self.returnKeyType = UIReturnKeyType.done
		self.clearButtonMode = UITextField.ViewMode.always
		self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		self.allowsEditingTextAttributes = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
