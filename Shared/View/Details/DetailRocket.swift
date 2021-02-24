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
                header().height(420, alignment: .top)
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
    private let downloader: DownloadImage = DownloadImage()
    @State var image : Image?
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            backgroundImages()
            bottomInfo().infinityWidth(alignment: .leading).blackBackgroundGradient()
        }).onAppear(perform: {
            downloader.download(url: rocket.flickr_images.first!, content: $image)
        })
    }
    
    func backgroundImages() -> some View {
        image?.resizable()
    }
    
    func bottomInfo() -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(rocket.name).font(.system(size: 64, weight: Font.Weight.heavy, design: .rounded))
            Text(rocket.type).font(.title).bold()
        }).padding().foregroundColor(.white)
    }
    
}

struct DetailRockt_Previews: PreviewProvider {
    static var previews: some View {
        DetailRocket(rocket: exampleRocket)
    }
}
