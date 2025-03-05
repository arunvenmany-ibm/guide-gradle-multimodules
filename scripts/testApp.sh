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
./gradlew ear:test
./gradlew libertyStop

./gradlew jar:test
./gradlew war:test

if [ ! -f "jar/build/libs/guide-gradle-multimodules-jar-1.0-SNAPSHOT.jar" ]; then
  echo "jar/build/libs/guide-gradle-multimodules-jar-1.0-SNAPSHOT.jar was not generated!"
  exit 1
fi

if [ ! -f "war/build/libs/guide-gradle-multimodules-war-1.0-SNAPSHOT.war" ]; then
  echo "war/build/libs/guide-gradle-multimodules-war-1.0-SNAPSHOT.war was not generated!"
  exit 1
fi

if [ ! -f "ear/build/libs/guide-gradle-multimodules-ear-1.0-SNAPSHOT.ear" ]; then
  echo "ear/build/libs/guide-gradle-multimodules-ear-1.0-SNAPSHOT.ear was not generated!"
  exit 1
fi