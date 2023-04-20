//
//  HomeView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 04/04/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var model = PermissionViewModel()
    var body: some View {
        TabView {
            if model.per.contains("Home"){
                Text("Tab Content 1").tabItem {
                    Image(systemName: "globe")
                    Text("Tab 1")
                }.tag(1)
            }
            if model.per.contains("Travel"){
               ResearchKitView()
                    .navigationBarHidden(true).tabItem {
                    Image(systemName: "bus")
                    Text("Tab 2") }.tag(2)
            }
            if model.per.contains("Cart"){
                Text("Tab Content 3").tabItem {
                    Image(systemName: "cart")
                    Text("Tab 3") }.tag(3)
            }
            if model.per.contains("Order"){
               ChatView().tabItem { Image(systemName: "shippingbox")
                    Text("Tab 4") }.tag(4)
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
