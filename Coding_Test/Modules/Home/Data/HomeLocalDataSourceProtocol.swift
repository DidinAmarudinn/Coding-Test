//
//  HomeDataSourceProtocol.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol HomeLocalDataSourceProtocol {
    func getData()-> [HeroEntity]
}

final class LocaleDataSource: NSObject {

  private let realm: Realm?

  private init(realm: Realm?) {
    self.realm = realm
  }

  static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
    return LocaleDataSource(realm: realmDatabase)
  }

}
