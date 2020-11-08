//
//  ThreadSafeArray.swift
//  FSHomework2
//
//  Created by Афанасьева Юлия Геннадьевна on 08.11.2020.
//

import Foundation

final class ThreadSafeArray<Element> {
	private var items = [Element]()
	private var isolatedQueue = DispatchQueue(label: "isolatedQueue", attributes: .concurrent)
	var isEmpty: Bool {
		self.isolatedQueue.sync {
			return self.items.isEmpty
		}
	}
	var count: Int {
		self.isolatedQueue.sync {
			return self.items.count
		}
	}
	
	func append(_ item: Element) {
		self.isolatedQueue.async(flags: .barrier) {
			self.items.append(item)
		}
	}
	
	func remove(at index: Int) {
		self.isolatedQueue.async(flags: .barrier) {
			self.items.remove(at: index)
		}
	}
	
	subscript(index: Int) -> Element {
		get {
			self.isolatedQueue.sync {
				assert(self.items.indices.contains(index), "Index out of range")
				return self.items[index]
			}
		}
		set {
			self.isolatedQueue.async(flags: .barrier) {
				assert(self.items.indices.contains(index), "Index out of range")
				self.items[index] = newValue
			}
		}
	}
}

extension ThreadSafeArray where Element: Equatable {
	func contains(_ element: Element) -> Bool {
		self.isolatedQueue.sync {
			return self.items.contains(element)
		}
	}
}
