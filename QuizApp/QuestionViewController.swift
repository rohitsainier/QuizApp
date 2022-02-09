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
    private var selection: ((String) -> Void)? = nil
    private let reuseIdentifier: String = "Cell"
    convenience init(question: String,options: [String], selection: @escaping (String) -> Void){
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }
}

extension QuestionViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(options[indexPath.row])
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier){
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
}
