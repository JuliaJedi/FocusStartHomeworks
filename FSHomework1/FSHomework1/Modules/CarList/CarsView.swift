//
//  CarsView.swift
//  FSHomework1
//
//  Created by Афанасьева Юлия Геннадьевна on 21.10.2020.
//

import UIKit

final class CarsView: UIView {
	var cars: [Car]? {
		didSet { self.collectionView.reloadData() }
	}
	
	var filteredCars: [Car]? {
		didSet { self.collectionView.reloadData() }
	}
	
	var selectedBody: Car.Body? {
		didSet { self.filteredCars = self.cars?.filter { $0.body == self.selectedBody } }
	}
	
	var filterIsActive: Bool = false
	var delegate: ICarFilterView?
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

extension CarsView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		if filterIsActive {
			guard let filteredCars = self.filteredCars else {
				return 0
			}
			return filteredCars.count
		} else {
			guard let cars = self.cars else {
				return 0
			}
			return cars.count
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
		return CGSize(width: collectionView.bounds.width, height: 150)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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

extension CarsView: ICarFilterView {
	func filter(body: Car.Body?) {
		if body != nil {
			self.selectedBody = body
			self.filterIsActive = true
		} else {
			self.filterIsActive = false
			self.collectionView.reloadData()
		}
	}
}
