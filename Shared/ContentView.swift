//
//  ContentView.swift
//  Shared
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var appContainer: AppContainer
    @State private var selection: Int = 1

    let mainItem = Label { Text("Home") } icon: { Image(systemName: "house") }
    let infoItem = Label { Text("Info") } icon: { Image(systemName: "doc.text") }

    var body: some View {
        TabView(selection: $selection) {
            mainView()
            infoView()
        }.accentColor(.black)
    }

    func mainView() -> some View {
        NavigationView {
            ScrollView {
                CustomSection(title: "Rockets", offset: 24) {
                    CarouselRockets(rocketService: appContainer.resolve())
                }
            }
            .navigationTitle("SpaceX Rockets")
        }.tabItem { mainItem }
    }

    func infoView() -> some View {
        NavigationView {
            CompanyInfoView(companyInfoService: appContainer.resolve())
        }.tabItem { infoItem }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(appContainerPreview)
    }
}
