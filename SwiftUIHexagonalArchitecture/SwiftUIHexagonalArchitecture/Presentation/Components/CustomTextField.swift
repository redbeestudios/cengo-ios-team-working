import SwiftUI

struct CustomTextField: View {
    @State private var isTapped = false

    @Binding var text: String
    var hint: String
    var icon: String
    var isPassword: Bool

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 15) {
                    Button {} label: {
                        Image(systemName: icon)
                            .foregroundColor(.gray)
                    }
                    if isPassword {
                        SecureField("", text: $text) {
                            if text == "" {
                                withAnimation(.easeOut) {
                                    isTapped = false
                                }
                            }
                        }.onTapGesture {
                            withAnimation(.easeIn) {
                                isTapped = true
                            }
                        }
                    } else {
                        TextField ("", text: $text) { (status) in
                            if status {
                                withAnimation(.easeIn) {
                                    isTapped = true
                                }
                            }

                        } onCommit: {
                            if text == "" {
                                withAnimation(.easeOut) {
                                    isTapped = false
                                }
                            }
                        }
                    }

                    if isPassword {
                        Button {} label: {
                            Text("FORGOT")
                                .font(.caption.weight(.bold))
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                    }

                } //if tapped
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text(hint)
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? 28 : 28, y: isTapped ? -15 : 1)
                        .foregroundColor(isTapped ? .accentColor : .gray)
                    ,alignment: .leading
                )
                .padding(.horizontal)

                //divider
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 10)

            }
            .padding(.top, 12)
            .cornerRadius(5)

        }
        .padding(.horizontal, 10)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @State static var textOtro = ""
    static var previews: some View {
        CustomTextField(text: $textOtro ,hint: "EMAIL", icon: "envelope", isPassword: true)
    }
}
