//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by Rohit Saini on 08/02/22.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionViewControllerTest: XCTestCase{
    
    func test_viewDidLoad_QuestionHeaderText(){
        let sut = makeSUT(question: "Q1")
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_renderOptions(){
        XCTAssertEqual(makeSUT(options:[]).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options:["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options:["A1","A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_renderOptionText(){
        XCTAssertEqual(makeSUT(options: ["A1","A2"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options: ["A1","A2"]).tableView.title(at: 1), "A2")
    }
    
    func test_optionSelected_notifyDelegate(){
        var receiveAnswer = ""
        let sut = makeSUT(options: ["A1"]){
            receiveAnswer = $0
        }
        let indexpath = IndexPath(row: 0, section: 0)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexpath)
        XCTAssertEqual(receiveAnswer, "A1")
    }
    
    //MARK: - Helpers
    
    func makeSUT(question: String = "", options: [String] = [],selection: @escaping (String) -> Void = {_ in }) -> QuestionViewController{
        let sut = QuestionViewController(question:   question,options: options,selection: selection)
        _ = sut.view
        return sut
    }
}


private extension UITableView{
    func cell(at row: Int) -> UITableViewCell?{
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    func title(at row: Int) -> String?{
        return cell(at: row)?.textLabel?.text
    }
}
