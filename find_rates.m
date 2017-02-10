function [rates] = find_rates(concentrations)
   
    rates = zeros(1,8);
    
    rates(Constants.ATM) = -1*Constants.k_signal_deg*concentrations(Constants.ATM);
    rates(Constants.ATR) = -1*Constants.k_signal_deg*concentrations(Constants.ATR);
    
    rates(Constants.CHK2P) = Constants.k1*concentrations(Constants.CHK2)*concentrations(Constants.ATM) - Constants.k2*concentrations(Constants.CHK2P);
    rates(Constants.CHK2) = Constants.k2*concentrations(Constants.CHK2P) - Constants.k1*concentrations(Constants.CHK2)*concentrations(Constants.ATM);
    
    rates(Constants.CHK1P) = Constants.k3*concentrations(Constants.CHK1)*concentrations(Constants.ATR) - Constants.k4*concentrations(Constants.CHK1P);
    rates(Constants.CHK1) = Constants.k4*concentrations(Constants.CHK1P) - Constants.k3*concentrations(Constants.CHK1)*concentrations(Constants.ATR);
    
    rates(Constants.CDC25AP) = Constants.k5*concentrations(Constants.CDC25A)*concentrations(Constants.CHK1P) + Constants.k6*concentrations(Constants.CDC25A)*concentrations(Constants.CHK2P) - Constants.k7*concentrations(Constants.CDC25AP);
    rates(Constants.CDC25A) = Constants.k7*concentrations(Constants.CDC25AP) - Constants.k5*concentrations(Constants.CDC25A)*concentrations(Constants.CHK1P) - Constants.k6*concentrations(Constants.CDC25A)*concentrations(Constants.CHK2P);
    
end