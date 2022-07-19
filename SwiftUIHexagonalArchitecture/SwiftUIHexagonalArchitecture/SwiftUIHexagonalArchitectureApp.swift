import SwiftUI

@main
struct SwiftUIHexagonalArchitectureApp: App {

    let application: Application

    init() {
        application = Application()
    }

    var body: some Scene {
        WindowGroup {
            LoginScreen().environmentObject(application.loginService)
        }
    }
}
