//
//  AsyncClass.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/01/31.
//

import Foundation

class AsyncClass {

    // 3秒後にコールバック
    func echo(message: String, _ handler: @escaping (String) -> Void) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3)

            DispatchQueue.main.async {
                handler("\(message)!")
            }
        }
    }
}
