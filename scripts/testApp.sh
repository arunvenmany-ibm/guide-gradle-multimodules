#!/bin/bash
set -euxo pipefail

./gradlew -version
./gradlew tasks
./gradlew clean
cat ./build.gradle

./gradlew clean libertyPackage
./gradlew libertyCreate
./gradlew installFeature
./gradlew deploy
./gradlew libertyStart
sleep 5
curl http://localhost:9080/converter/ | grep "Height Converters"
./gradlew libertyStop

./gradlew war:test
