%ROS start
rosshutdown
rosinit('localhost')

%Get PCL
topic = rossubscriber('/swissranger/pointcloud2_raw');
pointcloud = receive(topic);

%Convert to XYZ matrix
xyz = readXYZ(pointcloud);

%Sets the filter size
xFilter = 0.5;
yFilter = 1;
zFilter = 1.8;

%Apply filter
index = find(xyz(:,1)>(xFilter*-1) & xyz(:,1)<xFilter & xyz(:,2)>(yFilter*-1) & xyz(:,2)<yFilter & xyz(:,3)<zFilter);

%Create a new XYZ matrix 
xyzFiltred = xyz(index, 1:3);

%Displays the result in Rviz
XYZ_to_sensor_msgs_PointCloud(xyzFiltred,'xyzFilter', 'map',10);
