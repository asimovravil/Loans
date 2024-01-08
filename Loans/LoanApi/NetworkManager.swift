//
//  NetworkManager.swift
//  Loans
//
//  Created by Ravil on 08.01.2024.
//

import Foundation

class NetworkManager {

    func fetchLoans(completion: @escaping ([Loan]?, Error?) -> Void) {
        let urlString = "https://dev-34tl410cl6dv17a.api.raw-labs.com/loans"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, NSError(domain: "InvalidResponse", code: 0, userInfo: nil))
                    return
                }

                guard let mimeType = httpResponse.mimeType, mimeType == "application/json" else {
                    completion(nil, NSError(domain: "InvalidMimeType", code: 0, userInfo: nil))
                    return
                }

                guard let data = data else {
                    completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                    return
                }

                do {
                    let loans = try JSONDecoder().decode([Loan].self, from: data)
                    completion(loans, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
