//
//  ProjectListViewModelTests.swift
//  planned5DTests
//
//  Created by Victor Barskov on 20.08.2021.
//

import XCTest
@testable import planned5D


class ProjectListViewModelTests: XCTestCase {
    
    var objectUnderTest: ProjectListViewModel?
    var projectListDelegateMock: ProjectListViewModelDelegateMock?
    var parserMock: ParserMock?
    
    override func setUpWithError() throws {
        parserMock = ParserMock()
        projectListDelegateMock = ProjectListViewModelDelegateMock()
        objectUnderTest = ProjectListViewModel(withParser: parserMock!)
        objectUnderTest?.delegate = projectListDelegateMock
    }
    
    override func tearDownWithError() throws {
        objectUnderTest = nil
    }
    
    func test_parsing_fail_with_error() {
        let expectedError = ParseError.unknownError
        objectUnderTest?.parse(with: "")
        XCTAssertEqual(projectListDelegateMock?.error, expectedError)
    }
    
    func test_parsing_fail() {
        parserMock?.returnValue = false
        objectUnderTest?.parse(with: "")
        XCTAssertTrue(objectUnderTest?.projects.count == 0)
    }
    
    func test_parsing_success() {
        parserMock?.returnValue = true
        objectUnderTest?.parse(with: "")
        XCTAssertTrue(objectUnderTest?.projects.first??.name == "name")
        XCTAssertTrue(objectUnderTest?.projects.count == 1)
    }
    
    
}
