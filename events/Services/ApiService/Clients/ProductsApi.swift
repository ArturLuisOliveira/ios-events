//
//  ProductsApi.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

struct ProductsApi {
    var client: ApiServiceProtocol
    
    init(client: any ApiServiceProtocol = ApiService()) {
        self.client = client
    }
    
    func index(storeId: ID, categoryId: ID, onError: @escaping () -> Void = {}, onSuccess: @escaping ([ProductModel]) -> Void) {
        let params = ["storeId": storeId, "categoryId": categoryId]
        
        client.get(
            url: "/api/v1/products",
            params: params,
            onError: onError,
            onSuccess: onSuccess
        )
    }
    
    func show(id: ID, onError: @escaping () -> Void = {}, onSuccess: @escaping (ProductModel) -> Void) {
        client.get(
            url: "/api/v1/products/\(id)",
            params: [:],
            onError: onError,
            onSuccess: onSuccess
        )
    }
}
