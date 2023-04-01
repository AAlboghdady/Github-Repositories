//
//  RepositoryCellTests.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import XCTest
@testable import GitHub_Repositories

final class RepositoryCellTests: XCTestCase {
    
    var cell: RepositoryCell!
    
    override func setUpWithError() throws {
        let bundle = Bundle(for: RepositoryCell.self)
        let nib = UINib(nibName: "RepositoryCell", bundle: bundle)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        cell = objects.first as? RepositoryCell
    }
    
    override func tearDownWithError() throws {
        cell = nil
        super.tearDown()
    }
    
    func testAwakeFromNib() {
        XCTAssertEqual(cell.ownerImageView.layer.cornerRadius, 8)
    }
    
    func testConfigure() {
        var repository = Repository()
        repository.name = "Repository name"
        var owner = Owner()
        owner.login = "user name"
        repository.owner = owner
        repository.created_at = "2015-05-07T15:47:47Z"
        cell.configure(repository: repository)

        XCTAssertEqual(cell.repositoryNameLabel.text, "Repository name")
        XCTAssertEqual(cell.ownerNameLabel.text, "user name")

        let expectedDateString = "Thursday, May 7, 2015"
        XCTAssertEqual(cell.creationDateLabel.text, expectedDateString)
    }
    
    func testSetDateMoreThanSixMonths() {
        let dateString = "2021-04-01T12:32:53Z"
        cell.setDate(dateString: dateString)
        
        XCTAssertEqual(cell.creationDateLabel.text, "Thursday, Apr 1, 2021")
    }
    
    func testSetDateLessThanSixMonths() {
        let dateString = "2022-12-31T23:32:53Z"
        cell.setDate(dateString: dateString)
        
        XCTAssertEqual(cell.creationDateLabel.text, "3 months ago")
    }
    
    func testLoadImage() {
        let expectation = XCTestExpectation(description: "Image loaded successfully")
        let url = "https://avatars.githubusercontent.com/u/111015651?v=4"
        
        cell.ownerImageView.loadImage(from: url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [unowned self] in
            XCTAssertNotNil(self.cell.ownerImageView.image) // check if image is not nil after loading
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // wait for expectation to be fulfilled or timeout after 10 seconds
    }
    
    func testToDate() {
        let dateString = "2021-04-01T12:32:53Z"
        let date = dateString.toDate()
        XCTAssertNotNil(date)
        XCTAssertEqual(date.dateString, "Thursday, Apr 1, 2021")
    }
}
