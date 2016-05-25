%ROS start
rosshutdown
rosinit('localhost')

%Get PCL
topic = rossubscriber('/swissranger/pointcloud2_raw');
pointcloud = receive(topic);

%Convert to XYZ matrix
xyz = readXYZ(pointcloud);

%Sets the filter size
zFilter = 2;

%Apply filter
index = find(xyz(:,3)<zFilter);

%Create a new XYZ matrix 
xyzFiltred = xyz(index, 1:3);

%Displays the result in Rviz
XYZ_to_sensor_msgs_PointCloud(xyzFiltred,'zFilter', 'map',10);