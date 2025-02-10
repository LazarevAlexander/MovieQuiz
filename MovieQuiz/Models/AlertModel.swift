//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Alexander Lazarev on 08.02.2025.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: ((UIAlertAction)-> Void)?
}
