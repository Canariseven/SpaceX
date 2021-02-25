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
                    HeaderDetailRocket(rocket: rocket).height(520, alignment: .top)
                    Rectangle().foregroundColor(.clear).applyCustomGradient(type: .white).rotationEffect(Angle.degrees(180)).height(64 + 32, alignment: .top)
                })
                content()
            }).padding(.bottom, 128)
        })
       .background(Color.black).edgesIgnoringSafeArea(.all)
    }

    private func content() -> some View {
        VStack(alignment: .leading, spacing: 16, content: {
            CustomDivider()
            wikipediaLink()
            CustomDivider()
            fieldsCharacteristics()
            CustomDivider()
            descriptionRocket()
        }).background(Color.black).foregroundColor(.white).padding()
    }
    
    private func wikipediaLink() -> some View {
        CustomSection(title: "Wikipedia") {
            Link(destination: rocket.wikipedia, label: {
                Image(systemName: "book.circle").resizable().frame(width: 32, height: 32, alignment: .topTrailing).foregroundColor(.white)
            })
        }
    }
    
    private func descriptionRocket() -> some View {
        CustomSection(title: "Description") {
            Text(rocket.description).fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private func fieldsCharacteristics() -> some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: 16) {
                CustomSection(title: "Height") {
                    Text(rocket.height.string()).applyTagStyle()
                }
                CustomDivider()
                CustomSection(title: "Diameter") {
                    Text(rocket.diameter.string()).applyTagStyle()
                }
                CustomDivider()
                CustomSection(title: "Mass") {
                    Text(rocket.mass.string()).applyTagStyle()
                }
            }
        })
    }
    
}

struct DetailRockt_Previews: PreviewProvider {
    static var previews: some View {
        DetailRocket(rocket: exampleRocket)
    }
}
