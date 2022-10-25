//
//  ProductModel.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

struct ProductModel: Codable, Identifiable, Equatable {
    var id: ID
    var categoryId: ID
    var storeId: ID
    var price: Cents
    var name: String
    var description: String
    var image: Url?
}
