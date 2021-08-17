//
//  CartState.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//

import Foundation
import Combine

final class CartState: ObservableObject {
    @Published var cartSets: [CartSet] = []
    func add(product : FetchProductsQuery.Data.Product){
        if let itemIndex = cartSets.firstIndex(where: {$0.product.id == product.id}){
            var item = cartSets[itemIndex]
            item.quantity += 1
            cartSets[itemIndex] = item
        } else{
            cartSets.append(.init(product: product, quantity: 1))
        }
    }
    var totalProductCounts: Int{
        cartSets.reduce(0) {(sum, item) in
            sum + item.quantity
        }
    }
    var totalProductPrice: Int{
        cartSets.reduce(0) {(sum, item) in
            sum + item.price
        }
    }
    func refreshCart(){
        cartSets = []
        
    }
}
