//
//  CompanyInfoView.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import SwiftUI
import SpaceXApi

struct CompanyInfoView: View {

    @StateObject var companyInfoService: CompanyInfoService

    var body: some View {
        Form {
            if let info = companyInfoService.company {
                basicInfo(info: info)
                people(info: info)
                headquarters(headquarters: info.headquarters)
            } else {
                Text("Loading...") .onAppear(perform: {
                    companyInfoService.getCompanyInfo()
                })
            }
        }.navigationTitle("Company info")
    }

    private func basicInfo(info: CompanyInfoDTO) -> some View {
        Section(header: Text("Info")) {
            Text(info.name).font(.largeTitle)
            Text(info.summary).fixedSize(horizontal: false, vertical: true)
        }
    }

    private func people(info: CompanyInfoDTO) -> some View {
        Section(header: Text("People")) {
            CustomSection(title: "Founder") {
                Text(info.founder)
            }
            CustomSection(title: "CEO") {
                Text(info.ceo)
            }
            CustomSection(title: "CTO") {
                Text(info.cto)
            }
            CustomSection(title: "COO") {
                Text(info.coo)
            }
            CustomSection(title: "CTO PROPULSION") {
                Text(info.cto_propulsion)
            }
        }
    }

    private func headquarters(headquarters: HeadquartersDTO) -> some View {
        Section(header: Text("Headquarters")) {
            CustomSection(title: "State") {
                Text(headquarters.state)
            }
            CustomSection(title: "City") {
                Text(headquarters.city)
            }
            CustomSection(title: "Adress") {
                Text(headquarters.address)
            }
        }
    }

}

// struct CompanyInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompanyInfoView()
//    }
// }
