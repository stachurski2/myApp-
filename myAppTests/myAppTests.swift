//
//  Airnauts_sandboxTests.swift
//  Airnauts_sandboxTests
//
//  Created by Stanisaw Sobczyk on 26/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import XCTest
@testable import myApp

class Airnauts_sandboxTests: XCTestCase {
    let searchViewDelegate = MockSearchViewController()
    let weatherViewDelegate = MockWeatherViewController()
    
    override func setUp() {
        super.setUp()
        CityFetch.sharedInstance.delegate = searchViewDelegate
        WeatherFetch.sharedInstance.delegate = weatherViewDelegate
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCityWarsawFetch() {
        testCityFetch(name: "Warszawa")
    }
    
    
    func testCityFetch(name: String) {
        let expectation = self.expectation(description: "city fetch test")
        searchViewDelegate.cityFetchExpectation = expectation
        CityFetch.sharedInstance.getList(name: name)
        waitForExpectations(timeout: 2.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            guard self.searchViewDelegate.cityFetchResult.count > 0  else {
                XCTFail("Expected delegate to be called")
                return
            }
        }
        guard let city = searchViewDelegate.cityFetchResult.first else {
              XCTFail("city unwrapp failed")
              return
        }
        print("\n Fetch of city succeded with \(city.name) \n")
        XCTAssert(true)
    }
    
    func testCityCoordinates() {
        testCityFetch(name: "Raciborz")
        guard let city = searchViewDelegate.cityFetchResult.first else {
            XCTFail("city unwrapp failed")
            return
        }
        let expectation = self.expectation(description: "city fetch test")
        searchViewDelegate.coordinaateFetchExpectation = expectation
        CityFetch.sharedInstance.getCoordinates(city: city)
        waitForExpectations(timeout: 11.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            guard let coordinates = self.searchViewDelegate.coordinatesResult else {
                XCTFail("Expected delegate to be called")
                return
            }
            print(" \n Fetch of coordinates \(coordinates.0), \(coordinates.1) \n ")
            XCTAssertTrue(true)
        }
    }
    
    func testWarsawWeatherFetch() {
        let coordinates = (Float(52.259), Float(21.020))
        let expectation = self.expectation(description: "weather fetch test")
        weatherViewDelegate.weatherFetchExceptation = expectation
        WeatherFetch.sharedInstance.getWeather(coordinates: coordinates)
        waitForExpectations(timeout: 2.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            guard let weather = self.weatherViewDelegate.weatherResult else {
                XCTFail("Expected delegate to be called")
                return
            }
            print(" \n Fetch of weather succeded, with: \(weather.describe), and tempertature \(weather.temperature) C \n ")
        }
    }
    


    

    
}


