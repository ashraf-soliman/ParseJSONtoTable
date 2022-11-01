//
//  DetailViewController.swift
//  ParseJSONtoTable
//
//  Created by ashraf on 01/11/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var passedPostIDLabel  = ""
    var passedNameLabel = ""
    var passedEmailLabel = ""
    var passedBodyLabel = ""
    
    @IBOutlet var postIDLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postIDLabel.text = passedPostIDLabel
        nameLabel.text = passedNameLabel
        emailLabel.text = passedEmailLabel
        bodyLabel.text = passedBodyLabel
    }
}
