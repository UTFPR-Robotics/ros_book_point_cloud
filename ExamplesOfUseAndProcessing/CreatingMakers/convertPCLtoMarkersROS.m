%responsible function to create a Marker Array
function [Markers] = convertPCLtoMarkersROS(xyz,topicName, type, scale, frame, numberPoints,time)

%Create topic
pub = rospublisher(strcat('/ ',topicName),'visualization_msgs/MarkerArray');

%Creates MakeArray
markers = rosmessage('visualization_msgs/MarkerArray');

%Sets the loop jump
jump = round(size(xyz,1)/numberPoints);

%Loop responsible for creating the Markers
contMarker = 1;
for i=1:jump:size(xyz,1)
    points(contMarker) =  marker(xyz(i,1),xyz(i,2),xyz(i,3),1,1,1,type,scale,contMarker,frame);
    contMarker = contMarker+1;
end

%Pass the vector for Markers
markers.Markers = points;

%Sends ROS
send(pub,markers);

%Active time
pause(time);
end