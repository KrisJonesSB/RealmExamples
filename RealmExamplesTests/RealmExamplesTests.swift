//
//  RealmExamplesTests.swift
//  RealmExamplesTests
//
//  Created by Kris Jones on 23/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import XCTest

class RealmExamplesTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGetPetitions() {
    
    let petitionManager = PetitionManager()
    
    self.measure {
      petitionManager.getPetitions()
    }
  }
  
}
