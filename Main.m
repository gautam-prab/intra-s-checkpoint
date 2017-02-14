%% IntraS - kinetically modeling the intra-S phase DNA Damage Checkpoint
% By Gautam Prabhu

exp_mode = input('Experiment Mode? (0 for no 1 for yes): ');
if (exp_mode) 
    exp_title = input('Experiment title: ','s');
else
    exp_title = '';
end

directory = 'Records';

max_time = input('Enter time length: ') + 1; % extra 1 is time 0; since matlab starts matrices at 1

ATM_fnc = @(x) (0.0429 + 45.4628.*x - 62.0548.*x.^2 + 30.6344.*x.^3)/100; % derived in ATM_IR.m
initial_atm = ATM_fnc(input('Enter ionizing radiation in Gy: '));

% concentration vector
concentrations = zeros(max_time,8);
concentrations(1,Constants.ATM) = initial_atm;
concentrations(1,Constants.ATR) = 0;
concentrations(1,Constants.CHK1) = 10;
concentrations(1,Constants.CHK1P) = 0;
concentrations(1,Constants.CHK2) = 10;
concentrations(1,Constants.CHK2P) = 0;
concentrations(1,Constants.CDC25A) = 100;
concentrations(1,Constants.CDC25AP) = 0;

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

concentrations = concentrations .* knockouts;

timecourse(exp_mode, exp_title, directory, max_time, initial_atm, concentrations, knockouts);