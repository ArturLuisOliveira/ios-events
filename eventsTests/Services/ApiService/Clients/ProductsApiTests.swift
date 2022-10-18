//
//  ProductsApiTest.swift
//  eventsTests
//
//  Created by Artur Luis on 18/10/22.
//

import XCTest
@testable import events

class ProductsApiTests: XCTestCase {
    
    
    func testList() {
        class MockedClient: ApiServiceProtocol {
            var baseUrl: String = ""
            func get<Params, Response: Codable>(
                url: String,
                params: Params?,
                onError: (() -> Void)?,
                onSuccess: @escaping (Response) -> Void) {
                    onSuccess(productsMock as! Response)
                }
            
        }
        
        let client = ProductsApi(client: MockedClient())
        client.index(storeId: 1, categoryId: 1) { response in
            XCTAssertEqual(response, productsMock);
        }
    }
    
    func testShow() {
        class MockedClient: ApiServiceProtocol {
            var baseUrl: String = ""
            func get<Params, Response: Codable>(
                url: String,
                params: Params?,
                onError: (() -> Void)?,
                onSuccess: @escaping (Response) -> Void) {
                    onSuccess(productsMock[0] as! Response)
                }
            
        }
        
        let client = ProductsApi(client: MockedClient())
        client.show(id: 1) { response in
            XCTAssertEqual(response, productsMock[0]);
        }
    }
}


