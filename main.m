%% ENGI 1331H Project 2 - Santiago Bukowitz - 1798299 - sbukowitz@uh.edu
clc;close;clear;
disp('ENGI 1331H Project 2 - Santiago Bukowitz - 1798299 - sbukowitz@uh.edu');
disp(' ')
 
%% Section 1 - Image Masking
disp('Section 1 - Image Manipulation');
disp('Press any key to continue');
disp(' ') 
pause;
%Task 1.1 - Load Image
disp('Task 1.1: Load Image'); %Loading both images
disp(' ');
cougar=imread('cougar.jpg');
campus=imread('campus.jpg');
figure(1011)
image(cougar);
title('cougar');
disp('Press any key to continue.');
disp(' ');
pause;
figure(1012)
image(campus);
title('campus');
disp('Press any key to continue.');
disp(' ');
pause;

%Task 1.2- Display Size
disp('Task 1.2: Display Size'); %getting the sizes of row by dimension
disp(' ');
[r1,c1,d1]=size(cougar);
[r2,c2,d2]=size(campus);
disp("cougar: "+r1+" by "+d1);
disp(' ');
disp("campus: "+r2+" by "+d2);
disp(' ');
disp("The images being the same size and dimension is important because it allows us to blend them together after masking them.") 
disp(' ')
disp('Press any key to continue.');
pause;

%Task 1.3 - Mask
disp('Task 1.3: Mask'); %masking cougar and placing it onto campus
disp(' ');
red_coug=cougar(:,:,1);
green_coug=cougar(:,:,2);
blue_coug=cougar(:,:,3);

cougar_mask=red_coug>0 & green_coug<230 & blue_coug>0;
filtered_cougar=~cougar_mask;
filtered_mask_cougar=cat(3,filtered_cougar,filtered_cougar,filtered_cougar);
coug_campus=cougar;

coug_campus(filtered_mask_cougar)=campus(filtered_mask_cougar);
figure(103);
image(coug_campus);
title('cougar on campus');
disp(' ');
disp('Press any key to continue.');
pause;
disp(' ');


 %% Section 2 - Image Array Manipulation
disp('Section 2: Image Array Manipulation');
disp(' ');
%Task 2.1
disp('Task 2.1: rainbow image');
disp(' ');
rainbow=imread('rainbow(1).jpg');
figure(201);
image(rainbow);
title('rainbow'); %loading the rainbow image
disp(' ')
disp('Press any key to continue.');
pause;

%Task 2.2
disp('Task 2.2: Display Pixels');
disp(' ');
[row1,col1,dim1]=size(rainbow);
pixels=(row1*col1); %using an operation to get the number of pixels
disp("pixels: "+pixels)
disp(' ')
disp('Press any key to continue.');
disp(' ');
pause;

%Task 2.3
disp('Task 2.3: Rainbow Layers');
disp(' ');
rainbow_r=rainbow(:,:,1); %seperating rainbow into layers
rainbow_g=rainbow(:,:,2);
rainbow_b=rainbow(:,:,3);
disp('Press any key to continue.');
disp(' ');
pause;

%Task 2.4
disp('Task 2.4: display images'); %displaying the layers of rainbow into a subplot
disp(' ');
figure(204)
title('rainbow image and its layers');

subplot(2,2,1)
imshow(rainbow);
title('original image');


subplot(2,2,2)
imshow(rainbow_r);
title('red layer');


subplot(2,2,3)
imshow(rainbow_g);
title('green layer');


subplot(2,2,4)
imshow(rainbow_b);
title('blue layer');

disp('The images are now in greyscale. It makes sense because, we took the image and stripped it into layers while tweaking the index values.');
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause;
%Task 2.5 
disp('Task 2.5: 3D images')
disp(' ')
z=zeros(size(rainbow,1),size(rainbow,2)); %creating a filler for the 3d layers.
red_layer=cat(3,rainbow_r,z,z);
green_layer=cat(3,z,rainbow_g,z);
blue_layer=cat(3,z,z,rainbow_b);
figure(205);

