//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by Alexander Lazarev on 13.02.2025.
//

import Foundation
import XCTest 
@testable import MovieQuiz

final class ArrayTests: XCTestCase {
    func testGetValueInRange() throws {

        let array = [1, 1, 2, 3, 5]
        
        let value = array[safe: 2]
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    
    func testGetValueOutOfRange() throws {
        
        let array = [1, 1, 2, 3, 5]
        
        let value = array[safe: 20]
        
        XCTAssertNil(value)
    }
}
