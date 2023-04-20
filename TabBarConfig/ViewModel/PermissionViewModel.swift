//
//  PermissionViewModel.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 04/04/23.
//

import Foundation
class PermissionViewModel : ObservableObject{
    init() {
        getpermission()
    }
    
    @Published var per : [String] = []
    
    func getpermission(){
           if let path = Bundle.main.path(forResource: "premission", ofType: "json") {
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                   let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                   if let jsonResult = jsonResult as? Dictionary<String, [String]>, let permission = (jsonResult["permission"]) {
                       self.per = permission
                   }
               } catch {
                   // handle error
               }
           }
       }
}
