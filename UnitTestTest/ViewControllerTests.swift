//
//  ViewControllerTests.swift
//  UnitTestTest
//
//  Created by Peter Pohlmann on 08.09.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import XCTest
@testable import UnitTestTest

class ViewControllerTests: XCTestCase {
    
   let viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    

    func testIsNumberEven(){
       
        let odd = 7
        let even = 12
    
        XCTAssertFalse(viewController.isNumberEven(odd))
        XCTAssertTrue(viewController.isNumberEven(even))
    }
    
    
    func testsumEvenValueFibo(){
        let limit = 4000000
        let answer = 4613732
        
        XCTAssertEqual(viewController.sumEvenValueFibo(limit), answer, "This should be 4613732")
        
    }
    
    
}
