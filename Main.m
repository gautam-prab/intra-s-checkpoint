%% IntraS - kinetically modeling the intra-S phase DNA Damage Checkpoint
% By Gautam Prabhu

exp_mode = input('Experiment Mode? (0 for no 1 for yes): ');
if (exp_mode) 
    exp_title = input('Experiment title: ','s');
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

%% time series

for t = 2:max_time
    concentrations(t,:) = rk4(t-1,t,concentrations(t-1,:),100) .* knockouts;
    for i = 1:8
        if (concentrations(t,i) < 0 || isnan(concentrations(t,i))) % concentrations should never go below zero
            concentrations(t,i) = 0;
        end
    end
end

figure(1)
plot(0:max_time-1, concentrations(:,Constants.ATM), 'Color','blue', 'LineWidth',2)
legend('ATM')
xlabel('Time Steps')
ylabel('Concentration')
title('ATM Concentration over Time')
axis([0 max_time-1 0 initial_atm])

figure(2)
plot(0:max_time-1, concentrations(:,Constants.ATR), 'Color','red', 'LineWidth',2)
legend('ATR')
xlabel('Time Steps')
ylabel('Concentration')
title('ATR Concentration over Time')
axis([0 max_time-1 0 20])

figure(3)
plot(0:max_time-1, concentrations(:,Constants.CHK1), 'Color',[1 .6 0], 'LineWidth',2)
hold on;
plot(0:max_time-1, concentrations(:,Constants.CHK1P), 'Color','yellow', 'LineWidth',2)
legend('CHK1','CHK1P')
xlabel('Time Steps')
ylabel('Concentration')
title('CHK1 Phosphorylation over Time')
axis([0 max_time-1 0 10])

figure(4)
plot(0:max_time-1, concentrations(:,Constants.CHK2), 'Color',[.5 0 .5], 'LineWidth',2)
hold on;
plot(0:max_time-1, concentrations(:,Constants.CHK2P), 'Color',[0 0 .5], 'LineWidth',2)
legend('CHK2','CHK2P')
xlabel('Time Steps')
ylabel('Concentration')
title('CHK2 Phosphorylation over Time')
axis([0 max_time-1 0 10])

figure(5)
plot(0:max_time-1, concentrations(:,Constants.CDC25A), 'Color',[.54 .27 .074], 'LineWidth',2)
hold on;
plot(0:max_time-1, concentrations(:,Constants.CDC25AP), 'Color',[.5 .5 .5], 'LineWidth',2)
legend('CDC25A','CDC25AP')
xlabel('Time Steps')
ylabel('Concentration')
title('CDC25A Phosphorylation over Time')
axis([0 max_time-1 0 100])

if (exp_mode)
    mkdir(directory,exp_title)
    savefig(figure(1), sprintf('%s/%s/atm.fig', directory, exp_title))
    savefig(figure(2), sprintf('%s/%s/atr.fig', directory, exp_title))
    savefig(figure(3), sprintf('%s/%s/chk1.fig', directory, exp_title))
    savefig(figure(4), sprintf('%s/%s/chk2.fig', directory, exp_title))
    savefig(figure(5), sprintf('%s/%s/cdc25a.fig', directory, exp_title))
end