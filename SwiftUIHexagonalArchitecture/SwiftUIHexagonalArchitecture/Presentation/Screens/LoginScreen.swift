import SwiftUI

struct LoginScreen: View {

    @EnvironmentObject var loginService: LoginService
    let router = LoginRoute()

    var body: some View {

        NavigationView {

            VStack(alignment: .leading, spacing: 5) {

                HStack{
                    Spacer()
                    Image("fondo")
                        .scaledToFit()
                }
                .padding(.top, -99)
                .padding(.trailing , -59)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    Text("Please sign in to continue")
                        .font(.headline)
                        .foregroundColor(.gray)
                }.padding(.horizontal, 35)

                VStack {
                    CustomTextField(
                        text: $loginService.username,
                        hint: "EMAIL",
                        icon: "envelope",
                        isPassword: false)

                    CustomTextField(
                        text: $loginService.password,
                        hint: "PASSWORD",
                        icon: "lock.rectangle",
                        isPassword: true)
                    .padding(.top, 23)
                }
                .padding(.top, 40)
                .padding(.horizontal, 25)

                HStack(spacing: 10) {
                    Spacer()
                    Button(
                        action: {
                            if(!loginService.credentialsAreEmpty()) {
                                Task(priority: .userInitiated) {
                                    await loginService.start()
                                }
                            }
                        },
                        label:  {
                            CustomButtonView(isDisabled: loginService.credentialsAreEmpty())
                            router.toHome(isActive: $loginService.isSuccessLogin) }
                    ).disabled(loginService.credentialsAreEmpty())
                }
                .padding(.top, 23)
                .padding(.horizontal, 25)

                Spacer()

                HStack {
                    Spacer()
                    VStack {
                        ProgressView()
                            .opacity(loginService.isLoading ? 1 : 0)
                        Text(loginService.response?.error ?? "")
                            .opacity(loginService.isLoading ? 0 : 1)
                            .foregroundColor(.red)
                    }
                    Spacer()
                }.padding(.bottom, 20)

                HStack {
                    Spacer()
                    Text("Dont' have an account?")
                        .font(.headline)
                        .foregroundColor(.gray)
                    router.toSingUp()
                        .font(.headline.weight(.bold))
                        .foregroundColor(.orange)
                    Spacer()
                }
                .padding(.bottom, 25)
            }
            .padding(.horizontal, 10)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))

        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static let application = Application()

    static var previews: some View {
        LoginScreen().environmentObject(application.loginService)
    }
}
