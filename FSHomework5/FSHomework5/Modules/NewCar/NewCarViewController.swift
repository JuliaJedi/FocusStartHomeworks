//
//  NewCarViewController.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class NewCarViewController: UIViewController {
	private let newCarView = NewCarView()
	private let presenter: INewCarPresenter
	
	init(presenter: INewCarPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = self.newCarView
		self.configure()
		self.presenter.viewDidLoad(ui: newCarView, viewController: self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension NewCarViewController {
	func configure() {
		self.navigationItem.title = "Новый автомобиль"
	}
}
