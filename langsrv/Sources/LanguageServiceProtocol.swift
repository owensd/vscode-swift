/*
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 */

 import Foundation

struct MessageHeader {
    var contentLength: Int
    var contentType: String

    init(length: Int = 0, type: String = "application/vscode-jsonrpc; charset=utf-8") {
        self.contentLength = length
        self.contentType = type
    }
}

struct RawMessage {
    var header: MessageHeader
    var data: String
}

class Message {
    var jsonrpc: String

    init() {
        jsonrpc = "2.0"
    }
}

class RequestMessage: Message {
    var id: Int
    var method: String
    var params: [String:AnyObject]

    init(id: Int, method: String, params: [String:AnyObject] = [:]) {
        self.id = id
        self.method = method
        self.params = params
    }
}

class ResponseMessage: Message {
    var id: Int?
    var result: AnyObject?
    var error: ResponseError?

    init(id: Int? = nil, result: AnyObject? = nil, error: ResponseError? = nil) {
        self.id = id
        self.result = result
        self.error = error
    }
}

class ResponseError {
    var code: Int
    var message: String
    var data: AnyObject?

    init(code: Int, message: String, data: AnyObject? = nil) {
        self.code = code
        self.message = message
        self.data = data
    }
}

enum ErrorCodes: Int {
	// Defined by JSON RPC
	case parseError = -32700
	case invalidRequest = -32600
	case methodNotFound = -32601
	case invalidParams = -32602
	case internalError = -32603
	case serverErrorStart = -32099
	case serverErrorEnd = -32000
	case serverNotInitialized = -32002
	case unknownErrorCode = -32001

	// Defined by the protocol.
	case requestCancelled = -32800
}

class NotificationMessage: Message {
    var method: String
    var params: [String:AnyObject]

    init(method: String, params: [String:AnyObject]) {
        self.method = method
        self.params = params
    }
}

final class LanguageServiceProtocol {
    typealias MessageHandler = () -> ()
    typealias UnregisteredMessageHandler = () -> ()
    typealias InvalidMessageHandler = () -> ()

    private var unregisteredMessageHandler: UnregisteredMessageHandler? = nil
    private var invalidMessageHandler: InvalidMessageHandler? = nil
    private var handlers: [String:MessageHandler] = [:]

    /// Registers a given handler for a particular message ID.
    /// SwiftBug(SR-2688) - cannot use the typealias here.
    func register(id: String, _ handler: @autoclosure @escaping () -> ()) {
        print("registering handler for: \(id)")
        handlers[id] = handler
    }

    /// Registers a given handler for a particular message ID.
    /// SwiftBug(SR-2688) - cannot use the typealias here.
    func register(id: String, _ handler: @escaping () -> ()) {
        print("registering handler for: \(id)")
        handlers[id] = handler
    }

    /// Register the handler that should be triggered when an unhandled message ID comes in.
    /// SwiftBug(SR-2688) - cannot use the typealias here.
    func register(unhandled handler: @autoclosure @escaping () -> ()) {
        unregisteredMessageHandler = handler
    }

    /// 
    /// SwiftBug(SR-2688) - cannot use the typealias here.
    func register(invalid handler: @autoclosure @escaping () -> ()) {
        invalidMessageHandler = handler
    }

    /// Runs the language service. This waits for input via `stdin`, parses it, and then triggers
    /// the appropriately registered handler. If no handler is found, then `unhandled` is triggered
    /// with the contents of the message.
    func run() -> Never {
        // Sample message:
        // ----------------
        // Content-Length: ...
        // Content-Type: application/vscode-jsonrpc; charset=utf-8
        //
        // {
        //   "jsonprc": "2.0",
        //   "id": 1,
        //   "method": "textDocument/didOpen",
        //   "params": {
        //     ...
        //   }
        // }
        //
        // Newlines are always: \r\n.
        // Content-Type is optional.

        monitorStdIn() { raw in 
            if raw.characters.count > 0 {
                guard let _ = parse(message: raw) else {
                    fatalError("the message is invalid")
                }

                print("message parsed")
            }
        }

    }

    func parse(message data: String) -> RawMessage? {
        enum ParserState {
            case header
            case body
        }
        var header = ""
        var body = ""
        var state = ParserState.header

        var newLineCount = 0
        for c in data.characters {
            if (c == "\r" || c == "\n") {
                if c == "\n" { newLineCount += 1 }
                if newLineCount == 2 {
                    state = .body
                }
            }

            switch state {
                case .header: header += "\(c)"
                case .body: body += "\(c)"
            }
        }

        if state != .body {
            print("message is not properly separated by '\\r\\n\\r\\n' or '\\n\\n'")
            return nil
        }

        guard let parsedHeader = parse(header: header) else {
            print("unable to parse the header")
            return nil
        }
        guard let parsedData = parse(body: body) else {
            print("unable to parse the body")
            return nil
        }
        return RawMessage(header: parsedHeader, data: parsedData)
    }

    func parse(header content: String) -> MessageHeader? {
        enum ParserState {
            case name
            case value
        }

        var values: [String:String] = [:]
        var name = ""
        var value = ""
        var state = ParserState.name
        for c in content.characters {
            if c == ":" {
                state = .value
            }
            else if c == "\r" || c == "\n" {
                if c == "\n" {
                    state = .name
                    values[name.trimmingCharacters(in: .whitespaces)] = value.trimmingCharacters(in: .whitespaces)
                    name = ""
                    value = ""
                }
            }
            else {
                switch state {
                    case .name: name += "\(c)"
                    case .value: value += "\(c)"
                }
            }
        }

        if values.count == 0 {
            print("header is formatted incorrectly")
            return nil
        }

        guard let length = Int(values["Content-Length"] ?? "0") else {
            print("Unable to retrieve the content length")
            return nil
        }

        if length <= 0 {
            print("Invalid content length")
            return nil
        }

        var header = MessageHeader(length: length)

        if let contentType = values["Content-Type"] {
            header.contentType = contentType
        }

        return header
    }

    func parse(body: String) -> String? { 
        return body
    }
}