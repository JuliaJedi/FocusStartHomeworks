//
//  RoundedShadowImageView.swift
//  FSHomework4
//
//  Created by Афанасьева Юлия Геннадьевна on 05.12.2020.
//

import UIKit

final class RoundedShadowImageView: UIView {
	private let imageLayer = CAShapeLayer()
	private let shadowLayer = CAShapeLayer()
	
	private var shape: UIBezierPath {
		return UIBezierPath(roundedRect: bounds, cornerRadius: Constants.cornerRadius)
	}
	
	private var shapeAsPath: CGPath {
		return self.shape.cgPath
	}
	
	private var shapeAsMask: CAShapeLayer {
		let shapeAsMask = CAShapeLayer()
		shapeAsMask.path = self.shapeAsPath
		return shapeAsMask
	}
	
	var image: UIImage? {
		didSet {
			setNeedsLayout()
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.clipsToBounds = false
		self.backgroundColor = .systemBackground
		
		self.layer.addSublayer(self.shadowLayer)
		self.shadowLayer.shadowPath = (self.image == nil) ? nil : shapeAsPath
		self.shadowLayer.shadowColor = UIColor.black.cgColor
		self.shadowLayer.shadowOffset = Constants.shadowOffset
		self.shadowLayer.shadowRadius = Constants.shadowRadius
		self.shadowLayer.shadowOpacity = Constants.shadowOpacity
		
		self.layer.addSublayer(self.imageLayer)
		self.imageLayer.contents = self.image?.cgImage
		self.imageLayer.contentsGravity = .resizeAspectFill
		self.imageLayer.frame = bounds
		self.imageLayer.mask = self.shapeAsMask
	}
}
