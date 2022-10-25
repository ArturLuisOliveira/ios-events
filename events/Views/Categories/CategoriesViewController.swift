//
//  CategoriesViewController.swift
//  events
//
//  Created by Artur Luis on 20/10/22.
//
import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView?
    private var categories: [CategoryModel]? = nil
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeCollectionView()
        fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let categories = categories else { return 0 }
        
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        guard let categories else { return cell }
        
        let category = categories[indexPath.item]
        cell.boot(name: category.name, image: category.image)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductsViewController()
        guard let categories = categories else { return }
        let category = categories[indexPath.item]
        productVC.boot(categoryId: category.id)
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    private func initializeCollectionView() {
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 4, height:( view.frame.size.width/2)-4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    private func fetch() {
        let categoriesApi = CategoriesApi()
        categoriesApi.index(storeId: 1) { categories in
            DispatchQueue.main.async {
                self.categories = categories
                self.collectionView?.reloadData()
            }
            
        }
    }
}
