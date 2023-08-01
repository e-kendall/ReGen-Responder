//
//  ContentView.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 1/8/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State private var robotOnline: Bool = true
    @State private var robotLoader = RobotManager()
    @State private var callManager = CallManager()
    let locationManager = LocationManager(robotID: "uwsnjP59LTybQz1zNttf")
    
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            if locationManager.robotID == "" {
                VStack {
                    Text("Assign Robot ID")
                    
                    List {
                        ForEach(robotLoader.robots) { robot in
                            Button(action: {
                                locationManager.robotID = robot.robotID
                            }, label: {
                                HStack {
                                    Text("\(robot.robotName) - \(robot.robotID)")
                                }
                            })
                        }
                    }
                    
                    Button("Manual Load") {
                        robotLoader.fetchData()
                    }
                }
                .onAppear {
                    robotLoader.fetchData()
                }
                
            } else if callManager.isIdle == true {
                VStack {
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(.teal)
                            .rotationEffect(Angle(degrees: 55), anchor: .trailing)
                            .position(x: 50, y: 900)
                            .frame(width: 834, height: 1700)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hey! I'm a ReGen Robot.")
                                    .font(.title3)
                                    .bold()
                                Text("I'm a new piece of technology that's helping people everyday. I'm a Medical Assistance Robot, when people get injured I'm called to help them.")
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Text("To find out more, visit our website by scanning the QR code on the right.")
                                Spacer()
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 300, height: 63)
                                        .foregroundColor(.red)
                                    Text("HELP")
                                        .foregroundColor(.white)
                                }
                                .onTapGesture {
                                    callManager.isResponding = true
                                }
                            }
                            .frame(width: 296, height: 263)
                            .padding()
                            
                            Spacer()
                            
                            VStack{
                                
                            }
                        }
                        .frame(width: 700)
                    }
                }
                .onAppear {
                    callManager.startUpdating()
                    locationManager.startUpdatingLocation()
                    
                }
                
                .onDisappear {
                    callManager.stopUpdating()
                }
                
            } else if callManager.isResponding == true {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 1200, height: 478)
                            .position(x: 600, y: 175)
                            .foregroundColor(.red)
                        VStack {
                            Text("I'm Responding to a call for HELP.")
                                .font(.largeTitle)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                                .foregroundColor(.white)
                            Text("Please make room for me to get past.")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 140, leading: 0, bottom: 0, trailing: 0))
                       
                    }
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Call ID: \(callManager.addedDocumentID ?? "N/A")")
                                .foregroundColor(.gray)
                            Text("Robot ID: \(locationManager.robotID)")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
    
    
    struct Robot: Identifiable {
        var id = UUID()
        var robotID: String
        var robotName: String
        var robotModel: String
        var deployedBuilding: String
        var latitude: Double
        var longitude: Double
    }
    
    class RobotManager: ObservableObject {
        @Published var loading: Bool = false
        private var db = Firestore.firestore()
        @Published var robots: [Robot] = []
        
        func fetchData() {
            loading = true
            db.collection("robots").getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        if let latitude = document.data()["latitude"] as? Double,
                           let longitude = document.data()["longitude"] as? Double,
                           let deployedBuilding = document.data()["deployedBuilding"] as? String,
                           let robotName = document.data()["robotName"]as? String,
                           let robotModel = document.data()["robotModel"] as? String
                        {
                            let robot = Robot(robotID: documentID, robotName: robotName, robotModel: robotModel, deployedBuilding: deployedBuilding, latitude: latitude, longitude: longitude)
                            DispatchQueue.main.async {
                                self.robots.append(robot)
                            }
                        }
                    }
                }
            }
            loading = false
        }
    }
}
