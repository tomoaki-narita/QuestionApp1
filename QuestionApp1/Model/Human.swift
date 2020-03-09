//
//  Human.swift
//  QuestionApp1
//
//  Created by output. on 2020/03/09.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import Foundation

class Human: Animal{
    
    override func breath() {
        
        super.breath()
        
        profile()
        
    }
    
    func profile(){
        
        print("tomoaki narita")
    }
}
