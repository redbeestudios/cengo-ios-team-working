//
//  SwiftUIView.swift
//  
//
//  Created by fgsoruco on 22/06/2022.
//

import SwiftUI

public struct LoginView: View {
    
    @StateObject var vm: LoginViewModel = LoginViewModel()
    
    public init() {
        
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text("Login")
            Text("Please sign in to continue")
            HStack(alignment: .center) {
                Image(systemName: "mail.fill")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Email")
                    TextField("example@test.com", text: $vm.email)
                        .padding(.top, 10)
                }
            }.padding(.top, 20)
            HStack(alignment: .center) {
                Image(systemName: "lock.fill")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Password")
                    TextField("*****", text: $vm.password)
                        .padding(.top, 10)
                }
            }.padding(.top, 20)
            Button {

            } label: {
                VStack {
                    Button(action: {
                        vm.login(email: vm.email, password: vm.password)
                    })
                    {
                    HStack {
                        Text("Login")
                        Image(systemName: "arrow.right")
                    }
                    .padding(10)
                    }
                }.buttonStyle(CustomizedStyle())
            }
            HStack {
                Text("Don't you have an account")
                Button {

                } label: {
                    Text("Sign Up")
                }

            }
            Spacer()
            Text(vm.result)
        }
    }
}

struct CustomizedStyle: PrimitiveButtonStyle {
    typealias Body = Button
    func makeBody(configuration: Configuration) -> some View {
        //print(configuration.label)
        //configuration.trigger()

        return Button(configuration)
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .foregroundColor(Color.white)
    }
}

public struct SwiftUIView_Previews: PreviewProvider {
    public static var previews: some View {
        LoginView()
    }
}
