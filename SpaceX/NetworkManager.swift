//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Дмитрий Геращенко on 24.08.2022.
//

import Foundation

final class NetworkManager {
    static func fetchRockets(url: String, completion: @escaping (_ rockets: [Rocket]) -> ()) {
        
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let rockets = try decoder.decode([Rocket].self, from: data)
                completion(rockets)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
