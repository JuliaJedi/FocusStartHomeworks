//
//  CarFilterTable.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 23.10.2020.
//

import UIKit

protocol ICarFilterTable: class {
	var carViewDelegate: ICarsView? { get }
	var didSelectBody: ((Car.Body) -> Void)? { get set }
}

final class CarFilterTable: UITableView, ICarFilterTable {
	private var selectedBody: Car.Body?
	private weak var tableView: UITableView!
	
	var didSelectBody: ((Car.Body) -> Void)?
	var carViewDelegate: ICarsView?
	
	init() {
		super.init(frame: .zero, style: UITableView.Style.plain)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure() {
		self.dataSource = self
		self.delegate = self
		self.register(CarFilterTableCell.self, forCellReuseIdentifier: CarFilterTableCell.identifier)
	}
}

extension CarFilterTable: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		Car.Body.allCases.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CarFilterTableCell.identifier, for: indexPath)
		cell.textLabel?.text = Car.Body.allCases[indexPath.row].rawValue
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedBody = Car.Body.allCases[indexPath.row]
		self.didSelectBody?(self.selectedBody!)
	}
}
