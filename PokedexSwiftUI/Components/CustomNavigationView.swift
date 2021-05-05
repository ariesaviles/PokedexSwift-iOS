//
//  CustomNavigationView.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import SwiftUI

struct CustomNavigationView<Content: View, Destination : View>: View {
    let destination : Destination
    let isRoot : Bool
    let isLast : Bool
    let color : Color
    let content: Content
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, isRoot : Bool, isLast : Bool,color : Color, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
                    GeometryReader { geometry in
                        Color.white
                        VStack {
                            ZStack {
                                WaveShape()
                                    .fill(color.opacity(0.3))
                              // navigation bar items should be here inside of an HStack
                            }
                            .frame(width: geometry.size.width, height: 90)
                            .edgesIgnoringSafeArea(.top)

                            Spacer()
                            self.content
                                .padding()
                                .background(color.opacity(0.3))
                                .cornerRadius(20)
                            Spacer()
                        }
                    }.navigationBarHidden(true)
        }
    }
 }

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(destination: pokedexView(), isRoot: false, isLast: false, color: .green))
    }
}

struct WaveShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.5),
                      control2: CGPoint(x: rect.maxX * 0.35, y: rect.maxY * 2))
        return path
    }
}
