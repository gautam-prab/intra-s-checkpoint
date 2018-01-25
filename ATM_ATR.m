x = 0:.0001:.01;
names = cell(length(x),1);
for i = 1:length(x)
    names(i) = cellstr(strcat('ATM_ATR_',num2str(x(i),'%3.4f')));
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

% holds simulation output
sims = zeros(length(x),1);
conc = zeros(length(x),100,8);

for i = 1:length(x)
    initial_atm = ATM_fnc(5);
    initial_atr = ATR_fnc(5);
    
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
    
    k8 = x(i); % change constant ATM and ATR

    [m, c] = timecourse(1, names{i}, 'Records', 100, 0, concentrations, knockouts, k8);
    conc(i,:,:) = m(:,:);
    sims(i) = c;
end