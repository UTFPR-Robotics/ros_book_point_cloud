%Close the ROS communication 
rosshutdown;
%Open the ROS communication
rosinit;
%transfer the topic for the variable pointcloud_raw
pointcloud = rossubscriber('/swissranger/pointcloud2_raw');
%Receives the value of the topic
pcloud = receive(pointcloud);
%Displays data
scatter3(pcloud);
