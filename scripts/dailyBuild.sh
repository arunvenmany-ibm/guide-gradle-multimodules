#!/bin/bash
while getopts t:d: flag; do
    case "${flag}" in
    t) DATE="${OPTARG}" ;;
    d) DRIVER="${OPTARG}" ;;
    *) echo "Invalid option";;
    esac
done

sed -i "\#liberty {#a \ninstall { runtimeUrl=\"https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/nightly/$DATE/$DRIVER\"}" ear/build.gradle
cat ear/build.gradle

../scripts/testApp.sh
