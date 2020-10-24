//
//  CarsViewController.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarsViewController: UIViewController {
	var addButton: (() -> Void)?
	var filterButton: (() -> Void)?
	
	private let presenter: CarsPresenter
	private let carsView = CarsView()
	
	init(presenter: CarsPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = self.carsView
		self.configure()
		self.presenter.didLoad(ui: carsView, viewController: self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CarsViewController {
	func configure() {
		self.navigationItem.title = "Автомобили"
		let addNewCarButton = UIBarButtonItem(image: UIImage(named: "Plus.png")?.withRenderingMode(.alwaysOriginal),
											  style: .done,
											  target: self,
											  action: #selector(self.addNewCar))
		self.navigationItem.setRightBarButton(addNewCarButton, animated: false)
		
		let filterButton = UIBarButtonItem(image: UIImage(named: "Filter.png")?.withRenderingMode(.alwaysOriginal),
										   style: .done,
										   target: self,
										   action: #selector(self.filter))
		self.navigationItem.setLeftBarButton(filterButton, animated: false)
	}
	
	@objc private func addNewCar(_ sender: UIButton) {
		self.addButton?()
	}
	
	@objc private func filter(_ sender: UIButton) {
		self.filterButton?()
	}
}
