//
//  FirstViewController.swift
//  FSHomework3
//
//  Created by Афанасьева Юлия Геннадьевна on 14.11.2020.
//

import UIKit

final class FirstViewController: UIViewController {
	private let firstView = FirstView()
	
	override func loadView() {
		self.view = self.firstView
	}
}

