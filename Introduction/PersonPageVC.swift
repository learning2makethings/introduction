//
//  PersonPageVC.swift
//  Introduction
//
//  Created by Allen on 3/28/19.
//  Copyright © 2019 Coding Buddies. All rights reserved.
//

import UIKit

class PersonPageVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personIntroTextView: UITextView!
    // MARK: - Properties
    var personName = ""

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personNameLabel.text = personName
        setupIntroText()
    }

    // MARK: - Setup Functions
    func setupIntroText() {
        personIntroTextView.text = fetchTextFromFileFor(personName)
    }

    func fetchTextFromFileFor(_ personName: String) -> String {
        if let path = Bundle.main.path(forResource: personName, ofType: "txt") {
            do {
                let introText = try String(contentsOfFile: path, encoding: .utf8)
                return introText
            } catch {
                return "Failed to read intro text from \(personName).txt"
            }
        } else {
            return "Failed to load file from app bundle \(personName).txt"
        }
    }
}
