atrs = 0:.1:10; % possible values for ATR
names = cell(length(atrs),1);
for i = 1:length(atrs)
    names(i) = cellstr(strcat('ATR_',num2str(atrs(i),'%1.1f')));
end

% knockout vector - 0 if KO 1 if non-KO
knockouts = zeros(1,8);
knockouts(1,Constants.ATM) = 0; % ATM is knocked out so we just look at ATR
knockouts(1,Constants.ATR) = 1;
knockouts(1,Constants.CHK1) = 1;
knockouts(1,Constants.CHK2) = 1;
knockouts(1,Constants.CHK1P) = 1;
knockouts(1,Constants.CHK2P) = 1;
knockouts(1,Constants.CDC25A) = 1;
knockouts(1,Constants.CDC25AP) = 1;

% holds simulation output
syn_percents = zeros(length(atrs),1);

for i = 1:length(atrs)
    initial_atr = atrs(i);
    
    % concentration vector
    concentrations = zeros(100,8);
    concentrations(1,Constants.ATM) = 0;
    concentrations(1,Constants.ATR) = initial_atr;
    concentrations(1,Constants.CHK1) = 10;
    concentrations(1,Constants.CHK1P) = 0;
    concentrations(1,Constants.CHK2) = 10;
    concentrations(1,Constants.CHK2P) = 0;
    concentrations(1,Constants.CDC25A) = 100;
    concentrations(1,Constants.CDC25AP) = 0;

    concentrations = concentrations .* knockouts;

    [~,c] = timecourse(1, names{i}, 'Records', 100, 0, concentrations, knockouts);
    syn_percents(i) = c;
end