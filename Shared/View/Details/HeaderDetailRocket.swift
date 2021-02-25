//
//  HeaderDetailRocket.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import SwiftUI

struct HeaderDetailRocket: View {
    
    let rocket : Rocket
    
    private let timer = Timer.publish(every: 3, on: RunLoop.main, in: RunLoop.Mode.default).autoconnect()
    @State private var selected = 0
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            backgroundImages()
            bottomInfo().infinityWidth(alignment: .leading).applyCustomGradient(type: .black)
        }).onReceive(timer, perform: { _ in
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                if selected < rocket.flickr_images.count - 1 {
                    selected += 1
                } else {
                    selected = 0
                }
            }
        })
    }
    
    private func backgroundImages() -> some View {
        ZStack(alignment: .center, content: {
            ForEach((0..<rocket.flickr_images.count), id: \.self) { index in
                DetailImage(url: rocket.flickr_images[index]).opacity(index == selected ? 1.0 : 0.0)
            }
        })
    }
    
    private func bottomInfo() -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(rocket.name).font(.system(size: 64, weight: Font.Weight.heavy, design: .rounded))
            Text(rocket.type.capitalized).font(.title).bold()
        }).padding().foregroundColor(.white)
    }

}

struct HeaderDetailRocket_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailRocket(rocket: exampleRocket)
    }
}
