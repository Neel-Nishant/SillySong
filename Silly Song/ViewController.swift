//
//  ViewController.swift
//  Silly Song
//
//  Created by Neel Nishant on 16/12/17.
//  Copyright © 2017 Neel Nishant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!).capitalized
                    }
    }
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameForName(name: String) -> String {
    let lowerCaseName = name.lowercased()
    var shortName = lowerCaseName
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let range = lowerCaseName.rangeOfCharacter(from: vowelSet){
        
        shortName = lowerCaseName.substring(from: range.lowerBound)
    }
    
    return shortName
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var str = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameForName(name: fullName))
    
    return str
}
