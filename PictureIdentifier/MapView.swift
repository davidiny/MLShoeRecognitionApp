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

    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           locationManager.startUpdatingLocation()
        } else {
           locationManager.requestWhenInUseAuthorization()
        }
        let myLatitude = locationManager.location?.coordinate.latitude
        let myLongitude = locationManager.location?.coordinate.longitude
      
      
      
      
      
      
      let coordinate = CLLocationCoordinate2D(
        latitude: myLatitude ?? 34.011286, longitude: myLongitude ?? -116.166868)
      let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      let pinPoint = MKPointAnnotation()
      pinPoint.coordinate = coordinate
      pinPoint.title = "Me"
      view.addAnnotation(pinPoint)
  
      view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
