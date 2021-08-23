//
//  ProjectListViewModelDelegateMock.swift
//  planned5DTests
//
//  Created by Victor Barskov on 20.08.2021.
//

import Foundation
@testable import planned5D

public class ProjectListViewModelDelegateMock: ProjectListViewModelDelegate {
    
    var error: ParseError?
    
    public func viewModelDidParseProjects() { }
    public func failedParse(with error: ParseError?) {
        self.error = error
    }
    
}
