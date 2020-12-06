//
//  TabBarController.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

		let firstVC = FirstViewController()
		firstVC.tabBarItem = UITabBarItem(title: "First",
									   image: UIImage(named: "tropics.png")?.withRenderingMode(.alwaysOriginal),
									   tag: 0)

		let secondVC = SecondViewController()
		secondVC.tabBarItem = UITabBarItem(title: "Second",
										   image: UIImage(named: "mountain.png")?.withRenderingMode(.alwaysOriginal),
										   tag: 1)
		
		let thirdVC = ThirdViewController()
		thirdVC.tabBarItem = UITabBarItem(title: "Third",
										  image: UIImage(named: "canyon.png")?.withRenderingMode(.alwaysOriginal),
										  tag: 2)
		
		let tabBarList = [firstVC, secondVC, thirdVC]
		self.viewControllers = tabBarList
	}
}
