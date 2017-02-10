% Data from Suzuki et al. 2006
x = [0, 0.01, 0.02, 0.04, 0.1, 0.5, 1]; % amount of ionizing radiation (X-Rays) in Gy
y = [0.1, 0.3, 0.9, 1.5, 4, 11, 14]; % number of ATM focis

scatter(x,y) 
set(gca,'xscale','log','yscale','log');
hold on;
fplot(@(x) 0.0429 + 45.4628.*x - 62.0548.*x.^2 + 30.6344.*x.^3) % approximation of data using a cubic polynomial

% we need to convert ATM focis to ATM concentration units
% we assume that at x = 0, y = 1 "concentration unit", so we multiply overall equation by 10
% [ATM] = 0.429 + 454.628x - 620.548x^2 + 306.344x^3