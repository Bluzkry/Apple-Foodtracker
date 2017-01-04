//
//  Meal.swift
//  Apple FoodTracker
//
//  Created by Alexander Zou on 1/3/17.
//  Copyright © 2017 Alexander Zou. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    
    
    // MARK: PROPERTIES
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    
    // MARK: ARCHIVING PATHS
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    
    // MARK: TYPES
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    
    
    // MARK: INITIALIZATION

    init?(name: String, photo: UIImage?, rating: Int) {
        
        // the name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // the rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        // initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {

        // the name is required; if we cannot decode a name string, the initializer should fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
            return nil
        }
        
        // because photo is an optional property of meal, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
        
    }



}
