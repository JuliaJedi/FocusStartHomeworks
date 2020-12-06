//
//  DetailViewController.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class DetailViewController: UIViewController {
	private let detailView = DetailView()
	
	override func loadView() {
		self.view = self.detailView
	}
}

extension DetailViewController: INavigationModule {
	var viewController: UIViewController { self }
	
	func set<Parameters>(parameters: Parameters) {
		if let news = parameters as? News {
			self.navigationItem.title = news.title
			self.detailView.configure(details: news.details)
		}
	}
}
