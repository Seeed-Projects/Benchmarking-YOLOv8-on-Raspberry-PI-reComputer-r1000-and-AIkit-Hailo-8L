from ultralytics import YOLO
import time

model = YOLO("../../yolo_model/yolov8s-pose.onnx")
total_frames = 744
begin = time.time()
result = model(source="../../video/detection0.mp4", show=True)
end = time.time()

total_time = end - begin

print("average fps: ", total_frames/total_time)