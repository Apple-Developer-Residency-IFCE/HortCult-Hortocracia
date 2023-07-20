//
//  PlantModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 17/07/23.
//

import Foundation
import UIKit


struct PlantModel : Identifiable, Hashable {
    var id: UUID
    var name: String
    var category: String
    var information: String
    var frequency: String
    var image: [Data]
    var nextDate: Date
}
