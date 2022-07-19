import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        HStack {
            Text("LOGIN")
                .foregroundColor(.white)
                .font(.headline.weight(.bold))
            Image(systemName: "arrow.right")
                .foregroundColor(.white)
                .font(.headline.weight(.bold))
        }.padding(.horizontal, 24)
            .padding(.vertical)
            .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
