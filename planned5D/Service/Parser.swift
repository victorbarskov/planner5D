//
//  Parser.swift
//  planned5D
//
//  Created by Victor Barskov on 20.08.2021.
//

import Foundation


/// Convenience projects parsing completion type
public typealias ProjectsCompletion = (([Project]?, ParseError?) -> ())

/// Protocol for parse service
public protocol ParserProtocol {
    
    /// This method gets local file name and completes with `Project` collection
    /// - Parameters:
    ///   - name: local file name
    ///   - completion: `Project` collection or `ParseError`
    func parse(jsonFile name: String, completion: @escaping ProjectsCompletion)
}

/// This service helps to parse local json 
public class Parser: ParserProtocol {
    
    /// This method helps read local json file and return `Data` object
    /// - Parameter name: file name
    /// - Returns: `Data` object
    private func readLocalJson(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
        
    /// This method gets local file name and completes with `Project` collection
    /// - Parameters:
    ///   - name: local file name
    ///   - completion: `Project` collection or `ParseError`
    public func parse(jsonFile name: String, completion: @escaping ProjectsCompletion) {
        DispatchQueue.global(qos: .background).async(execute: { () -> () in
            guard let jsonData = self.readLocalJson(forName: name) else {
                DispatchQueue.main.async { completion(nil, ParseError.unknownError) }
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([Project].self, from: jsonData)
                DispatchQueue.main.async { completion(decodedData, nil) }
            } catch {
                DispatchQueue.main.async { completion(nil, error as? ParseError)}
            }
        })
    }
        
}
