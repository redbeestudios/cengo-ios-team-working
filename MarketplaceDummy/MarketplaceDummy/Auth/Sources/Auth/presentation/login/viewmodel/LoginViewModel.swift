//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

public class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var result = ""

    let loginUseCase: ILoginUseCase
    let loginRepository: ILoginRepository

    public init(){
        loginRepository = LoginRepository(dataSource: NetworkDataSource())
        loginUseCase = LoginUseCase(loginRepository: loginRepository)
    }
    
    func login(email: String, password: String){
        print("login flow: step 1 call func login from ViewModel")
        let response = loginUseCase.login(username: email, password: password)
        result = response
    }
}
