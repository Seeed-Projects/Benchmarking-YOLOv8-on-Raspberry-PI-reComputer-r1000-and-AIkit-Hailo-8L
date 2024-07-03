# !/bin/bash

folder="./hailomodel"
filename=$(basename "$1")

if [ "$filename" == "object-detection-hailo" ] || [ "$filename" == "pose-estimation-hailo" ]; then
    # Check if the folder exists
    if [ ! -d "$folder" ]; then
        # If the folder does not exist, create it
        mkdir -p "$folder"
    
        # Download the file into the created folder
        wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolox_s_leaky_h8l_mz.hef -P $folder
        wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov6n.hef -P $folder
        wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov8s_h8l.hef -P $folder
        wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov8s_pose_h8l_pi.hef -P $folder
    
        echo "Folder created and file downloaded successfully."
    else
        # If the folder already exists, do nothing
        echo "Folder already exists. No action taken."
    fi

    source setup_env.sh
    pip install setproctitle
    pip install opencv-python


    python3 "$1".py --input ./video/detection0.mp4
fi


if [ "$filename" == "object-detection" ] || [ "$filename" == "pose-estimation" ]; then

    python3 -m venv ./yolov8_venv
    source yolov8_venv/bin/activate
    pip install ultralytics
    python3 "$1".py
fi