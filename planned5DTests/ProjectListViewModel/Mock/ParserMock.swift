//
//  ParserMock.swift
//  planned5DTests
//
//  Created by Victor Barskov on 20.08.2021.
//

import Foundation
@testable import planned5D

class ParserMock: ParserProtocol {
    
    var returnValue: Bool = false
    
    func parse(jsonFile name: String, completion: @escaping ProjectsCompletion) {
        let wall = Wall(start: [0,100], end: [100,100])
        let room = Room(position: [0,0], walls: [wall])
        let house: House = House(rooms: [room])
        let projects: [Project] = [Project(name: "name", identifier: "id", house: house)]
        returnValue ? completion(projects, nil):completion(nil, ParseError.unknownError)
    }
    
    
}
