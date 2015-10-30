//
//  ViewController.swift
//  Homework1
//
//  Created by SHLEE on 10/3/15.
//  Copyright © 2015 SHLEE. All rights reserved.
//

import UIKit
import AVFoundation

let mySpeechSyth = AVSpeechSynthesizer()

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    
    let mySpeechSynth = AVSpeechSynthesizer()
    
    var myRate: Float = 0.50
    var myPitch: Float = 0.99
    var myVolume: Float = 0.50
    
    var currentLang = ("en-US", "English","United States","American English ","🇺🇸")
    
    // from :http://www.geonames.de/languages.html , http://www.omniglot.com/language/names.htm , http://wpcentral.io/internationalization/
    // current lang array has known typos, to fix in future.
    var langCodeAll38 = [
        ("en-US",  "English", "United States", "American English","🇺🇸"),
        ("ar-SA","Arabic","Saudi Arabia","العربية","🇸🇦"),
        ("cs-CZ", "Czech", "Czech Republic","český","🇨🇿"),
        ("da-DK", "Danish","Denmark","Dansk","🇩🇰"),
        ("de-DE",       "German", "Germany", "Deutsche","🇩🇪"),
        ("el-GR",      "Modern Greek",        "Greece","ελληνική","🇬🇷"),
        ("en-AU",     "English",     "Australia","Aussie","🇦🇺"),
        ("en-GB",     "English",     "United Kingdom", "Queen's English","🇬🇧"),
        ("en-IE",      "English",     "Ireland", "Gaeilge","🇮🇪"),
        ("en-ZA",       "English",     "South Africa", "South African English","🇿🇦"),
        ("es-ES",       "Spanish",     "Spain", "Español","🇪🇸"),
        ("es-MX",       "Spanish",     "Mexico", "Español de México","🇲🇽"),
        ("fi-FI",       "Finnish",     "Finland","Suomi","🇫🇮"),
        ("fr-CA",       "French",      "Canada","Français du Canada","🇨🇦" ),
        ("fr-FR",       "French",      "France", "Français","🇫🇷"),
        ("he-IL",       "Hebrew",      "Israel","עברית","🇮🇱"),
        ("hi-IN",       "Hindi",       "India", "हिन्दी","🇮🇳"),
        ("hu-HU",       "Hungarian",    "Hungary", "Magyar","🇭🇺"),
        ("id-ID",       "Indonesian",    "Indonesia","Bahasa Indonesia","🇮🇩"),
        ("it-IT",       "Italian",     "Italy", "Italiano","🇮🇹"),
        ("ja-JP",       "Japanese",     "Japan", "日本語","🇯🇵"),
        ("ko-KR",       "Korean",      "Republic of Korea", "한국어","🇰🇷"),
        ("nl-BE",       "Dutch",       "Belgium","Nederlandse","🇧🇪"),
        ("nl-NL",       "Dutch",       "Netherlands", "Nederlands","🇳🇱"),
        ("no-NO",       "Norwegian",    "Norway", "Norsk","🇳🇴"),
        ("pl-PL",       "Polish",      "Poland", "Polski","🇵🇱"),
        ("pt-BR",       "Portuguese",      "Brazil","Portuguese","🇧🇷"),
        ("pt-PT",       "Portuguese",      "Portugal","Portuguese","🇵🇹"),
        ("ro-RO",       "Romanian",        "Romania","Română","🇷🇴"),
        ("ru-RU",       "Russian",     "Russian Federation","русский","🇷🇺"),
        ("sk-SK",       "Slovak",      "Slovakia", "Slovenčina","🇸🇰"),
        ("sv-SE",       "Swedish",     "Sweden","Svenska","🇸🇪"),
        ("th-TH",       "Thai",        "Thailand","ภาษาไทย","🇹🇭"),
        ("tr-TR",       "Turkish",     "Turkey","Türkçe","🇹🇷"),
        ("zh-CN",       "Chinese",     "China","漢語/汉语","🇨🇳"),
        ("zh-HK",       "Chinese",   "Hong Kong","漢語/汉语","🇭🇰"),
        ("zh-TW",       "Chinese",     "Taiwan","漢語/汉语","🇹🇼")
    ]


    var currentString = ""


    var total:Int = 0
    var mode:Int = 0
    var valueString:String! = ""
    var lastButtonWasMode:Bool = false
    var totalDisplayed:Bool = false
    var currnetLang = ("th-TH", "English","United States","American English ","🇺🇸")

    @IBOutlet var myLangPicker: UIPickerView!
    //MARK: -total label
    @IBOutlet var lable: UILabel!
    

    //MARK: - multiply
    
    @IBAction func tappedMultiply(sender: AnyObject) {
        
        self.SetMode(2)
        speakThisString("multiply")
        
    }
    
    