subplot(2,2,1)
image(rainbow);
title('original image');


subplot(2,2,2)
image(red_layer);
title('red layer');


subplot(2,2,3)
image(green_layer);
title('green layer');


subplot(2,2,4)
image(blue_layer);
title('blue layer');
disp('Press any key to continue.');
disp(' ');
pause;


%Task 2.6
disp('Task 2.6: Add and Subtract input values');
disp(' ');

subtract=input('Put in a number between 0 and 255:'); %using the input function to get a number.
subtract_image=rainbow-subtract;

add=input('Put in a number between 0 and 255:');
add_image=rainbow+add;

figure(206)

subplot(3,3,1)
image(rainbow);
title('original image'); %graphing the new images



subplot(3,3,5)
image(add_image);
title('added value');

subplot(3,3,9)
image(subtract_image);
title('subtract value');
disp('Press any key to continue.');
disp(' ');
pause;

disp('The added value is lighter because, its RGB value is closer to 255 which is the RGB value for white.');
disp(' ');
disp('The subtracted value is darker because, its RGB value is closer to 0 which is the RGB value for black.');
disp(' ');
disp('Press any key to continue.');
disp(' ');

%Task 2.7
disp('Task 2.7: Identify Purple Region');
disp(' ');
mask_purple=rainbow_r<99 & rainbow_r>40 & rainbow_g<80 & rainbow_g>19 & rainbow_b>30 & rainbow_b<151;
rainbow_r(mask_purple)=255; %Created a mask that identifies purple RGB values.
rainbow_g(mask_purple)=255; %Those values are set to 255.
rainbow_b(mask_purple)=255;
rainbow_lean=cat(3,rainbow_r,rainbow_g,rainbow_b); %New mask
figure(207);
image(rainbow_lean)
title('New Rainbow!');
disp("Using the data cursor, I identified the upper and lower bounds of the purple RGB values. "+newline+" I put those values into a mask and then set those values to 255.");
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause;

%% Section 3 - More Image Masking
disp('Section 3: More Image Masking');
disp(' ');
%Task 3.1
disp('Task 3.1 : Load Images');
disp(' ');
spidey=imread('spiderman.jpg');
nyc=imread('nyc.jpg');

figure(301)
subplot(1,2,1)
image(spidey);
title('spiderman');


subplot(1,2,2)
image(nyc);
title('nyc');
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause;

%Task 3.2
disp('Task 3.2: Spiderman Mask');
disp(' ');

red_spidey=spidey(:,:,1);
green_spidey=spidey(:,:,2); %very similar to 1.3 in that we're creating a mask and placing one image onto another.
blue_spidey=spidey(:,:,3);

spidey_mask=red_spidey>0 & green_spidey<245 & blue_spidey>0;
filtered_spidey=~spidey_mask;
filtered_mask=cat(3,filtered_spidey,filtered_spidey,filtered_spidey);
spidey_nyc=spidey;

spidey_nyc(filtered_mask)=nyc(filtered_mask);
figure(302);
image(spidey_nyc);
title('Spiderman in NYC');

disp('Press any key to continue.');
disp(' ');
pause;
%% Section 4 - More Image Array Manipulation
disp('Section 4: More Image Array Manipulation');
disp(' ');
%Task 4.1
disp('Task 4.1: Assign Layers');
disp(' ');

red_spidey=spidey(:,:,1); %seperating both images into layers.
green_spidey=spidey(:,:,2);
blue_spidey=spidey(:,:,3);

nyc_r=nyc(:,:,1);
nyc_g=nyc(:,:,2);
nyc_b=nyc(:,:,3);

disp('Press any key to continue.');
disp(' ');
pause; 
%Task 4.2
disp('Task 4.2: Create a Mask');
disp(' ');

spidey_z=zeros(size(spidey,1),size(spidey,2));
nyc_z=zeros(size(nyc,1),size(nyc,2));

