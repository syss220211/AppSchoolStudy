//
//  SpecialProvinceView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//


import SwiftUI

struct SpecialProvinceView: View {
    var metro: SpecialProvince
    
    var body: some View {
        List {
            if metro.cities.count > 0 {
                Section("시") {
                    ForEach(metro.cities) { basic in
                        Text("\(basic.displayName)")
                    }
                }
            }
            
            if metro.countries.count > 0 {
                Section("군") {
                    ForEach(metro.countries) { basic in
                        Text("\(basic.displayName)")
                    }
                }
            }
        }
        .navigationTitle("\(metro.displayName)")
    }
}

struct SpecialProvincesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SpecialProvinceView(metro: specialProvinces[0])
        }
    }
}

