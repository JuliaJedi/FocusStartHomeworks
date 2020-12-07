//
//  ContainerController.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class ContainerController: UISplitViewController {
	private let coordinatingController: CoordinatingController
	private let news: [News]
	private let masterViewController: MasterViewController
	private let detailViewController: DetailViewController
	
	init(coordinatingController: CoordinatingController) {
		self.coordinatingController = coordinatingController
		self.news = ModelController.getNews()
		
		self.masterViewController = MasterViewController(coordinating: coordinatingController)
		self.masterViewController.set(parameters: self.news)
		self.coordinatingController.register(module: .master, navigationModule: self.masterViewController)
		let masterNavigationController = UINavigationController(rootViewController: self.masterViewController)
		
		self.detailViewController = DetailViewController()
		self.detailViewController.set(parameters: self.news.first)
		self.coordinatingController.register(module: .detail, navigationModule: self.detailViewController)
		let detailNavigationController = UINavigationController(rootViewController: detailViewController)
		
		super.init(nibName: nil, bundle: nil)
		
		self.viewControllers = [masterNavigationController, detailNavigationController]
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
