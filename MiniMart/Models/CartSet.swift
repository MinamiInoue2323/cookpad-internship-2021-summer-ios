//
//  CartSet.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//

import Foundation

struct CartSet {
    var product: FetchProductsQuery.Data.Product
    var quantity: Int
    var price : Int{
        product.price * quantity
    }
}
