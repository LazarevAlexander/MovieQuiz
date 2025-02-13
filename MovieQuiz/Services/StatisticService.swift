//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Alexander Lazarev on 10.02.2025.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    
    private let storage: UserDefaults = .standard
    
    private var correctAnswers: Int {
        get {
            storage.integer(forKey: Key.correctAnswers.rawValue)
        }
        set {
            storage.set(newValue, forKey: Key.correctAnswers.rawValue)
        }
    }
    
    var totalAccuracy: Double {
       gamesCount == 0 ? 0 : Double(correctAnswers) / (10 * Double(gamesCount)) * 100
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Key.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Key.gamesCount.rawValue)
        }
    }
        
    var bestGame: GameResult {
        get {
            GameResult(correct: storage.integer(forKey: Key.correct.rawValue),
                       total: storage.integer(forKey: Key.total.rawValue),
                       date: storage.object(forKey: Key.date.rawValue) as? Date ?? Date())
        }
        set {
            storage.set(newValue, forKey: Key.correct.rawValue)
            storage.set(newValue, forKey: Key.total.rawValue)
            storage.set(newValue, forKey: Key.date.rawValue)
        }
        
    }

    func store(correct count: Int, total amount: Int) {
        correctAnswers += count
        gamesCount += 1
        let newGame = GameResult(correct: count, total: amount, date: Date())
        if newGame.isBetterThan(bestGame) {
            storage.set(newGame.correct, forKey: Key.correct.rawValue)
            storage.set(newGame.total, forKey: Key.total.rawValue)
            storage.set(newGame.date, forKey: Key.date.rawValue)
        }
    }
    
    private enum Key: String {
        case correct
        case bestGame
        case gamesCount
        case total
        case date
        case correctAnswers
    }
}
