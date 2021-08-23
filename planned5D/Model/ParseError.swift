//
//  ParseError.swift
//  planned5D
//
//  Created by Victor Barskov on 21.08.2021.
//

import Foundation

/// ParseError enum
public enum ParseError: Error {
    /// Case for decoding error
    case decodingError
    /// Case for unknown error
    case unknownError
}

extension ParseError: LocalizedError {
    /// Description for error
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Decoding went wrong, please check input data for decoding"
        case .unknownError:
            return "Something went wrong please try again later"
        }
    }
}
