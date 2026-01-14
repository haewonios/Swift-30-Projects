//
//  ProductsViewController.swift
//  GoodAsOldPhones
//
//  Created by hyewon on 1/14/26.
//

import UIKit

class ProductsViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let products: [Product] = [
        Product(image: UIImage(named: "image-cell1"),title: "1907 Wall Set", backgroundImage: UIImage(named: "phone-fullscreen1")),
        Product(image: UIImage(named: "image-cell2"),title: "1921 Dial Phone", backgroundImage: UIImage(named: "phone-fullscreen2")),
        Product(image: UIImage(named: "image-cell3"),title: "1937 Desk Set", backgroundImage: UIImage(named: "phone-fullscreen3")),
        Product(image: UIImage(named: "image-cell4"),title: "1984 Moto Portable", backgroundImage: UIImage(named: "phone-fullscreen4")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ProductsViewController viewDidLoad")
        configureTableView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell else {
            return ProductCell()
        }
        cell.configure(with: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select at \(indexPath.row)")
        let product = products[indexPath.row]
        let detailsVC = ProductDetailsViewController(
            image: product.backgroundImage,
            title: product.title
        )
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
