//
//  ProjectListViewModel.swift
//  planned5D
//
//  Created by Victor Barskov on 20.08.2021.
//

import Foundation

/// ProjectListViewModelDelegate protocol
public protocol ProjectListViewModelDelegate: AnyObject {
    /// Signal for refreshing
    func viewModelDidParseProjects()
    /// Failed parse
    /// - Parameter error: `ParseError` object
    func failedParse(with error: ParseError?)
}

/// ProjectListViewModel
public class ProjectListViewModel {
    
    /// Parser `ParserProtocol`
    public var parser: ParserProtocol
    /// Delegate `ProjectListViewModelDelegate`
    weak var delegate: ProjectListViewModelDelegate?
    /// Collection of parsed `Project`'s
    public var projects: [Project?] = []
    
    init(withParser parser: ParserProtocol) {
        self.parser = parser
    }
    
    /// This method gets filename of json file and parse it to collection of `Project` objects
    /// - Parameter fileName: filename of local json file
    public func parse(with fileName: String) {
        parser.parse(jsonFile: fileName) {[weak self] projects, error  in
            if error == nil {
                self?.projects = projects ?? []
                self?.delegate?.viewModelDidParseProjects()
            } else {
                self?.delegate?.failedParse(with: error)
            }
        }
    }
    
}
