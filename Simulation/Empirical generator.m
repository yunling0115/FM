% Empirical distribution function
clear all; clc;
% Part a:
    y = LGM(10000);
    for i = 1:10000
        if (y(i)<0.5)||(y(i)==0.5)
            X(i) = -1;
        else if (y(i)<0.8)||(y(i)==0.8)
                X(i) = 0;
            else X(i) = 1;
            end
        end
    end
    display('See X for part a');
% Part b:
    % Histogram:
    x = -1:0.1:1;
    figure('Name','histogram of X');
    hist(X,x);
    % Empirical dist:
    x = -1.5:0.01:1.5;
    for i=1:length(x)
        z(i) = Empirical(X,x(i));
    end
    figure('Name','Empirical distribution function');
    plot(x,z,'-');
% End