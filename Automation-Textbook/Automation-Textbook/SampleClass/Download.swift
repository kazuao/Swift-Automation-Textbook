//
//  Download.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/01/31.
//

import Foundation

enum DownloadError: Error, Equatable {
    case connectionError
    case unknownError(code: Int)
}

struct SystemError: Error {
    let message: String
}

final class Download {
    func downloadContent() throws {
        let connectionFailed = false
        let unknownError = false

        if connectionFailed {
            throw DownloadError.connectionError
        }

        if unknownError {
            throw DownloadError.unknownError(code: 9)
        }
    }

    func throwsSystemError() throws {
        throw SystemError(message: "memory access error")
    }
}
