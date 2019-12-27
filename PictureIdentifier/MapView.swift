//
//  MapView.swift
//  PictureIdentifier
//
//  Created by David Inyangson on 12/27/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
      
//        let locationManager = CLLocationManager()
//        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//           locationManager.startUpdatingLocation()
//        } else {
//           locationManager.requestWhenInUseAuthorization()
//        }
//        let myLatitude = locationManager.location?.coordinate.latitude
//        let myLongitude = locationManager.location?.coordinate.longitude
//        let coordinate = CLLocationCoordinate2D(
//            latitude: myLatitude!, longitude: myLongitude!)
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//      let region = MKCoordinateRegion(center: coordinate, span: span)
//        view.setRegion(region, animated: true)
      
      let coordinate = CLLocationCoordinate2D(
          latitude: 34.011286, longitude: -116.166868)
      let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
