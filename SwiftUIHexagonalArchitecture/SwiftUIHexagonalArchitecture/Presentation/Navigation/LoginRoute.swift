import Foundation
import SwiftUI

struct LoginRoute {

    func toSingUp() -> AnyView {
        AnyView(
            NavigationLink("Sing up") {
                SingUpScreen()
                    .navigationTitle("SingUp")
            }
        )
    }

    func toHome(isActive: Binding<Bool>) -> AnyView {
        AnyView(
            NavigationLink(
                destination: HomeScreen(),
                isActive: isActive
            ) {
                EmptyView()
            }.hidden()
        )
    }

}
