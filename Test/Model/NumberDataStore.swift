//
//  NumberDataStore.swift
//  Test
//
//  Created by Ivan Almada on 22/02/2018.
//  Copyright © 2018 ivna. All rights reserved.
//

import Foundation

struct NumberDataStore {
    static func store(numbers: [Int]) {
        let defaults = UserDefaults.standard
        defaults.set(numbers, forKey: Constants.numbersKey)
    }

    static func retrieveNumbers() -> [Int]? {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: Constants.numbersKey) as? [Int]
    }

    static func generateNumbers() -> [Int] {
        var fromNumber = Constants.startNumber
        fromNumber += UInt32(1) // arc4random_uniform(upper) goes to upper-1, check: man arc4random_uniform
        let toNumber = Constants.endNumber
        let randomNumberStart = arc4random_uniform(fromNumber)
        let randomNumberEnd = arc4random_uniform(fromNumber) + toNumber
        var result = [Int]()
        for i in randomNumberStart...randomNumberEnd {
            result.append(Int(i))
        }
        return result
    }
}
