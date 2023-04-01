//
//  RepositoriesVCTests.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import XCTest
@testable import GitHub_Repositories

final class RepositoriesVCTests: XCTestCase {
    
    var viewController: RepositoriesVC!
    
    override func setUpWithError() throws {
        viewController = RepositoriesVC()
        viewController.loadView()
        viewController.viewModel = RepositoriesVM(repositoriesRequest: MockRepositoriesRequest())
    }

    override func tearDownWithError() throws {
        viewController = nil
        super.tearDown()
    }

    func testShowLoading() {
        viewController.showLoading(true)

        // Verify that the activity indicator is animating and not hidden
        XCTAssertTrue(viewController.activityIndicator.isAnimating)
        XCTAssertFalse(viewController.activityIndicator.isHidden)

        // Call showLoading with false to hide the loading indicator
        viewController.showLoading(false)

        // Verify that the activity indicator is not animating and is hidden
        XCTAssertFalse(viewController.activityIndicator.isAnimating)
        XCTAssertTrue(viewController.activityIndicator.isHidden)
    }
    
    func testTextFieldDidChange() {
        viewController.searchTextField.text = "swift"
        viewController.textFieldDidChange(viewController.searchTextField)
        
        // search should clear previous results
        XCTAssertTrue(viewController.viewModel.repositories.isEmpty)
    }
}
