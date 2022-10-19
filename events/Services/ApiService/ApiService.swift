//
//  ApiService.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

import Foundation

protocol ApiServiceProtocol {
    var baseUrl: String { get }
    func get<Params, Response:Codable>(url: Url, params: Params?, onError:(()->Void)?,onSuccess: @escaping (Response) -> Void)
}

struct ApiService: ApiServiceProtocol {
    internal var baseUrl: String
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init(baseUrl: String? = nil){
        self.baseUrl = baseUrl ?? "http://localhost:3000"
    }
    
    func get<Params, Reponse: Codable>(url: Url, params: Params? = [:], onError: (() -> Void)? = {}, onSuccess: @escaping (Reponse) -> Void) {
        var request = URLRequest(url: URL(string: "\(baseUrl)\(url)")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error -> Void in
            if error != nil {
                onError?()
                return
            }
            do {
                let result = try decoder.decode(Reponse.self, from: data!)
                onSuccess(result)
            }  catch {
                onError?()
            }
        }
        
        task.resume()
    }
}
