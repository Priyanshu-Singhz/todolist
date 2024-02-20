//
//  DetailViewController.swift
//  tablview
//
//  Created by Zignuts Technolab on 20/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    var detailData: [String: String]?
    
    // Connect UI elements to display the details
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Update UI with detail data
        if let data = detailData {
            nameLabel.text = data["task"]
            descriptionLabel.text = data["description"]
        }
    }
}

