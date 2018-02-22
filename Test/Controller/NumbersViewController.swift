//
//  GenerateNumbersViewController.swift
//  Test
//
//  Created by Ivan Almada on 22/02/2018.
//  Copyright © 2018 ivna. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var numbers: [Int] {
        didSet {
            tableView.reloadData()
        }
    }

    var numberFormatter: NumberFormatter

    // MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        numbers = []
        numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "cs_CZ")
        numberFormatter.numberStyle = .spellOut
        super.init(coder: aDecoder)
    }

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        retrieve()
    }

    // MARK: - Helper methods
    func retrieve() {
        if let retrievedNumbers = NumberDataStore.retrieveNumbers() {
            numbers = retrievedNumbers
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.numberTableViewCell.rawValue)!
        let number = numbers[indexPath.row]
        cell.textLabel?.text = numberFormatter.string(from: NSNumber(value: number))
        cell.detailTextLabel?.text = "\(number)"
        return cell
    }

    // MARK: - IBAction
    @IBAction func generateTapped(_ sender: Any) {
        let result = NumberDataStore.generateNumbers()
        NumberDataStore.store(numbers: result)
        retrieve()
    }

}
