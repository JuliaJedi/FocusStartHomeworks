//
//  NewCarView.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class NewCarView: UIView {
	private var newCar: Car?
	var onTapCreateNewCar: ((Car) -> Void)?
	
	private let addButton: UIButton = {
		let addButton = UIButton()
		addButton.translatesAutoresizingMaskIntoConstraints = false
		addButton.isEnabled = false
		addButton.setTitle("Добавить", for: .normal)
		addButton.setTitleColor(.black, for: .normal)
		addButton.setTitleColor(.gray, for: .disabled)
		addButton.addTarget(self, action: #selector(createNewCar), for: .touchUpInside)
		return addButton
	}()
	
	private let manufacturer: UITextField = TextField(placeholder: "Введите производителя")
	private let model: UITextField = TextField(placeholder: "Введите модель")
	private let body: UITextField = TextField(placeholder: "Введите тип кузова")
	private let yearOfIssue: UITextField = TextField(placeholder: "Введите год выпуска")
	private let carNumber: UITextField = TextField(placeholder: "Введите гос. номер")
	
	private let bodyPicker = UIPickerView()
	
	init() {
		super.init(frame: .zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure() {
		self.backgroundColor = .white
		
		let view = UIView()
		self.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.topAnchor.constraint(equalTo: self.topAnchor),
			self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
		])
		
		self.addSubview(self.manufacturer)
		self.addSubview(self.model)
		self.addSubview(self.body)
		self.addSubview(self.yearOfIssue)
		self.addSubview(self.carNumber)
		self.addSubview(self.addButton)
		
		self.setConstraints()
		
		self.bodyPicker.delegate = self
		self.bodyPicker.dataSource = self
		self.body.inputView = bodyPicker
		
		self.manufacturer.delegate = self
		self.model.delegate = self
		self.body.delegate = self
	}
	
	@objc func createNewCar() {
		guard let manufacturer = self.manufacturer.text,
			  let model = self.model.text,
			  let body = self.body.text,
			  let yearOfIssue = self.yearOfIssue.text,
			  let carNumber = self.carNumber.text else {
			return
		}
		
		if let body = Car.Body(rawValue: body) {
			self.newCar = Car(manufacturer: manufacturer, model: model, body: body, yearOfIssue: Int(yearOfIssue), carNumber: carNumber)
		}
		
		if let newCar = self.newCar {
			self.onTapCreateNewCar?(newCar)
		}
	}
}

extension NewCarView: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if textField == self.body {
			return false
		}
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if textField == self.body {
			let row = self.bodyPicker.selectedRow(inComponent: 0)
			self.body.text = Car.Body.allCases[row].rawValue
		}
	}
	
	func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
		if self.manufacturer.text != "" && self.model.text != "" && self.body.text != "" {
			self.addButton.isEnabled = true
		}
	}
}

extension NewCarView: UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		Car.Body.allCases[row].rawValue
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let selectedElement = Car.Body.allCases[row].rawValue
		self.body.text = selectedElement
	}
}

extension NewCarView: UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		Car.Body.allCases.count
	}
}

extension NewCarView {
	func setConstraints() {
		NSLayoutConstraint.activate([
			self.manufacturer.widthAnchor.constraint(equalToConstant: 300),
			self.manufacturer.heightAnchor.constraint(equalToConstant: 40),
			self.manufacturer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		NSLayoutConstraint.activate([
			self.model.widthAnchor.constraint(equalToConstant: 300),
			self.model.heightAnchor.constraint(equalToConstant: 40),
			self.model.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		NSLayoutConstraint.activate([
			self.body.widthAnchor.constraint(equalToConstant: 300),
			self.body.heightAnchor.constraint(equalToConstant: 40),
			self.body.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		NSLayoutConstraint.activate([
			self.yearOfIssue.widthAnchor.constraint(equalToConstant: 300),
			self.yearOfIssue.heightAnchor.constraint(equalToConstant: 40),
			self.yearOfIssue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		NSLayoutConstraint.activate([
			self.carNumber.widthAnchor.constraint(equalToConstant: 300),
			self.carNumber.heightAnchor.constraint(equalToConstant: 40),
			self.carNumber.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		NSLayoutConstraint.activate([
			self.addButton.widthAnchor.constraint(equalToConstant: 300),
			self.addButton.heightAnchor.constraint(equalToConstant: 40),
			self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
		])
		
		let manufacturerTopConstraint = NSLayoutConstraint(item: self.manufacturer,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.safeAreaLayoutGuide,
											   attribute: .top,
											   multiplier: 1.0,
											   constant: 20)
		manufacturerTopConstraint.isActive = true
		
		let modelTopConstraint = NSLayoutConstraint(item: self.model,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.manufacturer,
											   attribute: .bottom,
											   multiplier: 1.0,
											   constant: 20)
		modelTopConstraint.isActive = true
		
		let bodyTopConstraint = NSLayoutConstraint(item: self.body,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.model,
											   attribute: .bottom,
											   multiplier: 1.0,
											   constant: 20)
		bodyTopConstraint.isActive = true
		
		let yearOfIssueTopConstraint = NSLayoutConstraint(item: self.yearOfIssue,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.body,
											   attribute: .bottom,
											   multiplier: 1.0,
											   constant: 20)
		yearOfIssueTopConstraint.isActive = true
		
		let carNumberTopConstraint = NSLayoutConstraint(item: self.carNumber,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.yearOfIssue,
											   attribute: .bottom,
											   multiplier: 1.0,
											   constant: 20)
		carNumberTopConstraint.isActive = true
		
		let addButtonTopConstraint = NSLayoutConstraint(item: self.addButton,
											   attribute: .top,
											   relatedBy: .equal,
											   toItem: self.carNumber,
											   attribute: .bottom,
											   multiplier: 1.0,
											   constant: 20)
		addButtonTopConstraint.isActive = true
	}
}
