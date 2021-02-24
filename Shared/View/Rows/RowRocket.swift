//
//  RowRocket.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct RowRocket: View {
    let rocket : Rocket
    let downloader : DownloadImage = DownloadImage()
    @State var image : Image?
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            backgroundContent().frame(width: 240, height: 320, alignment: .center).clipped()
            info()
        }).cornerRadius(8)
        .onAppear(perform: {
            if image == nil, let url = rocket.flickr_images.first {
                downloader.download(url: url, content: $image)
            }
        })
    }
    
    func backgroundContent() -> some View {
        if let image = image {
            return AnyView(image.resizable().scaledToFill())
        } else {
            return AnyView(RoundedRectangle(cornerRadius: 8).background(Color.secondary))
        }
    }

    func info() -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(rocket.name)
                .foregroundColor(Color.white)
                .bold()
                .font(.title)
            Text(rocket.type)
                .foregroundColor(Color.white)
                .bold()
                .font(.title3)
            
        })
        .padding(8)
        .frame(width: 240, alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.black.opacity(0.01)]), startPoint: .bottom, endPoint: .top))
    }
    
}

struct RowRocket_Previews: PreviewProvider {
    static var previews: some View {
        RowRocket(rocket: exampleRocket)
    }
}
