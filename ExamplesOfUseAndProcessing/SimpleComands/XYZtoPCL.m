
function  XYZtoPCL(xyz,TopicName,FrameName)

PCL1mensage = rosmessage('geometry_msgs/Point32');
for i=1:size(xyz,1)
    PCL1mensage(i).X = xyz(i,1);
    PCL1mensage(i).Y = xyz(i,2);
    PCL1mensage(i).Z = xyz(i,3);  
end

msg = rosmessage('sensor_msgs/PointCloud');
msg.Header.FrameId = FrameName;
pub = rospublisher(strcat('/',TopicName),'sensor_msgs/PointCloud');
msg.Points = PCL1mensage;
send(pub,msg);
end