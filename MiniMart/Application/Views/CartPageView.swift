//
//  CartPageView.swift
//  MiniMart
//
//  Created by minami-inoue on 2021/08/17.
//

import Foundation
import SwiftUI

struct CartPageView: View{
    var body: some View{
        Text("Hello World!").navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            CartPageView()
        }
    }
}
