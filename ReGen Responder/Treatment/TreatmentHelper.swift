//
//  TreatmentHelper.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 6/8/2023.
//

import Foundation
import Combine

struct TreatmentStep: Codable, Identifiable, Equatable {
    let id: String
    let direction: String
    let description: String
    let materialLocation: String?
    let injuryApplication: String
    let image: String
}


final class ModelData: ObservableObject {
    @Published var treatmentSteps: [TreatmentStep] = load("medicalTreatments.json")
}

var treatmentSteps: [TreatmentStep] = load("medicalTreatments.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle :\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
