x = 0:.1:5;
names = cell(length(x)*6,1);
for i = 0:length(x)-1
    names(i*6+1) = cellstr(strcat('Knockout_Wild_',num2str(x(i+1),'%3.2f')));
    names(i*6+2) = cellstr(strcat('Knockout_ATM_',num2str(x(i+1),'%3.2f')));
    names(i*6+3) = cellstr(strcat('Knockout_ATR_',num2str(x(i+1),'%3.2f')));
    names(i*6+4) = cellstr(strcat('Knockout_CHK1_',num2str(x(i+1),'%3.2f')));
    names(i*6+5) = cellstr(strcat('Knockout_CHK2_',num2str(x(i+1),'%3.2f')));
end
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

knockouts_atm = zeros(1,8);
knockouts_atm(1,Constants.ATM) = 0;
knockouts_atm(1,Constants.ATR) = 1;
knockouts_atm(1,Constants.CHK1) = 1;
knockouts_atm(1,Constants.CHK2) = 1;
knockouts_atm(1,Constants.CHK1P) = 1;
knockouts_atm(1,Constants.CHK2P) = 1;
knockouts_atm(1,Constants.CDC25A) = 1;
knockouts_atm(1,Constants.CDC25AP) = 1;

knockouts_atr = zeros(1,8);
knockouts_atr(1,Constants.ATM) = 1;
knockouts_atr(1,Constants.ATR) = 0;
knockouts_atr(1,Constants.CHK1) = 1;
knockouts_atr(1,Constants.CHK2) = 1;
knockouts_atr(1,Constants.CHK1P) = 1;
knockouts_atr(1,Constants.CHK2P) = 1;
knockouts_atr(1,Constants.CDC25A) = 1;
knockouts_atr(1,Constants.CDC25AP) = 1;

knockouts_chk1 = zeros(1,8);
knockouts_chk1(1,Constants.ATM) = 1;
knockouts_chk1(1,Constants.ATR) = 1;
knockouts_chk1(1,Constants.CHK1) = 0;
knockouts_chk1(1,Constants.CHK2) = 1;
knockouts_chk1(1,Constants.CHK1P) = 1;
knockouts_chk1(1,Constants.CHK2P) = 1;
knockouts_chk1(1,Constants.CDC25A) = 1;
knockouts_chk1(1,Constants.CDC25AP) = 1;

knockouts_chk2 = zeros(1,8);
knockouts_chk2(1,Constants.ATM) = 1;
knockouts_chk2(1,Constants.ATR) = 1;
knockouts_chk2(1,Constants.CHK1) = 1;
knockouts_chk2(1,Constants.CHK2) = 0;
knockouts_chk2(1,Constants.CHK1P) = 1;
knockouts_chk2(1,Constants.CHK2P) = 1;
knockouts_chk2(1,Constants.CDC25A) = 1;
knockouts_chk2(1,Constants.CDC25AP) = 1;

reg_sol = zeros(length(x),1);
atm_sol = zeros(length(x),1);
atr_sol = zeros(length(x),1);
chk1_sol = zeros(length(x),1);
chk2_sol = zeros(length(x),1);

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
    
    [~,reg_sol(i)] = timecourse(1, names{(i-1)*6+1}, 'Records', 100, 0, concentrations .* knockouts_reg, knockouts_reg);
    [~,atm_sol(i)] = timecourse(1, names{(i-1)*6+2}, 'Records', 100, 0, concentrations .* knockouts_atm, knockouts_atm);
    [~,atr_sol(i)] = timecourse(1, names{(i-1)*6+3}, 'Records', 100, 0, concentrations .* knockouts_atr, knockouts_atr);
    [~,chk1_sol(i)] = timecourse(1, names{(i-1)*6+4}, 'Records', 100, 0, concentrations .* knockouts_chk1, knockouts_chk1);
    [~,chk2_sol(i)] = timecourse(1, names{(i-1)*6+5}, 'Records', 100, 0, concentrations .* knockouts_chk2, knockouts_chk2);
end