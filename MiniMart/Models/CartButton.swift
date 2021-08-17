//
//  CartButton.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//

import SwiftUI

struct CartButton: View {
    @State var isCartViewPresented: Bool = false
    @EnvironmentObject var cartState: CartState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
