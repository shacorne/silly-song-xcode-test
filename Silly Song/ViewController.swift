//
//  ViewController.swift
//  Silly Song
//
//  Created by Shadin Cornelio on 5/7/17.
//  Copyright © 2017 Shadin Cornelio. All rights reserved.
//

import UIKit


func shortNameFromName(name:String) -> String {
    var shortName = name
    shortName.remove(at: shortName.startIndex)
    return shortName.lowercased()
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func reset(_ sender: Any) {
        nameField.text=""
        lyricsView.text=""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text=lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }

}





