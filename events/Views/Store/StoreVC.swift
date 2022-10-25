//
//  OrdersViewController.swift
//  events
//
//  Created by Artur Luis on 19/10/22.
//

import UIKit

class StoreViewController: UIViewController {
    let categoriesVC = CategoriesViewController()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        self.view = view
        let nav1 = UINavigationController(rootViewController: categoriesVC)
        self.view.addSubview(categoriesVC.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

