//
//  LodingView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 04/04/23.
//

import SwiftUI
import SSSwiftUIGIFView

struct LodingView: View {
    @State var pushNewView: Bool = false
    
    var body: some View {
        SwiftUIGIFPlayerView(gifName: "nice")
            .navigationBarHidden(true)
        NavigationLink("", destination: HomeView(), isActive: $pushNewView)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                    pushNewView = true
                }
            }
    }
}

struct LodingView_Previews: PreviewProvider {
    static var previews: some View {
        LodingView()
    }
}
