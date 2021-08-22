//
//  DiskCareTaker.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public final class DiskCareTaker {
    public static let encoder = JSONEncoder()
    public static let decoder = JSONDecoder()

    public static func createDocumentURL(withFileName fileName: String) -> URL {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName).appendingPathExtension("json")
    }

    public static func save<T: Codable>(_ object: T, to fileName: String) throws {
        do {
            let url = createDocumentURL(withFileName: fileName)
            let data = try encoder.encode(object)
            try data.write(to: url, options: .atomic)
        } catch (let error) {
            print("Save Failed: object: \(object), error: \(error)")
            throw error
        }
    }

    public static func retrive<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        let url = createDocumentURL(withFileName: fileName)
        return try retrive(T.self, from: url)

    }

    public static func retrive<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch (let error) {
            print("Retrieve Failed: url \(url), error: \(error) ")
            throw error
        }
    }
}
