%Close the ROS communication 
rosshutdown;
%Open the ROS communication
rosinit;
%transfer the topic for the variable image_color
image_color = rossubscriber('/camera/rgb/image_color');
%Receives the value of the topic
sensor_msgs_Image = receive(image_color);
%Read the Image data
imageFormatted = readImage(sensor_msgs_Image);
%View figure
imshow(imageFormatted);