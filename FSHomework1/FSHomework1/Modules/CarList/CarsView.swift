//
//  CarsView.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

protocol ICarsView: class {
	var cars: [Car]? { get set }
	
	func set(selectedBody: Car.Body?)
}

final class CarsView: UIView {
	var cars: [Car]? {
		didSet { self.collectionView.reloadData() }
	}
	
	private var filteredCars: [Car]? {
		didSet { self.collectionView.reloadData() }
	}
	
	private var selectedBody: Car.Body? {
		didSet {
			if selectedBody != nil {
				self.filteredCars = self.cars?.filter { $0.body == self.selectedBody }
				self.filterIsActive = true
			} else {
				self.filterIsActive = false
				self.collectionView.reloadData()
			}
		}
	}
	
	private var filterIsActive: Bool = false
	weak var collectionView: UICollectionView!
	
	init() {
		super.init(frame: .zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure() {
		self.backgroundColor = .white
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		self.collectionView = collectionView
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.register(CarCell.self, forCellWithReuseIdentifier: CarCell.identifier)
		self.collectionView.alwaysBounceVertical = true
		self.collectionView.backgroundColor = .white
		self.addSubview(self.collectionView)
		
		NSLayoutConstraint.activate([
			self.topAnchor.constraint(equalTo: self.collectionView.topAnchor),
			self.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
			self.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor),
			self.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor),
		])
	}
}

extension CarsView: ICarsView {
	func set(selectedBody: Car.Body?) {
		self.selectedBody = selectedBody
	}
}

extension CarsView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		if filterIsActive {
			return self.filteredCars?.count ?? 0
		} else {
			return self.cars?.count ?? 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCell.identifier, for: indexPath) as! CarCell
		let data: Car
		if filterIsActive {
			guard let filteredCars = self.filteredCars else {
				return cell
			}
			data = filteredCars[indexPath.item]
		} else {
			guard let cars = self.cars else {
				return cell
			}
			data = cars[indexPath.item]
		}
		cell.configure(manufacturer: data.manufacturer, model: data.model, body: data.body, yearOfIssue: data.yearOfIssue, carNumber: data.carNumber)
		return cell
	}
}

extension CarsView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: collectionView.bounds.width, height: 150)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}
