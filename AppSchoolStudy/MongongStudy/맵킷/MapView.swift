//
//  MapView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/14.
//

import SwiftUI
import MapKit

struct MapView: View {
    // 좌표 추적이 가능한 State 만들기
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
