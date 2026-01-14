//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by hyewon on 1/14/26.
//

import UIKit

struct Product {
    public let image: UIImage?
    public let title: String
    public let backgroundImage: UIImage?
    
    public init(image: UIImage?, title: String, backgroundImage: UIImage?) {
        self.image = image
        self.title = title
        self.backgroundImage = backgroundImage
    }
}
