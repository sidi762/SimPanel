//
//  FGConnection.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/8/25.
//  Copyright © 2020 梁思地. All rights reserved.
//

import Foundation
import Network

struct FlightData {
    var throttle:Float?
    var rudder:Float?
    var handwheel:Float?
    var reverser:Int?
}

class Client: ObservableObject {
    var connection: NWConnection
    var queue: DispatchQueue
    var targetIP:NWEndpoint.Host = "192.168.1.5"
    var targetPort:NWEndpoint.Port = 23333
    
    //var status: String = ""
    
    var data:FlightData?
    var dataString: String?
    
    init(){
        print("client initialized!")
        queue = DispatchQueue(label: "UDP Client Queue")
        connection = NWConnection(host: self.targetIP, port: targetPort, using: .udp)
        connection.stateUpdateHandler = { [weak self] (newState) in
            switch (newState) {
            case .setup:
                print("connection setup")
                break
            case .waiting(let error):
                print("connection waiting")
                self?.connectionDidFail(error: error)
            case .preparing:
                print("connection preparing")
                //print(self?.connection.state)
                break
            case .ready:
                print("Connection ready")
                //self?.status = "Connected"
                self?.initConnection()
            case .failed(let error):
                self?.connectionDidFail(error: error)
            case .cancelled:
                break
            default:
                break
            }
        }
        //print(self.status)
        connection.start(queue: queue)
        print("Connection Started")
    
    }

    func connectionDidFail(error: Error) {
        print("Connection failed with error: \(error)")
    }

    func stop(status: String) {
        
    }
    
    func initConnection(){
        print("connection initialized!")
        let helloMessage = "Hello from client".data(using: .utf8)
        self.connection.send(content: helloMessage, completion: .contentProcessed({(error) in
            if let error = error {
                print("Send error: \(error)")
            }
        }))
        
        self.dataString = "\(self.data?.throttle ?? 0), \(self.data?.reverser ?? 0), \(self.data?.rudder ?? 0), \(self.data?.handwheel ?? 0)"
        sendDataToFG(data: self.dataString?.data(using: .utf8) ?? Data.init())
    }
    
    func updateThrottleData(throttleData: Float){
        
    }
    func updateReverserData(ReverserData: Int){
        
    }
    func updateRudderData(rudderData: Float){
        
    }
    func updateHandwheelData(handwheelData: Float){
        
    }
    
    
    func sendDataToFG(data:Data) {
        print("Data \(data) is being sent to \(self.targetIP):\(self.targetPort)")
        self.connection.send(content: data, completion: .contentProcessed({(error) in
            if let error = error {
                print("Data send error: \(error)")
            }
        }))
    }

}



