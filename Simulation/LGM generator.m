% LGM generator
clear all; clc;
% Part a:
    % Generator:
    y = LGM(10000);
    % Draw the histogram
    x = 0:0.05:1;
    figure('Name','histogram of LGM generator');
    hist(y,x);
    display('See y for part a');
% Part b:
    % Generator:
    z = rand(1,10000);
    % Draw the histogram
    figure('Name','histogram of built-in generator');
    hist(z,x);
    display('See z for part b');
% Part c;
    % Compare the histogram (201 columns)
    [n1,x1] = hist(y,201);
    [n2,x2] = hist(z,201);
    n = n2-n1;
    figure('Name','Comparison')
    subplot(2,2,1);
    hist(y,x);
    subplot(2,2,2);
    hist(z,x);
    subplot(2,2,3:4);
    plot(n);
% End
