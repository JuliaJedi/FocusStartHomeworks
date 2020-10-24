//
//  CarFilterTableViewController.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

final class CarFilterTableViewController: UITableViewController {
	private let presenter: CarFilterPresenter
	let carsFilterView = CarFilterTable()
	
	init(presenter: CarFilterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = self.carsFilterView
		self.configure()
		self.presenter.didLoad(ui: carsFilterView, viewController: self)
	}
}

extension CarFilterTableViewController {
	func configure() {
		self.navigationItem.title = "Фильтр"
		let resetButton = UIBarButtonItem(image: UIImage(named: "Reset.png")?.withRenderingMode(.alwaysOriginal),
										  style: .done,
										  target: self,
										  action: #selector(self.resetFilter))
		self.navigationItem.setRightBarButton(resetButton, animated: false)
	}
	
	@objc private func resetFilter(_ sender: UIButton) {
		self.carsFilterView.carFilterViewDelegate?.filter(body: nil)
		self.dismiss(animated: true, completion: nil)
	}
}
