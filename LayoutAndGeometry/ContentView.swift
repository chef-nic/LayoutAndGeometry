//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Nicholas Johnson on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(color(for: proxy.frame(in: .global).minY, and: fullView.size.height))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(proxy.frame(in: .global).maxY / 200)
                            .scaleEffect(
                                CGSize(
                                    width: max(0.5, (proxy.frame(in: .global).minY / fullView.size.height)),
                                    height: max(0.5, (proxy.frame(in: .global).minY / fullView.size.height))
                                )
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func color(for yPos: Double, and viewHeight: Double) -> Color {
        return Color(hue: min(1, yPos / viewHeight), saturation: 0.8, brightness: 1)
    }
}

#Preview {
    ContentView()
}
