//
//  ProductsApiTest.swift
//  eventsTests
//
//  Created by Artur Luis on 18/10/22.
//

import XCTest
@testable import events

class CategoriesApiTests: XCTestCase {
    class MockedClient: ApiServiceProtocol {
        var baseUrl: String = ""
        func get<Params, Response: Codable>(
            url: String,
            params: Params?,
            onError: (() -> Void)?,
            onSuccess: @escaping (Response) -> Void) {
                onSuccess(categoriesMock as! Response)
            }
    }
    
    func testList() {
        let client = CategoriesApi(client: MockedClient())
        client.index(storeId: 1) { response in
            XCTAssertEqual(response, categoriesMock);
        }
    }
    
    func testShow() {
        
    }
}


