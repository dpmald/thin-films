%% Broadband AR Coating
% written for MATLAB 2014b
% generates reflection plot over specified wavelength range
% First part uses only 2 contrasting index materials, part 2 uses 3.

clear all;
close all;
um = 1e-6;
nm = 1e-9;

Air = 1;                % define admittance for medium
yM = 1.7;
yL = 1.38;
Glass = 1.52;

lambda_f = 600*nm;      % define the reference wavelength and thickness
dM = lambda_f/4/yM;     % quarter stack
dL = lambda_f/4/yL;

lambda = linspace(400,800,401)*nm;            % define visible region of light

% define thin film structure
y_inc = Air;                                  % incident medium admittance
y_sub = Glass;                                % substrate medium admittance
theta = 0; % in degree
d = [dL,dM];
y = [yL,yM];
for ii=1:length(lambda),
 [rho(ii),tao(ii),R(ii),T(ii)] = multilayer_s(d,y,y_inc,y_sub,lambda(ii),theta);
end

% Reflection percent vs wavelength plot
figure, plot(lambda/nm,R*100,'-k','LineWidth',3);
title('Problem 7A - Broadband Anti-Reflection Coating');
xlabel('Wavelength(nm)');
ylabel('Reflectance(%)');
axis([350 850 0 10]);
grid on;

%% Broadband AR Coating, Cont.
% now uses an additional high index material

clear all;
close all;
um = 1e-6;
nm = 1e-9;
% define admittance for medium
Air = 1;
yH = 1.9;
yM = 1.7;
yL = 1.38;
Glass = 1.52;
% define the reference wavelength and thickness
lambda_f = 550*nm;
dM = lambda_f/4/yM; % quarter stack
dL = lambda_f/4/yL;
dH = lambda_f/2/yH; % half wave stack
% define visible region of light
lambda = linspace(400,800,401)*nm;
% define thin film structure
y_inc = Air; % incident medium admittance
y_sub = Glass; % substrate medium admittance
theta = 0; % in degree
d = [dL,dH,dM];
y = [yL,yH,yM];
for ii=1:length(lambda),
 [rho(ii),tao(ii),R(ii),T(ii)] = multilayer_s(d,y,y_inc,y_sub,lambda(ii),theta);
end
% plot 
figure, plot(lambda/nm,R*100,'-k','LineWidth',3);
title('Problem 7B - Broadband AR Coating, n_H=1.9, lambda_0=550nm');
xlabel('Wavelength(nm)');
ylabel('Reflectance(%)');
axis([350 850 0 10]);
grid on;
