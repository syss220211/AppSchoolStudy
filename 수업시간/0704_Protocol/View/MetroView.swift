//
//  MetroView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import SwiftUI

struct MetroView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("특별시") {
                    ForEach(specialCities) { metro in
                        NavigationLink {
                            SpecialCityView(metro: metro)
                        } label: {
                            Text("\(metro.displayName)")
                        }
                    }
                }
                
                Section("광역시") {
                    ForEach(metroCities) { metro in
                        Text("\(metro.displayName)")
                    }
                }
                
                Section("특별자치시") {
                    ForEach(specialGovCities) { metro in
                        Text("\(metro.displayName)")
                    }
                }
                
                Section("도") {
                    ForEach(provinces) { metro in
                        Text("\(metro.displayName)")
                    }
                }
                
                Section("특별자치도") {
                    ForEach(specialProvinces) { metro in
                        NavigationLink {
                            SpecialProvinceView(metro: metro)
                        } label: {
                            Text("\(metro.displayName)")
                        }
                    }
                }
            }
            .navigationTitle("광역지방자치단체")
        }
    }
}

struct MetroView_Previews: PreviewProvider {
    static var previews: some View {
        MetroView()
    }
}
