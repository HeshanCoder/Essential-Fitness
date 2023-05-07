//
//  Extention.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import Foundation

extension String{
     func capitalizeFirstLetter() -> String {
         // select the first letter and set it as Uppercase + then select again the letters as lowercase and drop the first letter
           return self.prefix(1).uppercased() + self.lowercased().dropFirst()
       }
 }
