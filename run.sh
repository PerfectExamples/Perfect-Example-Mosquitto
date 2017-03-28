cd mqttProducer
swift build
cd ../mqttConsumer
swift build
cd ..
./mqttConsumer/.build/debug/mqttConsumer &
./mqttProducer/.build/debug/mqttProducer
