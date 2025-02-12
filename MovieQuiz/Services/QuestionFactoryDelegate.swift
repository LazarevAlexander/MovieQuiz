//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Alexander Lazarev on 05.02.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)    
}
