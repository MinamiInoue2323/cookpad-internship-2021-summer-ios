//
//  CartPageView.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//

import Foundation
import SwiftUI



struct CartPageView: View{
    @EnvironmentObject var cartState: CartState
    var body: some View {
        List(cartState.products, id: \.id){
            product in
                NavigationLink(destination: ProductDetailPageView(product: product)){
                    HStack(alignment: .top){
                        RemoteImage(urlString: product.imageUrl).frame(width:100, height: 100)
                        VStack(alignment: .leading){
                            Text(product.name)
                            Spacer()
                            Text("\(product.price)円").frame(maxWidth: .infinity, alignment: .trailing)
                            
                        }
                        .padding(.vertical, 8)
                }

                    
                    
                }
            
        }
    
    }
}

struct CartPageView_Previews: PreviewProvider{
    
    static var previews: some View{
        NavigationView{
            CartPageView()
        }.environmentObject(CartState())
    }
    
}
