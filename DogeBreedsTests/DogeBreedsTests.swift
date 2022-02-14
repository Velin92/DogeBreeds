//
//  DogeBreedsTests.swift
//  DogeBreedsTests
//
//  Created by Mauro Romito on 13/02/22.
//

import Combine
import XCTest
@testable import DogeBreeds

class DogeBreedsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBreedListViewModelOnAppear() throws {
        let mockedService = BreedServiceProtocolMock(
            getAllBreedsImpl: Just(
                [
                    BreedModel(name: "Test1", subBreeds: ["Sub Test 1"], imageUrls: [], isFavourite: false),
                    BreedModel(name: "Test2", subBreeds: ["Sub Test 2", "Sub Test 3"], imageUrls: [], isFavourite: true)
                ]
            )
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        )
        let viewModel = BreedsListViewModel(breedsService: mockedService)
        viewModel.onAppear()
        XCTAssert(viewModel.isFilterEnabled == false)
        XCTAssert(viewModel.filteredBreeds.count == 2)
        XCTAssert(viewModel.filteredBreeds[0].name == "Test1")
        XCTAssert(viewModel.filteredBreeds[1].name == "Test2")
    }
    
    func testBreedListViewModelFiltering() throws {
        let mockedService = BreedServiceProtocolMock(
            getAllBreedsImpl: Just(
                [
                    BreedModel(name: "Test1", subBreeds: ["Sub Test 1"], imageUrls: [], isFavourite: false),
                    BreedModel(name: "Test2", subBreeds: ["Sub Test 2", "Sub Test 3"], imageUrls: [], isFavourite: true)
                ]
            )
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        )
        let viewModel = BreedsListViewModel(breedsService: mockedService)
        viewModel.onAppear()
        viewModel.isFilterEnabled.toggle()
        XCTAssert(viewModel.isFilterEnabled == true)
        XCTAssert(viewModel.filteredBreeds.count == 1)
        XCTAssert(viewModel.filteredBreeds[0].name == "Test2")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
