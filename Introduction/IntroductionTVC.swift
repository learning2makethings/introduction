//
//  IntroductionTVC.swift
//  Introduction
//
//  Created by Allen on 3/28/19.
//  Copyright © 2019 Coding Buddies. All rights reserved.
//

import UIKit

class IntroductionTVC: UITableViewController {
    // MARK: - Properties
    let userNames = ["Allen"]

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        self.title = "Coding Buddies"
    }

    // MARK: - Tableview Datasource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = userNames[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "personSegue", sender: self)
    }

    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personSegue" {
            let destinationController = segue.destination as! PersonPageVC
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.personName = userNames[indexPath.row]
            }
        }
    }

}

