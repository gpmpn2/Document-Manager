//
//  ViewController.swift
//  Document Manager
//
//  Created by Grant Maloney on 4/19/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var jsonData = Data()
        let fileURL = Bundle.main.url(forResource: "document1", withExtension: "json")
        
        do {
            jsonData = try Data(contentsOf: fileURL!)
            
        } catch {
            print(error)
        }
        
        do {
            let document = try JSONDecoder().decode(Document.self, from: jsonData)
            print("Contents from documents1.json\nUUID: \(document.uuid)\nDate created:\(document.dates.created)\nDate updated: \(document.dates.updated)\nTitle: \(document.title)\nSummary: \(document.summary)\nMetadata Topic: \(document.metadata.topic)\nMetadata field: \(document.metadata.field)")
            for author in document.authors {
                print("Author: \(author.name)\n\tContribution: \(author.contribution)\n\tContacts:")
                for contact in author.contacts {
                    print("\t\tMethod: \(contact.method)\n\t\tLabel: \(contact.label)\n\t\tAddress: \(contact.address ?? "")\n")
                }
            }
            print("Copyright Owner: \(document.copyright.owner)\n\tStart Year: \(document.copyright.startYear)\n\tEnd Year: \(document.copyright.endYear)\n\tLicense: \(document.copyright.license)\nEntities:")
            for entity in document.entities {
                print("\tType: \(entity.type)\n\tLabel: \(entity.label ?? "")\n\tProperty Size: \(entity.properties?.size ?? 0)\n\tContent Type: \(entity.content?.contentType ?? "")\n\tContent Encoding: \(entity.content?.contentEncoding ?? "")\n\tContent Data: \(entity.content?.data ?? "")\n")
            }
        } catch {
            print(error)
        }
    }


}

