//
//  MasterTableView.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

protocol IMasterTableView: AnyObject {
	var selectRowHandler: ((News) -> Void)? { get set }
}

final class MasterTableView: UITableView, IMasterTableView {
	var selectRowHandler: ((News) -> Void)?
	var news: [News]? {
		didSet { self.reloadData() }
	}
	
	init() {
		super.init(frame: .zero, style: .plain)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure() {
		self.delegate = self
		self.dataSource = self
		self.register(MasterTableCell.self, forCellReuseIdentifier: MasterTableCell.identifier)
	}
}

extension MasterTableView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let news = self.news {
			self.selectRowHandler?(news[indexPath.item])
		}
	}
}

extension MasterTableView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.news?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableCell.identifier, for: indexPath) as! MasterTableCell
		
		if let news = self.news {
			cell.configure(news: news[indexPath.item])
		}
		
		return cell
	}
}
