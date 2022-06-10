//
//  ContentView.swift
//  MarketplaceDummy
//
//  Created by fgsoruco on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Text("Hello, world!")
        .padding()
        .border(.green, width: 4)
        .background(.red)
        .frame(width: 200, height: 100, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
