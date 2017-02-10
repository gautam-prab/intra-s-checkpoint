classdef Constants
   properties (Constant)
        % species name constants
        ATM = 1; % Phosphorylates Chk2
        ATR = 2; % Phosphorylates Chk1
        CHK2 = 3; % Non-phosphorylated Chk2
        CHK2P = 4; % Phosphorylates Cdc25a
        CHK1 = 5; % Non-phosphorylated Chk1
        CHK1P = 6; % Phosphorylates Cdc25a
        CDC25A = 7; % Non-phosphorylated Cdc25a
        CDC25AP = 8; % Phosphorylated Cdc25a

        % rate constants
        k1 = 1.0; % forward reaction for phosphorylation of CHK2 by ATM; assume same as k3
        k2 = 1.0; % reverse reaction for phosphorylation of CHK2 by ATM; assume same as k4
        k3 = 1.0; % forward reaction for phosphorylation of CHK1 by ATR; const. from Zhang et al. 2013 (for ATR->CHK1)
        k4 = 1.0; % reverse reaction for phosphorylation of CHK1 by ATR; const. from Zhang et al. 2013 (for ATR->CHK1)
        k5 = 0.01; % forward reaction for phosphorylation of CDC25A by CHK1P; const. from Zhang et al. 2013
        k6 = 0.01; % forward reaction for phosphorylation of CDC25A by CHK2P; assume same as k6
        k7 = 0.01; % reverse reaction for phosphorylation of CDC25A; const. from Zhang et al. 2013
        
        k_signal_deg = .01
   end
end