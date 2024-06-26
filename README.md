# Benchmark-of-Yolo-on-CM4-with-AI-kit
This repository provides benchmarks and performance evaluations of the YOLOv8 (You Only Look Once) object detection model running on the Raspberry Pi Compute Module 4 (CM4) with an AI kit. 
# Installation AI kit
> [!NOTE]
> If you want to use AI kit Install it as follows
1. Install the AI kit on the Raspberry Pi CM4


2. Update system & Set pcie to gen3
```
sudo apt update
sudo apt full-upgrade
sudo raspi-config
```
Select option "6 Advanced Options", then select option "A8 PCIe Speed". Choose "Yes" to enable PCIe Gen 3 mode. Click "Finish" to exit.
The specific execution process is as follows:
<div align='center'><img width={600} src='./resource/1.png'></div>
<div align='center'><img width={600} src='./resource/2.png'></div>
<div align='center'><img width={600} src='./resource/3.png'></div>
<div align='center'><img width={600} src='./resource/4.png'></div>
3. Install Hailo Software & Verify Installation
Install hailo-all and reboot
```
sudo apt install hailo-all
sudo reboot
```
Check that the Hailo software is installed correctly by running the following command:

```
hailortcli fw-control identify
```
The true result is as follows:
<div align='center'><img width={600} src='./resource/software_test.png'></div>

Check hailo hardware is installed correctly by running the following command:

```
lspci | grep Hailo
```
The true result is as follows:
<div align='center'><img width={600} src='./resource/hardware_test.png'></div>

# Run this project
## Run object detection on the Raspberry Pi CM4 without AI kit

1. Install the repository

```
https://github.com/Seeed-Projects/Benchmark-of-Yolo-on-CM4-with-AI-kit.git
```
2. The following command to run the object 
```
cd Benchmark-of-Yolo-on-CM4-with-AI-kit/object_detection_benchmark/Yolov8-with-AIkit
bash ./run.sh
```
## Run object detection on the Raspberry Pi CM4 with AI kit

1. Install the repository

```
https://github.com/Seeed-Projects/Benchmark-of-Yolo-on-CM4-with-AI-kit.git
```
2. The following command to run the object 
```
cd Benchmark-of-Yolo-on-CM4-with-AI-kit/object_detection_benchmark/Yolov8-without-AIkit
bash ./run.sh
```
# Results

Here will be the video of the results to compare the performance of the Raspberry Pi CM4 with and without AI kit.
