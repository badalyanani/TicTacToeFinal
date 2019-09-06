//
//  main.swift
//  TicTacToeFinal
//
//  Created by Ani on 9/6/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import Foundation

enum Marker: Character{
    case X = "X", O = "O"
    
}

struct TicTacToeSmall{
    
    var square:[Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var player = 1
    var winComb = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    
    mutating func readMatrixSize() -> Int{
        return square.count
    }
    
    mutating func step(_ value: Int){
        
        if(player == 1 && square[value] != Marker.X.rawValue &&  square[value] != Marker.O.rawValue  ){
            square[value] = Marker.X.rawValue
            player = 2
        }
        if(player == 2 && square[value] != Marker.X.rawValue &&  square[value] != Marker.O.rawValue  ){
            square[value] = Marker.O.rawValue
            player = 1
        }
        let number =  win()
        print("\(number)")
        
        
        board()
    }
    
    mutating func board(){
        print("\(square[1])" + " | " + "\(square[2])" + " | " + "\(square[3])")
        print("__|___|__")
        print("  |   |  ")
        print("\(square[4])" + " | " + "\(square[5])" + " | " + "\(square[6])")
        print("__|___|__")
        print("  |   |  ")
        print("\(square[7])" + " | " + "\(square[8])" + " | " + "\(square[9])")
        
    }
    
    func win()->String{
        
        for i in winComb{
            if(square[i[0]] != "0"  && square[i[0]] == square[i[1]] && square[i[1]] == square[i[2]]){
                if(square[i[01]] == "X"){
                    
                    return " GAME OVER 1 WON "
                    
                }else{
                    return " GAME OVER 2 WON "
                    
                }
            }
        }
        return "no one yet"
    }
}


var objectSmall = TicTacToeSmall()

var value = Int(objectSmall.readMatrixSize())

func readCoordinate() -> String? {
    var input: String?
    
    repeat {
        print("Input your place from 1 to 9: ", terminator: "")
        input = readLine(strippingNewline: true)
    } while input != nil && input!.isEmpty && (Int(input!) ?? 1 > 0) && (Int(input!) ?? 1 <= 9)
    
    return input
}

var play = true

for _ in 0..<value{
    
    var valueOfSquare = Int(readCoordinate()!)
    if( Int(valueOfSquare!) > 0 && Int(valueOfSquare!) <= 9){
        play = true
        objectSmall.step(Int(valueOfSquare!))
        
        
    }else{
        play = false
}

}
