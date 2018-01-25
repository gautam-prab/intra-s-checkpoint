function [concentrations, dna_synthesis] = easy_timecourse(radiation)
    ATM_fnc = @(x) (0.0429 + 45.4628.*x - 62.0548.*x.^2 + 30.6344.*x.^3)/200; % derived in ATM_IR.m
    ATR_fnc = @(x) (0.02914286*x+0.02);

    % knockout vector - 0 if KO 1 if non-KO
    knockouts = zeros(1,8);
    knockouts(1,Constants.ATM) = 1;
    knockouts(1,Constants.ATR) = 0;
    knockouts(1,Constants.CHK1) = 1;
    knockouts(1,Constants.CHK2) = 1;
    knockouts(1,Constants.CHK1P) = 1;
    knockouts(1,Constants.CHK2P) = 1;
    knockouts(1,Constants.CDC25A) = 1;
    knockouts(1,Constants.CDC25AP) = 1;

    initial_atm = ATM_fnc(radiation);
    initial_atr = ATR_fnc(radiation);

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
    
    [concentrations, dna_synthesis] = timecourse_nographs(0, 0, 'A', 100, 0, concentrations, knockouts, Constants.k_reg);
end