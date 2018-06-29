%-----------------------------------------------------------------------
% Dateiname: Handrechnung.m
% Autor: Luca Mazzoleni
% Beschreibung: Handrechnung zur FEM-Analyse Clip
%-----------------------------------------------------------------------
clear;
%% Gegeben
ri = 12;                %Innenradius
ra= 16;                 %Aussenradius
b=48;                   %Breite

lr=[0.1,0.2,0.3,0.4,0.5,0.6];
k=[1.006,1.025,1.058,1.109,1.183,1.293];
ki= interp1(lr,k,(l/r)); 

% Mb =-F*r*sin(phi);
Mb =-F*r*(cos(phi0)-cos(phi));
% fun = @(phi) Mb*r*(diff(Mb,F));
F=solve(Vy == 1/(E*Is)*int(Mb*r*(diff(Mb,F)),phi0,phi1),F);
Fe=double(F)
