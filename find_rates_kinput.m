function [rates] = find_rates_kinput(concentrations,k)
    rates = zeros(1,8);
    
    rates(Constants.ATM) = -1*k(9)*concentrations(Constants.ATM);
    rates(Constants.ATR) = -1*k(9)*concentrations(Constants.ATR) + k(8)*concentrations(Constants.ATM);
    
    rates(Constants.CHK2P) = k(1)*concentrations(Constants.CHK2)*concentrations(Constants.ATM) - k(2)*concentrations(Constants.CHK2P);
    rates(Constants.CHK2) = k(2)*concentrations(Constants.CHK2P) - k(1)*concentrations(Constants.CHK2)*concentrations(Constants.ATM);
    
    rates(Constants.CHK1P) = k(3)*concentrations(Constants.CHK1)*concentrations(Constants.ATR) - k(4)*concentrations(Constants.CHK1P);
    rates(Constants.CHK1) = k(4)*concentrations(Constants.CHK1P) - k(3)*concentrations(Constants.CHK1)*concentrations(Constants.ATR);
    
    rates(Constants.CDC25AP) = k(5)*concentrations(Constants.CDC25A)*concentrations(Constants.CHK1P) + k(6)*concentrations(Constants.CDC25A)*concentrations(Constants.CHK2P) - k(7)*concentrations(Constants.CDC25AP);
    rates(Constants.CDC25A) = k(7)*concentrations(Constants.CDC25AP) - k(5)*concentrations(Constants.CDC25A)*concentrations(Constants.CHK1P) - k(6)*concentrations(Constants.CDC25A)*concentrations(Constants.CHK2P);
    
end