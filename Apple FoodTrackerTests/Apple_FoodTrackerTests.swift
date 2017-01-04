//
//  Apple_FoodTrackerTests.swift
//  Apple FoodTrackerTests
//
//  Created by Alexander Zou on 1/2/17.
//  Copyright © 2017 Alexander Zou. All rights reserved.
//

import XCTest
@testable import Apple_FoodTracker

class Apple_FoodTrackerTests: XCTestCase {
    
    
    
    // MARK: MEAL CLASS TESTS
    
    func testMealInitializationSuceeds() {
        // zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // confirm that the Meal initalizer returns nil when passed a negative rating or an empty name
    func testMealInitializationFails() {
        // negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)

        // empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
    }



}
