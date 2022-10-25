//
//  OrdersViewController.swift
//  events
//
//  Created by Artur Luis on 19/10/22.
//

import UIKit

class TicketsViewController: UIViewController {
    let productsView = ProductsViewController()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
//        view.backgroundColor = .blue
        self.view = view
        self.view.addSubview(productsView.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
