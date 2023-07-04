//
//  SpecialCityView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import SwiftUI

struct SpecialCityView: View {
    var metro: SpeicalCity
    
    var body: some View {
        List {
            Section("구") {
                ForEach(metro.disricts) { basic in
                    Text("\(basic.displayName)")
                }
            }
        }
        .navigationTitle("\(metro.displayName)")
    }
}

struct SpeicalCityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SpecialCityView(metro: specialCities[0])
        }
    }
}
