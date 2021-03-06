%%Double QWOT Film on n=2.5-3.5 on germanium
% written for MATLAB 2014b
% generates reflectance plot over spectrum on a germanium substrate
% based on Jun Zhang's Thin Film Calculator, OptiScan

clear all
LambdaS = 2000; % start wavelength
LambdaE = 14000; % end wavelength
LambdaI = 4; % wavelength increment
Lambda0 = 4000; % monitor wavelength
Lambda = LambdaS - LambdaI;
x = 0;
y = 0;
z = 0; 
while Lambda < LambdaE
    Lambda = Lambda + LambdaI;
    g_Lambda = Lambda0 / Lambda;
    x = x + 1;
    xvalue2(x) = Lambda;
    z = z + 1;
    xvalue1(z) = g_Lambda;
    fr = 1; % number of quarter waves in each material
    Delta_g = (pi/2) * fr * g_Lambda;
    Eta_0 = 1.0; % refractive index - incident media
    Eta_l = 2.04; % refractive index - low 
    Eta_m = 3.2; % refractive index - medium
    Eta_h = 3.3; % refractive index - high
    Eta_s = 4.00; % refractive index - substrate - GERMANIUM
    M_1 = cos(Delta_g);
    M_2 = sin(Delta_g);
    L_g = [M_1 (M_2 / Eta_l)*1i ; M_2*1i*Eta_l M_1];
    H_g = [M_1 (M_2 / Eta_h)*1i ; M_2*1i*Eta_h M_1];
    M_g = [M_1 (M_2 / Eta_m)*1i ; M_2*1i*Eta_m M_1];
    X_g = L_g * M_g * [1.0; Eta_s];
    Y_g = X_g(2) / X_g(1);
    r_g = (Eta_0 - Y_g)/(Eta_0 + Y_g);
    c_g = conj(r_g);
    R_g = (r_g*c_g)*100;
    y = y + 1;
    yvalue(y) = R_g;
end
clf()
plot(xvalue1,yvalue)
title('Double QWOT Film: 4.0||n_x|2.04|1.0, n_x=3.2')
xlabel('g(lambda)')
ylabel('r(g)')
grid on
%% Profblem 6C - 3 QWOT Film: 4.0||3.2|2.04|n_y|1.0
clear all
LambdaS = 2000; % start wavelength
LambdaE = 14000; % end wavelength
LambdaI = 4; % wavelength increment
Lambda0 = 4000; % monitor wavelength
Lambda = LambdaS - LambdaI;
x = 0;
y = 0;
z = 0; 
while Lambda < LambdaE
    Lambda = Lambda + LambdaI;
    g_Lambda = Lambda0 / Lambda;
    x = x + 1;
    xvalue2(x) = Lambda;
    z = z + 1;
    xvalue1(z) = g_Lambda;
    fr = 1; % number of quarter waves in each material
    Delta_g = (pi/2) * fr * g_Lambda;
    Eta_0 = 1.0; % refractive index - incident media
    Eta_l = 1.8; % refractive index - low 
    Eta_m = 2.04; % refractive index - medium
    Eta_h = 3.2; % refractive index - high
    Eta_s = 4.00; % refractive index - substrate - GERMANIUM
    M_1 = cos(Delta_g);
    M_2 = sin(Delta_g);
    L_g = [M_1 (M_2 / Eta_l)*1i ; M_2*1i*Eta_l M_1];
    H_g = [M_1 (M_2 / Eta_h)*1i ; M_2*1i*Eta_h M_1];
    M_g = [M_1 (M_2 / Eta_m)*1i ; M_2*1i*Eta_m M_1];
    X_g = L_g * M_g * H_g * [1.0; Eta_s];
    Y_g = X_g(2) / X_g(1);
    r_g = (Eta_0 - Y_g)/(Eta_0 + Y_g);
    c_g = conj(r_g);
    R_g = (r_g*c_g)*100;
    y = y + 1;
    yvalue(y) = R_g;
end
clf()
plot(xvalue1,yvalue)
title('3 QWOT Film: 4.0||3.2|2.04|n_y=1.8|1.0')
xlabel('g(lambda)')
ylabel('r(g)')
grid on
