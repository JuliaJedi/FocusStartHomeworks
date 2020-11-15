//
//  ThirdViewController.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class ThirdViewController: UIViewController {
	private let thirdView = ThirdView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view = self.thirdView
	}
}
