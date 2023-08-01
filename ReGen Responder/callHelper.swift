//
//  callHelper.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 3/8/2023.
//

import Foundation
import FirebaseFirestore
import Firebase
import CoreLocation

struct Call: Identifiable {
    var id: String
    var callerName: String
    var callLocationLatitude: Double
    var callLocationLongitude: Double
    var injuryType: String
    var injuryArea: String
    var callTime: Date
}

class CallManager: NSObject, ObservableObject {
    private var db = Firestore.firestore()
    private var locationManager = CLLocationManager()
    var userLocation: CLLocation?

    @Published var calls: [Call] = []
    @Published var isNewDocumentAdded: Bool = false
    @Published var addedDocumentID: String?

    @Published var isResponding: Bool = false
    @Published var isIdle: Bool = true

    override init() {
        super.init()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }

        // Start fetching data when the CallManager is initialized
        startUpdating()
    }

    private var timer: Timer?

    func startUpdating() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.fetchCallData()
        }
    }

    func stopUpdating() {
        timer?.invalidate()
        timer = nil
    }

    func fetchCallData() {
        db.collection("calls").getDocuments { [weak self] snapshot, error in
            guard let self = self else { return }

            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            // Process snapshot to find if a new document has been added within the last 10 minutes
            // Mark as responding if a new document was added
            let currentDate = Date()
            let tenMinutesAgo = Calendar.current.date(byAdding: .minute, value: -10, to: currentDate)!

            for document in snapshot!.documents {
                if let callTimeTimestamp = document.data()["callTime"] as? Timestamp {
                    let callTime = callTimeTimestamp.dateValue()
                    
                    if callTime >= tenMinutesAgo && !self.isResponding {
                        self.markAsResponding(documentID: document.documentID)
                        return
                    }
                }
            }
        }
    }

    func markAsResponding(documentID: String) {
        let documentRef = db.collection("calls").document(documentID)
        // Write the location data to Firestore
        documentRef.updateData(["isResponding": true]) { error in
            if let error = error {
                print("Error writing location to Firestore: \(error.localizedDescription)")
            } else {
                print("Location written to Firestore successfully")
            }
        }
        isResponding = true
        isIdle = false
    }
}

extension CallManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.userLocation = location
            manager.stopUpdatingLocation()
            fetchCallData() // Fetch call data after user's location is obtained
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed with error: \(error.localizedDescription)")
    }
}
