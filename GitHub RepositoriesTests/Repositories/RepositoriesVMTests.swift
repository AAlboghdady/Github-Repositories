//
//  RepositoriesVMTests.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import XCTest
@testable import GitHub_Repositories

final class RepositoriesVMTests: XCTestCase {
    
    var viewModel: RepositoriesVM!
    var mockRepositoriesRequest: MockRepositoriesRequest!
    
    override func setUpWithError() throws {
        mockRepositoriesRequest = MockRepositoriesRequest()
        viewModel = RepositoriesVM(repositoriesRequest: mockRepositoriesRequest)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockRepositoriesRequest = nil
        super.tearDown()
    }
    
    func testGetRepositoriesSuccess() {
        mockRepositoriesRequest.shouldFail = false
        let expectation = XCTestExpectation(description: "Repositories loading")
        viewModel.getRepositories()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            XCTAssertTrue(self.viewModel.repositories.count == 1)
            XCTAssertEqual(self.viewModel.repositories[0].name, "Repository name")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testGetRepositoriesFailure() {
        mockRepositoriesRequest.shouldFail = true
        let expectation = XCTestExpectation(description: "Failed to load repositories")
        viewModel.getRepositories()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            XCTAssertTrue(self.viewModel.repositories.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testSearchInRepositories() {
        let expectedText = "swift"
        mockRepositoriesRequest.isSearching = true
        viewModel.searchInRepositories(text: expectedText)
        let searchExpectation = expectation(description: "Repositories Search")
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            XCTAssertFalse(self.viewModel.repositories.isEmpty)
            searchExpectation.fulfill()
        }
        wait(for: [searchExpectation], timeout: 3.0)
    }
}
