%create a marker
function [marker] = marker(x,y,z,r,g,b,type,scale,id,frame)

%Create a maker
marker = rosmessage('visualization_msgs/Marker');

%Set the type of the marker
marker.Type = type;

% Set the pose of the marker.
marker.Pose.Position.X = x;
marker.Pose.Position.Y = y;
marker.Pose.Position.Z = z;

%set the orientation of the marker
marker.Pose.Orientation.X = 0.0;
marker.Pose.Orientation.Y = 0.0;
marker.Pose.Orientation.Z = 0.0;
marker.Pose.Orientation.W = 1.0;

% Set the scale of the marker
marker.Scale.X = scale;
marker.Scale.Y = scale;
marker.Scale.Z = scale;

% Set a RGB color of the marker
marker.Color.R = r;
marker.Color.G = g;
marker.Color.B = b;

% Set the transparency
marker.Color.A = 1;

% Set the frame
marker.Header.FrameId = frame;

% Marker id
marker.Id = id;

end