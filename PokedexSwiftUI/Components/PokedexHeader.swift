//
//  PokedexHeader.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import SwiftUI

struct PokedexHeader: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                .fill(Color(hex: 0xb82525))
                .frame(height: 200)
                .edgesIgnoringSafeArea(.top)
                .position(x: (screenWidth/2) + 2, y: 5)
                .padding(.bottom, -95)
                
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                .fill(Color(hex: 0xe03a3a))
                .frame(height: 200)
                .edgesIgnoringSafeArea(.top)
                .position(x: screenWidth/2)
                .padding(.bottom, -95)
        }
        .offset(y: 10)
        .padding(.bottom, -500)
        .background(Color(hex: 0xebebeb).ignoresSafeArea(.all))
    }
}

struct PokedexHeader_Previews: PreviewProvider {
    static var previews: some View {
        PokedexHeader()
    }
}
