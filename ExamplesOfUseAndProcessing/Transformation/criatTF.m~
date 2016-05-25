rosshutdown
rosinit('localhost')

%Receives tf
tftree = rostf;
pause(1);

%Creates a reference sr4000_link
tfSR4000 = rosmessage('geometry_msgs/TransformStamped');
tfSR4000.ChildFrameId = 'sr4000_link';
tfSR4000.Header.FrameId = 'base_link';

%Sets the distance between the robot and the sensor
tfSR4000.Transform.Translation.X = 0;
tfSR4000.Transform.Translation.Y = 1.5;
tfSR4000.Transform.Translation.Z = 0;

%Send the tf for ROS
tfSR4000.Header.Stamp = rostime('now');
sendTransform(tftree, tfSR4000)
pause(1);

%Creates a reference kinect_link
tfKinect = rosmessage('geometry_msgs/TransformStamped');
tfKinect.ChildFrameId = 'kinect_link';
tfKinect.Header.FrameId = 'base_link';

%Sets the distance between the robot and the sensor
tfKinect.Transform.Translation.X = 0;
tfKinect.Transform.Translation.Y = -1.5;
tfKinect.Transform.Translation.Z = 0;

%Send the tf for ROS
tfKinect.Header.Stamp = rostime('now');
sendTransform(tftree, tfKinect)
pause(1);
