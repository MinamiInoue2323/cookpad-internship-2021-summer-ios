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
    @State private var isPresented = false
    @Binding var isCartViewPresented: Bool
    var body: some View {
        VStack {
            List(cartState.cartSets, id: \.product.id){
                item in
                NavigationLink(destination: ProductDetailPageView(product: item.product)){
                        HStack(alignment: .top){
                            RemoteImage(urlString: item.product.imageUrl).frame(width:100, height: 100)
                            VStack(alignment: .leading){
                                Text(item.product.name)
                                Text("\(item.product.price)円")
                                Text("\(item.quantity)個")
                                
                                
                            }
                            .padding(.vertical, 8)
                    }

                        
                        
                    }
                
            }
            VStack(spacing: 16){
                Divider()
                Text("合計：\(cartState.totalProductPrice)円").frame(maxWidth: .infinity, alignment: .trailing)
                Button(action: {
                    isPresented = true
                    
                    
                }){
                    Text("注文する").frame(maxWidth: .infinity,maxHeight: 60).background(Color.orange).foregroundColor(Color.white).cornerRadius(10)
                }.alert(isPresented: $isPresented){
                    Alert(title: Text("注文完了"), message: Text("ご注文ありがとうございます"), dismissButton: .default(Text("OK")){
                        isCartViewPresented = false
                        cartState.refreshCart()
                    })
                    
                }
                Divider()
            }
            
        }
        
        
    
    }
}

struct CartPageView_Previews: PreviewProvider{
    @State static var isCartViewPresented: Bool = false
    
    static var previews: some View{
        NavigationView{
        }.environmentObject(CartState())
    }
    
}
