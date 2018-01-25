function [concentrations, dna_synthesis] = timecourse_nographs(~, ~, ~, max_time, ~, concentrations, knockouts,k)
    %% time series

    for t = 2:max_time
        concentrations(t,:) = rk4_kinput(t-1,t,concentrations(t-1,:),1000,k) .* knockouts;
        for i = 1:8
            if (concentrations(t,i) < 0 || isnan(concentrations(t,i))) % concentrations should never go below zero
                concentrations(t,i) = 0;
            end
        end
    end
    
    %% Calculate final DNA Synthesis based on the Simulation Endpoint (Currently CDC25A)
    cdc25a_final = concentrations(max_time-1,Constants.CDC25A);
    dna_synthesis = 54.97*(1-exp(-0.0308*cdc25a_final))+48.08;
    disp(['DNA Synthesis %: ' num2str(dna_synthesis)])
    
end