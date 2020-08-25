//
//  FGConnection.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/8/25.
//  Copyright © 2020 梁思地. All rights reserved.
//

import Foundation
import Network

class Client {
    var connection: NWConnection
    var queue: DispatchQueue
    var targetIP:NWEndpoint.Host = "localhost"
    var targetPort:NWEndpoint.Port = 23333
    init?(){
        queue = DispatchQueue(label: "UDP Client Queue")
        connection = NWConnection(host: self.targetIP, port: targetPort, using: .udp)
        connection.stateUpdateHandler = { [weak self] (newState) in
            switch (newState) {
            case .setup:
                break
            case .waiting(let error):
                self?.connectionDidFail(error: error)
            case .preparing:
                break
            case .ready:
                print("Connection ready")
                self?.status = "Connected"
                let helloMessage = "Hello from client".data(using: .utf8)
                self?.connection.send(content: helloMessage, completion: .contentProcessed({(error) in
                    if let error = error {
                        print("Send error: \(error)")
                    }
                }))
            case .failed(let error):
                self?.connectionDidFail(error: error)
            case .cancelled:
                break
            @unknown default:
                break
            }
        }
        //self.setupReceive(on: connection)
        connection.start(queue: queue)
    
    }
    
    var status: String = ""

    func connectionDidFail(error: Error) {
        print("Connection failed with error: \(error)")
    }

    func stop(status: String) {
        
    }

    func sendDataToFG(data:Data) {
        self.connection.send(content: data, completion: .contentProcessed({(error) in
            if let error = error {
                print("Data send error: \(error)")
            }
        }))
    }

}


