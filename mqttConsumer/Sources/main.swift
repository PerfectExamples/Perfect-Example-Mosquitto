//
//  main.swift
//  Perfect-Example-Mosquitto/mqttConsumer
//
//  Created by Rockford Wei on 2017-03-28.
//  Copyright © 2017 PerfectlySoft. All rights reserved.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2017 - 2018 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
import PerfectMosquitto
#if os(Linux)
import SwiftGlibc
#else
import Darwin
#endif
Mosquitto.OpenLibrary()
print("---------      Message Consumption Started.     ----------")

let topic = "publish/test"
let m = Mosquitto(id: "localMessageConsumer")
do {
  var alive = true
  m.OnMessage = { msg in
    guard let text = msg.string else {
      print("message fault")
      return
    }
    print("received: \(text)")
    if let _ = strstr(text, "100") {
      alive = false
    }//end if
  }//end on Message
  try m.connect()
  try m.subscribe(topic: topic)
  while(alive) {
    try m.wait(100)
  }//end while
  try m.disconnect()
}catch(let err) {
  print("Producer connection() fault: \(err)")
}//end do


print("---------      Message Consumption Completed.     ----------")
Mosquitto.CloseLibrary()
