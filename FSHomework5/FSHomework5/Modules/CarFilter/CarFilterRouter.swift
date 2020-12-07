//
//  CarFilterRouter.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

protocol ICarFilterRouter {
	func closeFilter(viewController: UIViewController)
}

final class CarFilterRouter: ICarFilterRouter {
	func closeFilter(viewController: UIViewController) {
		viewController.dismiss(animated: true, completion: nil)
	}
}
