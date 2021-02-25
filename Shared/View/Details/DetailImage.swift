//
//  DetailImage.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import SwiftUI

struct DetailImage: View {
    
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

struct DetailImage_Previews: PreviewProvider {
    static var previews: some View {
        DetailImage(url: exampleRocket.flickr_images.first!)
    }
}
