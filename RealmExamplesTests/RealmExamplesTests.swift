//
//  RealmExamplesTests.swift
//  RealmExamplesTests
//
//  Created by Kris Jones on 23/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import XCTest
@testable import RealmExamples
import RealmSwift


class RealmExamplesTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Clear RealmDB
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
  }
  
  func testGetPetitionsWithDefaultRealm() {
    let realm = try! Realm()
    let petitionManager = PetitionManager()
    petitionManager.loadPetitionsTo(realm:realm)
    let allPetitions = petitionManager.getAllPetitions(realm: realm)
    XCTAssertEqual(50, allPetitions?.count, "Count should be 50")
  }
  
  func testGetPetitionsWithStateClosed() {
    let realm = try! Realm()
    let petitionManager = PetitionManager()
    petitionManager.loadPetitionsTo(realm:realm)
    let closedPetitions = petitionManager.getPetitionsWith(state: "closed", realm: realm)
    XCTAssertEqual(50, closedPetitions?.count, "Count should be 50")
  }
  
  func testGetPetitionsWithStateOpenStoredByDate() {
    let realm = try! Realm()
    let petitionManager = PetitionManager()
    petitionManager.loadPetitionsTo(realm:realm)
    let closedPetitions = petitionManager.getPetitionsOrder(sortKey: "createdAt", realm: realm)
    XCTAssertEqual(50, closedPetitions?.count, "Count should be 50")
  }
  
  func testGetPetitionsWithInMemoryRealm() {
    
    // In
    let inMemoryRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))
    let petitionManager = PetitionManager()
    petitionManager.loadPetitionsTo(realm:inMemoryRealm)
    let allPetitions = petitionManager.getAllPetitions(realm: inMemoryRealm)
    XCTAssertEqual(50, allPetitions?.count, "Count should be 50")
    
    let defaultPersistedRealm = try! Realm()
    let allPersistedPetitions = petitionManager.getAllPetitions(realm: defaultPersistedRealm)
    XCTAssertEqual(0, allPersistedPetitions?.count, "Count should be 0")
    
  }
  
}
