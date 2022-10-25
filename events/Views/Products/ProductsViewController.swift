//
//  CategoriesViewController.swift
//  events
//
//  Created by Artur Luis on 20/10/22.
//
import UIKit
import Foundation

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var products: [ProductModel]? = nil
    var categoryId: ID? = nil
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = products else { return 0 }
        
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
       
        guard let products = products else { return cell }
        
        let product = products[indexPath.item]
        cell.boot(product: product)
        
        return cell
    }
    
    public func boot(categoryId: ID) {
        self.categoryId = categoryId
    }
    
    public func fetch() {
        guard let categoryId = categoryId else { return }
        let productsApi = ProductsApi()
        productsApi.index(storeId: 1, categoryId: categoryId) { products in
            
            DispatchQueue.main.async {
                self.products = products
                self.tableView.reloadData()
            }
        }
    }
}
