%ROS start
rosshutdown
rosinit('localhost')

%Creates the tf
criatTF ;
pause(1);

% Read the topics
kinect = rossubscriber('/camera/depth/points');
sr4000 = rossubscriber('/swissranger/pointcloud2_raw');

%Create new topics
pub = rospublisher('Kinect','sensor_msgs/PointCloud2');
pub2 = rospublisher('sr4000','sensor_msgs/PointCloud2');


while true
    %takes the Point Cloud and modify your reference
    pointcloudKinect = receive(kinect);
    pointcloudKinect.Header.FrameId = 'kinect_link'; 

    % Applies tf and publishes
    pointcloudKinect2 = transform(tftree, 'base_link', pointcloudKinect);  
    send(pub,pointcloudKinect2);
    
    %takes the Point Cloud and modify your reference
    pointcloudSR4000 = receive(sr4000);
    pointcloudSR4000.Header.FrameId = 'sr4000_link'; 

    % Applies tf and publishes
    pointcloudSR40002 = transform(tftree, 'base_link', pointcloudSR4000);
    send(pub2,pointcloudSR40002);
    pause(0.5);
end
