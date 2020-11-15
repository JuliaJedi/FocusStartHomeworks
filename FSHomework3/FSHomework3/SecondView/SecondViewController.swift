//
//  SecondViewController.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class SecondViewController: UIViewController {
	private let secondView = SecondView()
	
	override func loadView() {
		super.loadView()
		
		self.view = secondView
	}
}
