//
//  CategoryModel.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

struct CategoryModel: Codable, Identifiable, Equatable {
    var id: ID
    var storeId: ID
    var name: String
    var description: String
    var image: Url?
}
