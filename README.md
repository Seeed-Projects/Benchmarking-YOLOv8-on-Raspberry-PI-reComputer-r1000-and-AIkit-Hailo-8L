# Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L
This repository demonstrates object detection model using YOLOv8 on a Raspberry Pi CM4 with Hailo Acceleration. The Raspberry Pi AI Kit enhances the performance of the Raspberry Pi and unlock its potential in artificial intelligence and machine learning applications, like smart retail, smart traffic and more. Although the Raspberry AI Kit is designed for Raspberry Pi 5, we have experimented it on our CM4-powered edge gateway. Excited about turning our edge device into an intelligent IoT gateway! 
# Hardware Preparation
## [reComputer R1000](https://www.seeedstudio.com/reComputer-R1025-10-p-5895.html): Raspberry Pi CM4 Gateway, 4GB RAM, 32GB eMMC  
<div align='center'><img width={600} src='https://media-cdn.seeedstudio.com/media/catalog/product/cache/bb49d3ec4ee05b6f018e93f896b8a25d/1/-/1-113991274-recomputer-r1025-10-0.jpg'></div>

## [Raspberry Pi AI Kit](https://www.seeedstudio.com/Raspberry-Pi-AI-Kit-p-5900.html)
<div align='center'><img width={600} src='https://media-cdn.seeedstudio.com/media/catalog/product/cache/bb49d3ec4ee05b6f018e93f896b8a25d/1/-/1-113060086-raspberry-pi-ai-kit-45font.jpg'></div>

## [M.2 hat Raspberry Pi 5](https://www.seeedstudio.com/Raspberry-Pi-M-2-HAT-for-Raspberry-Pi-5-p-5881.html)(Only need for Raspberry Pi 5)
<div align='center'><img width={600} src='https://media-cdn.seeedstudio.com/media/catalog/product/cache/bb49d3ec4ee05b6f018e93f896b8a25d/2/-/2-103990663-raspberry-pi-m.2-hat_-_for-raspberry-pi-5_-font.jpg'></div>

# Install Hailo-8L on the reComputer R1000

## step 1. Install the Hailo-8L on the Raspberry Pi CM4

![image](./resource/install.gif)

## Step 2. Update system & Set pcie to gen3

```
sudo apt update
sudo apt full-upgrade
sudo raspi-config
```
Select option "6 Advanced Options":
<div align='center'><img width={600} src='./resource/1.png'></div>
Then select option "A8 PCIe Speed":
<div align='center'><img width={600} src='./resource/2.png'></div>
Choose "Yes" to enable PCIe Gen 3 mode:
<div align='center'><img width={600} src='./resource/3.png'></div>
Click "Finish" to exit.
<div align='center'><img width={600} src='./resource/4.png'></div>

## Step 3. Install Hailo Software & Verify Installation

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

# Install AI kit on Respberry Pi5

## Step 1. Install the Hailo-8L on the Raspberry Pi 5

Please reference [Respberry Pi 5](https://www.raspberrypi.com/documentation/accessories/ai-kit.html) to install AI kit on Respberry Pi5.

<div align='center'><img width={600} src='https://www.raspberrypi.com/documentation/accessories/images/ai-kit.jpg?hash=b707e971611c4b204c24f05e938bcf7d'></div>

## Step 2. Install Hailo Software & Verify Installation

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

## Step 3. Set pcie to gen2/gen3(gen3 is faster than gen2)

Add follows to ```/boot/firmware/config.txt```

```
#Enable the PCIe external connector

dtparam=pciex1

#Force Gen 3.0 speeds

dtparam=pciex1_gen=3
```

> [!Note]
> If you want to use gen2,please comment ```dtparam=pciex1_gen=3```

# Run this project

## Run object detection AI kit

### Step 1. Install the repository

```
git clone https://github.com/Seeed-Projects/Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L.git
```
### Step 2. The following command to run the object 
```
cd Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L
bash ./run.sh object-detection
```
### Result

![image](./resource/without_hailo.gif)

## Run object detection with AI kit

### Step 1. Install the repository

```
git clone https://github.com/Seeed-Projects/Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L.git
```

### Step 2. The following command to run the object 

```
cd Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L
bash ./run.sh object-detection-hailo
```

### Result
![image](./resource/with_hailo.gif)

## Run pose estimation without AI kit

### Step 1. Install the repository

```
git clone https://github.com/Seeed-Projects/Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L.git
```
### Step 2. The following command to run the object 
```
cd Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L
bash ./run.sh pose-estimation
```

### Result

![image](./resource/YOLOv8-pose-estimation-without-AIkit.gif)

## Run pose estimation with AI kit

### Step 1. Install the repository

```
git clone https://github.com/Seeed-Projects/Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L.git
```

### Step 2. The following command to run the object 

```
cd Benchmarking-YOLOv8-on-Raspberry-PI-reComputer-r1000-and-AIkit-Hailo-8L
bash ./run.sh pose-estimation-hailo
```

### Result

![image](./resource/YOLOv8-pose-estimation-with-AIkit.gif)

# Results
we test Yolov8s, with 640*640 input and int8 format. And we also test Yolov8s int8 on Jetson Orin NX 16GB with TensorRT accelerate. The result is shown as below:

<div align='center'><img width={600} src='./resource/ob.png'></div>


<div align='center'><img width={600} src='./resource/po.png'></div>