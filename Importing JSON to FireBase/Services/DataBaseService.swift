//
//  DataBaseService.swift
//  Importing JSON to FireBase
//
//  Created by Yaseen Al Dallash on 4/12/18.
//  Copyright © 2018 Yaseen Al Dallash. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataBaseService {
    // MARK: - Properties
    
    static let manager = DataBaseService()
    var dataBaseRef: DatabaseReference
    var gotRef: DatabaseReference
    // MARK: - Inits
    
    private init(){
        // This will intialize the reference of the data base to the root of the FireBase dataBase
        self.dataBaseRef = Database.database().reference()
        self.gotRef = dataBaseRef.child("GameOfThronesHouses")
    }
    // MARK: - Public Functions
    public func getDataBaseRef()->DatabaseReference{return self.dataBaseRef}
    public func getGOTRef()->DatabaseReference{return self.gotRef}
    
    public func addGOTJSON(json: Any){
        self.getGOTRef().setValue(json)
    }
}
