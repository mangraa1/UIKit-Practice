//
//  Source.swift
//  StudyingUIKit
//
//  Created by mac on 11.05.2023.
//

import Foundation

struct Source {
    enum SourceType{
        case word
        case action
    }
    
    private static let trueSource = [
    "Расскажи 5 фактов о себе",
    "Как выглядело твое первое свидание?",
    "Что ты будешь делать, если узнаешь, что умрешь через сутки?",
    "Какой была самая дорогая покупка в твоей жизни?",
    "У тебя есть тайный талант?",
    "У тебя были проблемы с законом?",
    "О чем ты больше всего сожалеешь?",
    "О чем ты мечтаешь?"]
    
    private static let actionSource = [
    "Сделайте массаж кому-нибудь из присутствующих",
    "Прыгайте до вашего следующего хода",
    "Позвольте человеку справа пощекотать вас",
    "Ведите себя как болельщик и изо всех сил подбадривайте следующего игрока",
    "Танцуйте как балерина в течение 2 минут",
    "Изобразите любого певца или певицу",
    "Снимите с себя одну вещь",
    "Проявляйте заботу по отношению к игроку напротив в течение 3 раундов"]
    
    static func getInfo(type: SourceType) -> String {
        switch type {
        case .word:
            return trueSource[Int.random(in: 0..<trueSource.count)]
        case .action:
            return actionSource[Int.random(in: 0..<actionSource.count)]
        }
    }
}
