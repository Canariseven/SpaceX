//
//  DetailRockt.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct DetailRocket: View {
    
    let rocket : Rocket
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(alignment: .center, spacing: 0, content: {
                ZStack(alignment: .top, content: {
                    header().height(520, alignment: .top)
                    Rectangle().foregroundColor(.clear).whiteBackgroundGradient().rotationEffect(Angle.degrees(180)).height(64 + 32, alignment: .top)
                })
                content()
            })
        })
       .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    func header() -> some View {
        HeaderDetailRocket(rocket: rocket)
    }
    
    func content() -> some View {
        VStack(alignment: .leading, spacing: 16, content: {
            fields()
            Text(rocket.description).fixedSize(horizontal: false, vertical: true)
        }).background(Color.black).foregroundColor(.white).padding()
    }
    
    func fields() -> some View {
        HStack(alignment: .center, spacing: 16) {
            CustomSection(title: "Height") {                
                Text(rocket.height.string()).applyTagStyle()
            }
            Divider().background(Color.white)
            CustomSection(title: "Diameter") {
                Text(rocket.diameter.string()).applyTagStyle()
            }
            Divider().background(Color.white)
            CustomSection(title: "Mass") {
                Text(rocket.mass.string()).applyTagStyle()
            }
        }
    }
    
}

struct HeaderDetailRocket: View {
    let rocket : Rocket
    let timer = Timer.publish(every: 3, on: RunLoop.main, in: RunLoop.Mode.default).autoconnect()
    @State var selected = 0
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            backgroundImages()
            bottomInfo().infinityWidth(alignment: .leading).blackBackgroundGradient()
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
    
    func backgroundImages() -> some View {
        ZStack(alignment: .center, content: {
            ForEach((0..<rocket.flickr_images.count), id: \.self) { index in
                DetailImage(url: rocket.flickr_images[index]).opacity(index == selected ? 1.0 : 0.0)
            }
        })
    }
    
    func bottomInfo() -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(rocket.name).font(.system(size: 64, weight: Font.Weight.heavy, design: .rounded))
            Text(rocket.type).font(.title).bold()
        }).padding().foregroundColor(.white)
    }
    
}

struct DetailImage : View {
    let url: URL
    private let downloader: DownloadImage = DownloadImage()
    @State private var image : Image?
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            image?.resizable()
        }).onAppear(perform: {
            downloader.download(url: url, content: $image)
        })
    }

}

struct DetailRockt_Previews: PreviewProvider {
    static var previews: some View {
        DetailRocket(rocket: exampleRocket)
    }
}
