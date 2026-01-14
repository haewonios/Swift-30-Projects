//
//  MainTabBarViewController.swift
//  GoodAsOldPhones
//
//  Created by hyewon on 1/14/26.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViewControllers()
    }
}

extension MainTabBarViewController {
    /// 탭바 뷰컨트롤러 설정
    private func configureViewControllers() {
        // 네비게이션뷰컨트롤러로 감싸줌
        let products: ProductsViewController = {
            let vc = ProductsViewController()
            vc.title = "Products"
            return vc
        }()
        
        let us: UsViewController = {
           let vc = UsViewController()
            vc.title = "Us"
            return vc
        }()
        
        setViewControllers([UINavigationController(rootViewController: products), us], animated: false)
    }
}
