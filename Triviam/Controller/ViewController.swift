//
//  ViewController.swift
//  Triviam
//
//  Created by Murat Baturay on 2018-06-04.
//  Copyright © 2018 Murat Baturay. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    let URL     = "https://opentdb.com/api.php?amount=10&category=11&difficulty=easy&type=boolean"
    var items   : [DataModel] = []
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getQuestions(url: String) {
        
        Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                let json : JSON = JSON(response.result.value!)
                self.populateMyQuestionsArray(json: json)
            }
            else {
                print("Fail!")
            }
        }
    }
    
    func populateMyQuestionsArray (json : JSON) {
        
        for index in 0...9 {
            items.append(DataModel(
                question:       json["results"][index]["question"].stringValue,
                correct_answer: json["results"][index]["correct_answer"].stringValue))
        }
        
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        let question : String   = items[counter].question
        let _   : String   = items[counter].correct_answer
        
        questionLabel.text = question.htmlToString
        
        
        if counter < 9 {
            counter = counter + 1
        }
        else {
            counter = 0
        }    }
    
    
}
/* End of Main
   *************************/




/* E X T E N S I O N */

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
