/*
 * Welcome to the Swift Language Service. This is an implementation of the Language Service
 * Protocol. This is a protocol that aims to be a common interface for developer tools.
 *
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 */

var langsrv = LanguageServiceProtocol()

langsrv.register(unhandled: print("unhandled message!\n"))
langsrv.register(id: "initialize") {
    print("initialize!\n")
}

langsrv.run()

// import Dispatch
// import Foundation

// private let header: [String : String] = [
//     "Content-Type": "application/vscode-jsonrpc; charset=utf8"
// ]

// let main = OperationQueue.main
// let stdin = FileHandle.standardInput
// stdin.waitForDataInBackgroundAndNotify()

// // When new data is available
// var dataAvailable : NSObjectProtocol!
// dataAvailable = NotificationCenter.default.addObserver(forName: .NSFileHandleDataAvailable, object: stdin, queue: main) { (notification) -> Void in
//     let buffer = stdin.availableData

//     guard !buffer.isEmpty else {
//         return stdin.waitForDataInBackgroundAndNotify()
//     }

//     var data = buffer
//     let content = String(bytes: data, encoding: .utf8)!
//     try! content.write(toFile: "/Users/owensd/langsrv.log", atomically: false, encoding: .utf8)

//     // requests.append(buffer)

//     // for requestBuffer in requests {
//     //     do {
//     //         let request = try Request(requestBuffer)
//     //         let response = handle(request)
//     //         /// If the request id is null then it is a notification and not a request
//     //         switch request {
//     //         case .request(_, _, _):
//     //             let toSend = response.data(header)
//     //             FileHandle.standardOutput.write(toSend)
//     //         default: ()
//     //         }
//     //     } catch let error as PredefinedError {
//     //         fatalError(error.description)
//     //     } catch {
//     //         fatalError("TODO: Better error handeling. \(error)")
//     //     }
//     // }

//     return stdin.waitForDataInBackgroundAndNotify()
// }

// // Launch the task
// RunLoop.main.run()