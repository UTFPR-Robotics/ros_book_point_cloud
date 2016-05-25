%This function convert a NX3 array dimension in a message 
%of type sensor_msgs/PointCloud understandable in ROS.
%xyz = Nx3 matrix:
%Nx1 = X;
%Nx2 = Y;
%Nx3 = Z;
%TopicName = topic name in ROS.
%FrameName = Name of reference, examples: map, World.
%Time = Time the topic had been visible.
function msg = XYZ_to_sensor_msgs_PointCloud(xyz,TopicName,FrameName,Time)

xyzvalid = xyz(~isnan(xyz(:,1)),:);
PCL1mensage = rosmessage('geometry_msgs/Point32');
for i=1:size(xyzvalid,1)
    PCL1mensage(i).X = xyzvalid(i,1);
    PCL1mensage(i).Y = xyzvalid(i,2);
    PCL1mensage(i).Z = xyzvalid(i,3);  
end

msg = rosmessage('sensor_msgs/PointCloud');
msg.Header.FrameId = FrameName;
msg.Points = PCL1mensage;
pub = rospublisher(strcat('/',TopicName),'sensor_msgs/PointCloud');
send(pub,msg);
pause(Time);
end