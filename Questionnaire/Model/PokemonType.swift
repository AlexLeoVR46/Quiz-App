//
//  PokemonType.swift
//  Questionnaire
//
//  Created by home on 5/4/19.
//  Copyright © 2019 home. All rights reserved.
//
import UIKit
enum PokemonType {
    case Pikachy
    case Sloupok
    case Vaperon
    case Lucario
    case Slugma
    
    
    var image: UIImage {
        switch self {
        case .Pikachy:
            return UIImage(named: "pikachy")!
        case .Sloupok:
            return UIImage(named: "sloupok")!
        case .Vaperon:
            return UIImage(named: "vaperon")!
        case .Lucario:
            return UIImage(named: "lucario")!
        case .Slugma:
            return UIImage(named: "slugma")!
            
        }
    }

    
    var definition: String {
        switch self {
        case .Pikachy:
            return "Самый знаменитый из покемонов. Его прославил анимэ-сериал, так что Пикачу — один из символов 90-х годов."
        case .Sloupok:
             return "Слоупок — просто покемон. Сейчас так называют медленных и слегка заторможенных людей. Это не мешает Слоупоку оставаться едва ли не самым известным из всех многочисленных покемонов."
        case .Vaperon:
            return "Вапореон то ли рыба, то ли дельфин, то ли кот. Зато, его можно очень круто прокачать. Почти до уровня морского чудища. Лол, конечно нет."
        case .Lucario:
            return "Лукарио - очень спокойный и уверенный в себе покемон. Это очень гордое создание с сильным чувством справедливости. Он до конца верен тренеру и всегда готов помочь окружающим."
        case .Slugma:
            return "Тело Слагмы состоит из магмы. Если он перестаёт двигаться, его тело остывает и затвердевает."

        }
    }
}
