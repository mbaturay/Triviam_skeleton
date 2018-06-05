//
//  DataModel.swift
//  Triviam
//
//  Created by Murat Baturay on 2018-06-05.
//  Copyright © 2018 Murat Baturay. All rights reserved.
//

import Foundation

class DataModel {
    
    var question: String
    var correct_answer: String
    
    init(question: String, correct_answer: String) {
        
        self.question = question
        self.correct_answer = correct_answer
    }
}
