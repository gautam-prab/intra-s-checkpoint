x = [0 .01 .05 .1 .5 1 5];
names = cell(length(x),1);
for i = 1:length(x)
    names(i) = cellstr(strcat('rad_timc_new_',num2str(x(i),'%3.2f')));
end
ATM_fnc = @(x) (0.0429 + 45.4628.*x - 62.0548.*x.^2 + 30.6344.*x.^3)/200; % derived in ATM_IR.m
ATR_fnc = @(x) (0.02914286*x+0.02);

% knockout vector - 0 if KO 1 if non-KO
knockouts = zeros(1,8);
knockouts(1,Constants.ATM) = 1;
knockouts(1,Constants.ATR) = 1;
knockouts(1,Constants.CHK1) = 1;
knockouts(1,Constants.CHK2) = 1;
knockouts(1,Constants.CHK1P) = 1;
knockouts(1,Constants.CHK2P) = 1;
knockouts(1,Constants.CDC25A) = 1;
knockouts(1,Constants.CDC25AP) = 1;

for i = 1:length(x)
    initial_atm = ATM_fnc(x(i));
    initial_atr = ATR_fnc(x(i));
    
    % concentration vector
    concentrations = zeros(100,8);
    concentrations(1,Constants.ATM) = initial_atm;
    concentrations(1,Constants.ATR) = initial_atr;
    concentrations(1,Constants.CHK1) = 10;
    concentrations(1,Constants.CHK1P) = 0;
    concentrations(1,Constants.CHK2) = 10;
    concentrations(1,Constants.CHK2P) = 0;
    concentrations(1,Constants.CDC25A) = 100;
    concentrations(1,Constants.CDC25AP) = 0;

    concentrations = concentrations .* knockouts;
    
    timecourse(1, names{i}, 'Records', 100, 0, concentrations, knockouts);
end