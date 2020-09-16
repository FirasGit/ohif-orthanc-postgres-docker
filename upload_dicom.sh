#!/bin/bash
# 2019-04-04 Christoph Haarburger
#
# Download single sequence of shoulder MRI and upload to running instance of Orthanc

curl https://rwth-aachen.sciebo.de/s/zypjGqPxN8VKW6K/download -o /tmp/dicom.zip
unzip /tmp/dicom.zip -d /tmp/

for filename in $(find /tmp/dicom/); do
    curl -u demo:demo -X POST http://localhost:80/pacs-admin/instances --data-binary @"$filename"
done