//
//  CodingTestLocalDataSource.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol CodingTestLocalDataSourceProtocol: AnyObject {
    func getHeros() -> [HeroModel]
    func changeRating(rating: Int, id: Int) -> Bool
}

class CodingTestLocalDataSource: CodingTestLocalDataSourceProtocol {
    func getHeros() -> [HeroModel] {
        if let data = UserDefaults.standard.data(forKey: "Heros"),
           let heroes = try? JSONDecoder().decode([HeroModel].self, from: data) {
            return heroes
        } else {
            saveHeroesData(data: dummyData)
            return dummyData
        }
    }
    
    func saveHeroesData(data: [HeroModel]) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "Heros")
        }
    }
    
    func changeRating(rating: Int, id: Int) -> Bool {
        var heroesData = getHeros()
        if let index = heroesData.firstIndex(where: { $0.id == id }) {
            heroesData[index].rating = rating
            saveHeroesData(data: heroesData)
            
            return true
        }
        return false
        
}}


let dummyData: [HeroModel] = [
    HeroModel(id: 1, name: "Hulk", image: "hulk", rating: 1),
    HeroModel(id: 2, name: "IronMan", image: "ironman", rating: 1),
    HeroModel(id: 3, name: "Superman", image: "superman", rating: 1),
]
