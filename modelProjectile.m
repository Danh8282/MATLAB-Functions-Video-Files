function[maxHeight, airTime, horizontalDisplacement] = modelProjectile(launchVelocity, launchAngle) 

%Gravitational acceleration constant 
g = -9.8;

%Parameterizing the launch velocity into horizontal and vertical components
horizontalVelocity = cosd(launchAngle)* launchVelocity; 
verticalVelocity = sind(launchAngle)* launchVelocity;

%v2 = v02 + 2a?height rearranged to solve for height with v set equal to 0
%v = 0 becuase at the peak of the arc, there is no vertical velocity 
maxHeight = -(verticalVelocity)^2/ (2*g);

%v = v0 + at rearranged to solve for t. v once again set to 0. 
peakTime = -verticalVelocity/g;

%The peak of the arc represents half of the flight time of the projectile
airTime = 2*peakTime; 

%y = v*t to find horizontal distance now that we have the total flight time
horizontalDisplacement = horizontalVelocity* airTime;

%Creating a time step matrix with values of 0 - air time in steps of .01
timeVec = 0:.01:round(airTime,2);

%Calculating the horizontal position of the projectile at each time step
xPos = horizontalVelocity.*timeVec;

%Calculating the vertical position of the projectile at each time step
yPos = verticalVelocity.*timeVec + .5*g*timeVec.^2;

%Creating a subplot for our two plot figures
subplot(1,2,1)

%Plotting the arc of the projectile 
fig1 = plot(xPos, yPos);
ylim([0, 500])
xlabel(['Horizontal Displacement'])
ylabel(['Vertical Displacement'])
hold on

%Plotting the Angle of Launch vs. the Horizontal displacement as a red star
subplot(1,2,2)
fig2 = plot(launchAngle, horizontalDisplacement, 'r*');
xlabel(['Angle of Launch (degrees)'])
ylabel(['Horizontal Displacement'])
hold on


end 