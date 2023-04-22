//
//  ContentView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 03/04/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State var passCode : String = ""
    @State var unlock : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("", destination: LodingView(), isActive: $unlock)
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
                    Button(action: {
                        unlock = true
                    }, label: {
                        Text("Submit")
                    })
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
        .onAppear(perform: {
            authenticate()
        })
        .navigationViewStyle(.stack)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    unlock = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
