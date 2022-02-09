//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Rohit Saini on 08/02/22.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController{
    //MARK: - OUTLETS
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    //MARK: - VARIABLES
    private var question: String = ""
    private var options: [String] = []
    convenience init(question: String,options: [String]){
        self.init()
        self.question = question
        self.options = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }
}

extension QuestionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}
