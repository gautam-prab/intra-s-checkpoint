
ATM_fnc = @(x) (0.0429 + 45.4628.*x - 62.0548.*x.^2 + 30.6344.*x.^3)/200; % derived in ATM_IR.m
ATR_fnc = @(x) (0.02914286*x+0.02);

% knockout vector - 0 if KO 1 if non-KO
knockouts_reg = zeros(1,8);
knockouts_reg(1,Constants.ATM) = 1;
knockouts_reg(1,Constants.ATR) = 1;
knockouts_reg(1,Constants.CHK1) = 1;
knockouts_reg(1,Constants.CHK2) = 1;
knockouts_reg(1,Constants.CHK1P) = 1;
knockouts_reg(1,Constants.CHK2P) = 1;
knockouts_reg(1,Constants.CDC25A) = 1;
knockouts_reg(1,Constants.CDC25AP) = 1;

k_reg = [1.0 1.0 1.0 1.0 0.01 0.01 0.01 0.0004 0.01];
k = k_reg;

%% K1 - K4

k1_x = 0:.1:2;
k1_results = zeros(length(k1_x),1);
k2_results = zeros(length(k1_x),1);
k3_results = zeros(length(k1_x),1);
k4_results = zeros(length(k1_x),1);

for i = 1:length(k1_x)
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
    
    k(1) = k1_x(i);
    
    [~,k1_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    k(2) = k1_x(i);
    
    [~,k2_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    k(3) = k1_x(i);
    
    [~,k3_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    k(4) = k1_x(i);
    
    [~,k4_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    
end

%% K5 - K7

k_x = 0:.001:.02;
k5_results = zeros(length(k_x),1);
k6_results = zeros(length(k_x),1);
k7_results = zeros(length(k_x),1);

for i = 1:length(k_x)
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
    
    k(5) = k_x(i);
    
    [~,k5_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    k(6) = k_x(i);
    
    [~,k6_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    k(7) = k_x(i);
    
    [~,k7_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    
end

%% K8

k_x = 0:.00001:.0008;
k8_results = zeros(length(k_x),1);

for i = 1:length(k_x)
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
    
    k(8) = k_x(i);
    
    [~,k8_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    
end

% K9

k_x = 0:.001:.02;
k9_results = zeros(length(k_x),1);

for i = 1:length(k_x)
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
    
    k(9) = k_x(i);
    
    [~,k9_results(i)] = timecourse_nographs(1, 'A', 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg, k);
    
    k = k_reg;
    
end