spidey_red3=cat(3,red_spidey,spidey_z,spidey_z);
spidey_green3=cat(3,spidey_z,green_spidey,spidey_z);
spidey_blue3=cat(3,spidey_z,spidey_z,blue_spidey);
spidey_mask3=cat(3,spidey_red3,spidey_green3,spidey_blue3);

green_spidey_mask=green_spidey<230;
new_spidey_mask=cat(3,green_spidey_mask,green_spidey_mask,green_spidey_mask);

nyc_r3=cat(3,nyc_r,nyc_z,nyc_z); %3d masks 
nyc_g3=cat(3,nyc_z,nyc_g,nyc_z);
nyc_b3=cat(3,nyc_z,nyc_z,nyc_b);

disp('Press any key to continue.')
disp(' ');
pause;
%Task 4.3
disp('Task 4.3: Ghost Images'); %In this section we took the 3d layers and masked them onto some RGB values of nyc.
disp(' ');                      

figure(403)
subplot(2,2,1)
image(new_spidey_mask)
title('3D Mask Visualized');


nyc_r_ghost=nyc;
nyc_g_ghost=nyc;
nyc_b_ghost=nyc;

nyc_r_ghost(new_spidey_mask)=spidey_red3(new_spidey_mask);

mask_red=cat(3,nyc_r_ghost(:,:,1),nyc_g,nyc_b);


subplot(2,2,2)
image(mask_red);
title('NYC w/ Red Ghost');


nyc_g_ghost(new_spidey_mask)=spidey_green3(new_spidey_mask);
mask_green=cat(3,nyc_r,nyc_g_ghost(:,:,2),nyc_b);

subplot(2,2,3)
image(mask_green)
title('NYC w/ Green Ghost');


nyc_b_ghost(new_spidey_mask)=spidey_blue3(new_spidey_mask);
mask_blue=cat(3,nyc_r,nyc_g,nyc_b_ghost(:,:,3));

subplot(2,2,4)
image(mask_blue)
title('NYC w/ Blue Ghost');
disp('Press any key to continue.');
disp(' ');
pause;

%% Section 5 - Data Masking with User-Defined Functions
disp('Section 5: Data Masking with User-Defined Functions');
disp(' ');
%Task 5.1 
disp('Task 5.1: Loading Data Sets');
disp(' ');

heart_rate=load('heartrate(1).csv');
pressure=load('systolicpressure(1).csv');
weather_data=load('weatherdata(1).csv');

[row1,col1]=size(heart_rate); 
[row2,col2]=size(pressure);
[row3,col3]=size(weather_data);

disp("The dimensions of the heart rate data are: " +row1+ " by " +col1+ newline + " with the 14 representing days and the 24 representing hours."+newline+"It is recorded in beats per minute.");
disp(' ');
disp("The dimensions of Systolic pressure data are: " +row2+ " by " +col2+ newline+" with the 14 representing days and the 24 representing hours. It is being recorded in mmHg.");
disp(' ');
disp("The dimensions of the Weather Data are: " +row3+ " by " +col3+ newline +" with the 14 representing days and the 24 representing hours. It is being recorded in degrees Fahrenheit.");
disp(' '); 
disp('The data sets were loaded onto the script and their dimesnions were displayed.');
disp(' ');
disp('Press any key to continue.'); 
disp(' ');
pause;
%Task 5.2
disp('Task 5.2: Mean');
disp(' ');
firsthalf=row1/2;
sum_firsthalf=weather_data([1:firsthalf]);
avg_firsthalf=mean(sum_firsthalf,'all');

sum_secondhalf=weather_data(firsthalf+1:row1);
avg_secondhalf=mean(sum_secondhalf,'all');

