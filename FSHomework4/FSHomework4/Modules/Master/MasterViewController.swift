//
//  MasterViewController.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class MasterViewController: UITableViewController {
	private let masterTableView = MasterTableView()
	private let coordinating: CoordinatingController
	
	init(coordinating: CoordinatingController) {
		self.coordinating = coordinating
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = self.masterTableView
		self.configure()

		self.masterTableView.selectRowHandler = { [weak self] news in
			self?.coordinating.showDetailViewController(news: news)
		}
	}
}

extension MasterViewController: INavigationModule {
	var viewController: UIViewController { self }
	
	func set<Parameters>(parameters: Parameters) {
		if let news = parameters as? [News] {
			self.masterTableView.news = news
		}
	}
}

private extension MasterViewController {
	func configure() {
		self.navigationItem.title = "Master"
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}

