//
//  main.swift
//  Perfect-Example-Mosquitto/mqttProducer
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

Mosquitto.OpenLibrary()
print("---------      Message Production Started.     ----------")

let topic = "publish/test"
let m = Mosquitto(id: "localMessageProducer")
do {
  try m.connect()
  m.setMessageRetry(max: 3)
  for i in 0 ... 100 {
    var msg = Mosquitto.Message()
    msg.topic = topic
    msg.string = "publication test 🇨🇳🇨🇦 #\(i)"
    let _ = try m.publish(message: msg)
    try m.wait(100)
  }//next
  try m.disconnect()
}catch(let err) {
  print("Producer connection() fault: \(err)")
}//end do


print("---------      Message Production Completed.     ----------")
Mosquitto.CloseLibrary()