avg_heartrate=mean(heart_rate,'all');
avg_pressure=mean(pressure,'all');
disp("Week 1 Average Temperature: "+avg_firsthalf+" Degrees Fahrenheit");
disp(' ');
disp("Week 2 Average Temperature: "+avg_secondhalf+" Degrees Fahrenheit");
disp(' ');
disp("Average Heart Rate: "+avg_heartrate+" Beat per Minute");
disp(' ');
disp("Average Systolic Pressure: "+avg_pressure+" mmHg");
disp(' ');
disp('The mean of all the data sets were taken and displayed.');
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause; 
%Task 5.3
disp('Task 5.3: Matrix Function');
disp(' ');

[heart_vec]=MatrixToVector(heart_rate,row1,col1);
disp("The first 5 values of the heart rate vector are: "+heart_vec(1)+" "+heart_vec(2)+" "+heart_vec(3)+" "+heart_vec(4)+ " "+ heart_vec(5)+" beats per minute");
disp(' ');
[pressure_vec]=MatrixToVector(pressure,row2,col2);
disp("The first 5 values of the pressure vector are: "+pressure_vec(1)+" "+pressure_vec(2)+" "+pressure_vec(3)+" "+pressure_vec(4)+" "+pressure_vec(5)+ " mmHG");
disp(' ');
[weather_vec]=MatrixToVector(weather_data,row3,col3);
disp("The first 5 values of the weather vector are: "+weather_vec(1)+" "+weather_vec(2)+" "+weather_vec(3)+" "+weather_vec(4)+" "+weather_vec(5)+ " Degrees Fahrenheit.");
disp(' ');
disp('The data sets were taken and turned into vecotrs.');
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause;

%Task 5.4
disp('Task 5.4: Scatterplot');
disp(' ');
figure(505);
scatter(heart_vec,pressure_vec,weather_vec);
xlabel('Heart Rate [Beats per Minute]');
ylabel('Systolic Pressure [mmHg]');
title('Heart Rate vs. Systolic Pressure Scatter');
disp('The first scatter plot of the data sets was taken.');
disp(' ');
disp('Press any key to continue.')
disp(' ');
pause;

%Task 5.5
disp('Task 5.5: Original Matrix Mask');
disp(' ');
matrix_mask=cat(3,heart_rate,pressure,weather_data);
real_data=matrix_mask;
replace_mask=matrix_mask;
avg_heart_i=round(avg_heartrate);
avg_pressure_i=round(avg_pressure);
avg_weather_i=round(weather_data);
replace_mask(:,:,1)=avg_heart_i;
replace_mask(:,:,2)=avg_pressure_i;
replace_mask(:,:,3)=avg_weather_i;

replacement_mask=real_data(:,:,1)>60 & real_data(:,:,1)<100 & real_data(:,:,2)>90 & real_data(:,:,2)<120;
filtered=cat(3,~replacement_mask,~replacement_mask,~replacement_mask);
real_data(filtered)=replace_mask(filtered);

disp('The original data was taken and put into a mask that took away outliers.');
disp(' ');
disp('Press any key to continue.')
disp(' ');
pause;

%Task 5.6
disp('Task 5.6: Separate Layers');
disp(' ');
[final_heart_vec]=MatrixToVector(real_data(:,:,1),row1,col1);
[final_pressure_vec]=MatrixToVector(real_data(:,:,2),row2,col2);
[final_weather_vec]=MatrixToVector(real_data(:,:,3),row3,col3);
disp('The adjusted, outlier-free data sets were turned into vectors that can be graphed later.');
disp(' ');
disp('Press any key to continue.');
disp(' ');
pause;

%Task 5.7
disp('Task 5.7: Final Scatterplot');
disp(' ');
figure(507)
scatter(final_heart_vec,final_pressure_vec,final_weather_vec);
xlabel('Final Heart Rate [Beats per Minute]');
ylabel('Final Systolic Pressure [mmHg]');
xlim([40 180]);
ylim([75 125]);
title('Final Heart Rate v. Systolic Pressure Scatter');
disp('The new, adjusted data was placed into a scatterplot.');
















