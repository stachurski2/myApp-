import XCTest
@testable import myApp

class MockSearchViewController: SearchViewControllerDelegate {
    func goToWeatherview(with coordiantes: (Float, Float)) {
        guard let expectation = coordinaateFetchExpectation else {
            XCTFail("SpyDelegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        coordinatesResult = coordiantes
        expectation.fulfill()
    }
    
    

    var cityFetchResult: [City] = []
    var coordinatesResult: (Float, Float)?
    
    var cityFetchExpectation: XCTestExpectation?
    var coordinaateFetchExpectation: XCTestExpectation?
    
    func updateData(cities: [City]) {
        guard let expectation = cityFetchExpectation else {
            XCTFail("Delegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        
        cityFetchResult = cities
        expectation.fulfill()
    }
    
     func showErrorMessage(message: String?) {
        XCTFail("Error resulted a fetch")
    }

}

