//
//  ProductDetailPageView.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//
import SwiftUI
import Foundation


struct ProductDetailPageView: View {
    @EnvironmentObject var cartState: CartState
    var product: FetchProductsQuery.Data.Product
    @State var isCartViewPresented: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            RemoteImage(urlString: product.imageUrl).frame(height:300)
            VStack(alignment: .leading){
                Text(product.name).font(.title)
                Text("\(product.price)円").font(.title2).padding(.vertical, 8)
                Text(product.summary)
                Spacer()
                Button(action: {
                    cartState.add(product:product)
                    
                }){
                    Text("カートに追加").frame(maxWidth: .infinity,maxHeight: 60).background(Color.orange).foregroundColor(Color.white).cornerRadius(10)
                }
            }.padding(.horizontal, 9)
        
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {self.isCartViewPresented = true}){
                    Image(systemName: "folder")
                }
                Text("\(cartState.totalProductCounts)")
            }
        }.sheet(isPresented: $isCartViewPresented){
            NavigationView{
                CartPageView( isCartViewPresented: $isCartViewPresented)
            }
        }.navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "商品 \(1)",
                    price: 100,
                    summary: "おいしい食材 \(1)",
                    imageUrl: "https://image.mini-mart.com/dummy/1"
                )
            )
        }.environmentObject(CartState())
    }
}
