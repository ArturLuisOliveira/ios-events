//
//  CategoriesApi.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

import Foundation

struct CategoriesApi {
    private var client: ApiServiceProtocol
    
    init(client: any ApiServiceProtocol = ApiService()) {
        self.client = client
    }
    
    func index(storeId: ID, onError: @escaping () -> Void = {}, onSuccess: @escaping ([CategoryModel]) -> Void ) {
        client.get(
            url: "/categories",
            params: [storeId: storeId],
            onError: onError,
            onSuccess: onSuccess
        )
    }
}
