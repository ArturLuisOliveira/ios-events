//
//  ViewController.swift
//  events
//
//  Created by Artur Luis on 18/10/22.
//

import UIKit

class ViewController: UITabBarController {
    let categoriesVC = CategoriesViewController()
    let ticketsVC = TicketsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        assignViewControllers()
        setIcons()
    }
    
    private func setTitles() {
        categoriesVC.title = "Loja"
        ticketsVC.title = "Tickets"
    }
    
    private func assignViewControllers() {
        let nav1 = UINavigationController(rootViewController: categoriesVC)
        let nav2 = UINavigationController(rootViewController: ticketsVC)
        self.setViewControllers([nav1, nav2], animated: true)
    }
    
    private func setIcons() {
        guard let items = self.tabBar.items else { return }
        
        let images = ["bag", "ticket"]
        
        items.enumerated().forEach { (index, item) in
            item.image = UIImage(systemName: images[index])
        }
    }
}
