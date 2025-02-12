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
            storage.integer(forKey: Keys.correctAnswers.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.correctAnswers.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        if (gamesCount == 0){
             0
        } else{
           (Double(correctAnswers) / ( 10 * Double(gamesCount))) * 100
        }
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
        
    var bestGame: GameResult {
        get {
            GameResult(correct: storage.integer(forKey: Keys.correct.rawValue),
                       total: storage.integer(forKey: Keys.total.rawValue),
                       date: storage.object(forKey: Keys.date.rawValue) as? Date ?? Date())
        }
        set {
            storage.set(newValue, forKey: Keys.correct.rawValue)
            storage.set(newValue, forKey: Keys.total.rawValue)
            storage.set(newValue, forKey: Keys.date.rawValue)
        }
        
    }

    func store(correct count: Int, total amount: Int) {
        correctAnswers += count
        gamesCount += 1
        let newGame = GameResult(correct: count, total: amount, date: Date())
        if (newGame.isBetterThan(bestGame)) {
            storage.set(newGame.correct, forKey: Keys.correct.rawValue)
            storage.set(newGame.total, forKey: Keys.total.rawValue)
            storage.set(newGame.date, forKey: Keys.date.rawValue)
        }
    }
    
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
        case total
        case date
        case correctAnswers
    }
}
