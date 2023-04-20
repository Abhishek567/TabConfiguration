//
//  ResearchKitView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 10/04/23.
//

import SwiftUI


struct ResearchKitView: View {
    var body: some View {
        
        VStack(spacing : 40) {
            NavigationLink(destination: {
                ConsestView()
            }, label: {
                Text("Consest")
            })
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
            
            NavigationLink {
                surveyFormView()
                    .navigationBarHidden(true)
            } label: {
                Text("Suvery")
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
            
            NavigationLink {
                ActiveTasksView()
                    .navigationBarHidden(true)
            } label: {
                Text("Active Task")
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
        }
        .foregroundColor(Color.white)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

struct ResearchKitView_Previews: PreviewProvider {
    static var previews: some View {
        ResearchKitView()
    }
}
