//
//  main.swift
//  FSHomework2
//
//  Created by Афанасьева Юлия Геннадьевна on 03.11.2020.
//

import Foundation

var notThreadSafeArray = [Int]()
let threadSafeArray = ThreadSafeArray<Int>()

let arrayGroup = DispatchGroup()
let workerQueue = DispatchQueue.global(qos: .userInitiated)

let workItem = DispatchWorkItem {
	for number in 0...1000 {
		threadSafeArray.append(number)
		notThreadSafeArray.append(number)
	}
	arrayGroup.leave()
}

arrayGroup.enter()
workerQueue.async(execute: workItem)

arrayGroup.enter()
workerQueue.async(execute: workItem)

arrayGroup.wait()

print("Количество элементов в массиве numbers: \(threadSafeArray.count)")
print("Количество элементов в массиве array: \(notThreadSafeArray.count)")
