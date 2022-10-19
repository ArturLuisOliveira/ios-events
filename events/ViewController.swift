//
//  ViewController.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

import UIKit

class ViewController: UITabBarController {
    let ordersVC = OrdersViewController()
    let productsVC = ProductsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        assignViewControllers()
        setIcons()
    }
    
    private func setTitles() {
        ordersVC.title = "Pedidos"
        productsVC.title = "Produtos"
    }
    
    private func assignViewControllers() {
        self.setViewControllers([ordersVC, productsVC], animated: true)
    }
    
    private func setIcons() {
        guard let items = self.tabBar.items else { return }
        
        let images = ["bag", "ticket"]
        
        items.enumerated().forEach { (index, item) in
            item.image = UIImage(systemName: images[index])
        }
    }
}