//    func speakThisString(){
//        
//        mySpeechSynth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
//        
//        let myUtterance = AVSpeechUtterance(string: currentLang.3)
//        myUtterance.rate = myRate
//        myUtterance.pitchMultiplier = myPitch
//        myUtterance.volume = myVolume
//        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.0)
//        mySpeechSynth.speakUtterance(myUtterance)
//        
//        
//        
//    }
    func speakThisString(myString: String){
        
        mySpeechSynth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        let myUtterance = AVSpeechUtterance(string:myString)
        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.0)
        mySpeechSynth.speakUtterance(myUtterance)
        
    }
    
    
    
    //MARK - UIPickerView Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langCodeAll38.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let myString = "\(langCodeAll38[row].4) \(langCodeAll38[row].3)"
        
        return myString
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentLang = langCodeAll38[row]
        speakThisString(currentLang.3)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.view.backgroundColor = UIColor.redColor()
        
        
        
        //MARK: - Initialize
        let items = ["Day", "Night", "Wildcard"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        //MARK: - Set up Frame and SegmentedControl
        let frame = UIScreen.mainScreen().bounds
        customSC.frame = CGRectMake(frame.minX + 10, frame.minY + 50,
            frame.width - 20, frame.height*0.1)
        
        //MARK: - Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.blackColor()
        customSC.tintColor = UIColor.whiteColor()
        
        //MARK: - Add target action method
        customSC.addTarget(self, action: "changeColor:", forControlEvents: .ValueChanged)
        
        //MARK: - Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
        
        

        
        
        let myUtterance = AVSpeechUtterance(string:"welcome")

        mySpeechSynth.speakUtterance(myUtterance)
        
        
        
        
        

        
    }

        //MARK: -cgange color / language
    
    func changeColor(sender: UISegmentedControl) {
      
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.grayColor()
            
//            currentLanguage = language1


         
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
//            currentLanguage =   language2


        default:
            self.view.backgroundColor = UIColor.redColor()
//            currentLanguage = language3



    }
 
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: -tap number

    @IBAction func tappedNumber(sender: UIButton) {
        
        let str:String! = sender.titleLabel!.text
        let num:Int! = Int(str)
      
        speakThisString(str)

//        if let _ = sender.titleLabel?.text {
//            speakThisString(str)
//        }

        
        
        if (num == 0 && total == 0){
            
            return
        
        }
        if (lastButtonWasMode){
            lastButtonWasMode  = false
            valueString = ""
        
        }
        
         //MARK: -edge
        
        if (totalDisplayed){
        
            totalDisplayed = false
            valueString = ""
        }
        
        valueString =  valueString.stringByAppendingString(str)
        
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let n:NSNumber = formatter.numberFromString(valueString)!
        
        lable.text = formatter.stringFromNumber(n)
        
        if (total == 0)
        {
            total = Int(valueString)!
        }
        
        
        
        
        
        
    }
    //MARK: -Plus
    @IBAction func tappedPlus(sender: AnyObject) {
        
        self.SetMode(1)
    
        speakThisString("plus")
    }
    //MARK: -Minus
    
    @IBAction func tappedMinus(sender: AnyObject) {
        
        self.SetMode(-1)
        
            speakThisString("minus")
        
    }
    //MARK: - Equals
    @IBAction func tappedEquals(sender: AnyObject) {
        if (mode == 0 ){
            return
        
        }
        let iNum:Int = Int(valueString)!
        if (mode == 1){
            total += iNum
        
        }
        if (mode == -1){
            total -= iNum
        
        }
        if (mode == 2){
        
            total *= iNum
        
        }
        
        
        valueString = "\(total)"
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let n:NSNumber = formatter.numberFromString(valueString)!
        
        lable.text = formatter.stringFromNumber(n)
        mode = 0
        
        if let _ = sender.titleLabel?!.text {
            speakThisString("equal")
        }
        totalDisplayed = true

    }
    //MARK: -Clear
    
    @IBAction func tappedClear(sender: AnyObject) {
        
        total = 0
        mode = 0
        valueString = ""
        lable.text =  "0"
        lastButtonWasMode = false
        speakThisString("clear")
        
    }
    


    
    //MARK: -speaking function
    
//    func speakThisPhrase(passedString: String){
//        
//        let myUtterance = AVSpeechUtterance(string: passedString)
//        myUtterance.rate = 0.35
//        myUtterance.voice = AVSpeechSynthesisVoice(language:currentLang.1)
//        mySpeechSyth.speakUtterance(myUtterance)
//        
//        
//    }
    
 

    
    
    func SetMode(m:Int){
    
        if (total == 0){
        
        return
        
        }
        mode = m
        lastButtonWasMode = true
        total = Int(valueString)!
    
    }
}

