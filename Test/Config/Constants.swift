//
//  Constants.swift
//  Test
//
//  Created by Ivan Almada on 22/02/2018.
//  Copyright © 2018 ivna. All rights reserved.
//

struct Constants {
    // MARK: - UITableViewCells
    enum CellIdentifiers: String {
        case numberTableViewCell = "numberTableViewCell"
    }

    // MARK: - Numbers
    static let startNumber: UInt32 = 20 // Including
    static let endNumber: UInt32 = 80 // Including

    // MARK: - User Defaults Keys
    static let numbersKey = "numbersUserDefaultsKey"
}
