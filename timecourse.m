function [] = timecourse(exp_mode, exp_title, directory, max_time, initial_atm, concentrations, knockouts)
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
end