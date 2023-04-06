//
//  ContentView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 03/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var passCode : String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("app logo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(3, contentMode: .fit)
                        .clipShape(Circle())
                        .foregroundColor(.accentColor)
                    Spacer()
                    TextField("Enter Passcode", text: $passCode)
                        .frame(alignment: .center)
                        .padding()
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                        .background(Color.white.cornerRadius(5))
                    NavigationLink("Submit") {
                        LodingView()
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.plain)
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .border(.green)
                    .padding(.top , 20)
                    .disabled(passCode.count > 5 ? false : true)
                    Spacer()
                }
                .padding()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
