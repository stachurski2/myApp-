//
//  MockWeather.swift
//  Airnauts_sandboxTests
//
//  Created by Stanisaw Sobczyk on 08/04/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

@testable import myApp
import XCTest

class MockWeatherViewController: WeatherViewControllerDelagate {
    func showError(message: String?) {
        
    }
    
    
    var weatherResult: Weather?
    
    var weatherFetchExceptation: XCTestExpectation?

    func showWeather(weather: Weather) {
        guard let expectation = weatherFetchExceptation else {
            XCTFail("Delegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        expectation.fulfill()
        weatherResult = weather
    }
}
