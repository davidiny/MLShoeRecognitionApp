/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Prediction: Identifiable {
  var id: Int = 0
  var name: String = ""
  var image: Image?
//    var coordinates: Coordinate
//
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }


}


struct Coordinate {
    var latitude: Double
    var longitude: Double
}



