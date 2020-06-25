#!/bin/bash
curl -o .esp32firmware.bin https://micropython.org/resources/firmware/esp32-idf3-20191220-v1.12.bin
esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash && esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 460800 write_flash -z 0x1000 .esp32firmware.bin && rshell -p /dev/ttyUSB0 --buffer-size=30