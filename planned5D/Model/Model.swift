//
//  Project.swift
//  planned5D
//
//  Created by Victor Barskov on 20.08.2021.
//

import Foundation

/// Project structure. The object to be showed to user
public struct Project: Codable {
    /// Project name
    let name: String?
    /// Unique project identifier
    let identifier: String?
    /// `House` object
    let house: House?
}

/// House structure. Contains rooms to draw
public struct House: Codable {
    /// Colection of `Room` objects
    let rooms: [Room]?
}

/// Room structure. Contains walls and starting position to draw
public struct Room: Codable {
    /// Ordered collection of `Int` - first object is X coord and second object is Y coord
    let position: [Int]?
    /// Collection os `Wall` objects
    let walls: [Wall]?
}

/// Wall structure. Contains start and end coordinates for drawing
public struct Wall: Codable {
    /// Start position to draw
    let start: [Int]
    /// End position to draw
    let end: [Int]
}
