//
//  locationUpdater.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 6/8/2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let db = Firestore.firestore()
    @Published var robotID: String
    private var locationManager: CLLocationManager
    private var timer: Timer?
    
    init(robotID: String) {
            self.robotID = robotID
            self.locationManager = CLLocationManager()
            super.init()
            self.locationManager.delegate = self
        }
    
    func startUpdatingLocation() {
            locationManager.requestWhenInUseAuthorization()
            
            timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(updateLocation), userInfo: nil, repeats: true)
            
            locationManager.startUpdatingLocation()
        }
    
    @objc private func updateLocation() {
        if let location = locationManager.location {
            
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            let documentRef = db.collection("robots").document(robotID)
            
            // Write the location data to Firestore
            documentRef.updateData(["latitude": latitude, "longitude": longitude]) { error in
                if let error = error {
                    print("Error writing location to Firestore: \(error.localizedDescription)")
                } else {
                    print("Location written to Firestore successfully")
                }
            }
        }
    }
}

