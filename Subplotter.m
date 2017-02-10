%% This program creates subfigures out of all parts of a trial for easier comparison

% Load saved figures
c1=hgload('Records/rad_timc_0.00gy/atm.fig');
c2=hgload('Records/rad_timc_0.00gy/atr.fig');
c3=hgload('Records/rad_timc_0.00gy/chk1.fig');
c4=hgload('Records/rad_timc_0.00gy/chk2.fig');
c5=hgload('Records/rad_timc_0.00gy/cdc25a.fig');

c6=hgload('Records/rad_timc_0.01gy/atm.fig');
c7=hgload('Records/rad_timc_0.01gy/atr.fig');
c8=hgload('Records/rad_timc_0.01gy/chk1.fig');
c9=hgload('Records/rad_timc_0.01gy/chk2.fig');
c10=hgload('Records/rad_timc_0.01gy/cdc25a.fig');

c11=hgload('Records/rad_timc_0.02gy/atm.fig');
c12=hgload('Records/rad_timc_0.02gy/atr.fig');
c13=hgload('Records/rad_timc_0.02gy/chk1.fig');
c14=hgload('Records/rad_timc_0.02gy/chk2.fig');
c15=hgload('Records/rad_timc_0.02gy/cdc25a.fig');

c16=hgload('Records/rad_timc_0.05gy/atm.fig');
c17=hgload('Records/rad_timc_0.05gy/atr.fig');
c18=hgload('Records/rad_timc_0.05gy/chk1.fig');
c19=hgload('Records/rad_timc_0.05gy/chk2.fig');
c20=hgload('Records/rad_timc_0.05gy/cdc25a.fig');

c21=hgload('Records/rad_timc_0.10gy/atm.fig');
c22=hgload('Records/rad_timc_0.10gy/atr.fig');
c23=hgload('Records/rad_timc_0.10gy/chk1.fig');
c24=hgload('Records/rad_timc_0.10gy/chk2.fig');
c25=hgload('Records/rad_timc_0.10gy/cdc25a.fig');

c26=hgload('Records/rad_timc_0.50gy/atm.fig');
c27=hgload('Records/rad_timc_0.50gy/atr.fig');
c28=hgload('Records/rad_timc_0.50gy/chk1.fig');
c29=hgload('Records/rad_timc_0.50gy/chk2.fig');
c30=hgload('Records/rad_timc_0.50gy/cdc25a.fig');

c31=hgload('Records/rad_timc_1.00gy/atm.fig');
c32=hgload('Records/rad_timc_1.00gy/atr.fig');
c33=hgload('Records/rad_timc_1.00gy/chk1.fig');
c34=hgload('Records/rad_timc_1.00gy/chk2.fig');
c35=hgload('Records/rad_timc_1.00gy/cdc25a.fig');

% Prepare subplots
figure
for i=0:6
    h(i*5+1) = subplot(5,7,i+1);
    h(i*5+2) = subplot(5,7,i+8);
    h(i*5+3) = subplot(5,7,i+15);
    h(i*5+4) = subplot(5,7,i+22);
    h(i*5+5) = subplot(5,7,i+29);
end
% Paste figures on the subplots
copyobj(allchild(get(c1,'CurrentAxes')),h(1));
copyobj(allchild(get(c2,'CurrentAxes')),h(2));
copyobj(allchild(get(c3,'CurrentAxes')),h(3));
copyobj(allchild(get(c4,'CurrentAxes')),h(4));
copyobj(allchild(get(c5,'CurrentAxes')),h(5));
copyobj(allchild(get(c6,'CurrentAxes')),h(6));
copyobj(allchild(get(c7,'CurrentAxes')),h(7));
copyobj(allchild(get(c8,'CurrentAxes')),h(8));
copyobj(allchild(get(c9,'CurrentAxes')),h(9));
copyobj(allchild(get(c10,'CurrentAxes')),h(10));
copyobj(allchild(get(c11,'CurrentAxes')),h(11));
copyobj(allchild(get(c12,'CurrentAxes')),h(12));
copyobj(allchild(get(c13,'CurrentAxes')),h(13));
copyobj(allchild(get(c14,'CurrentAxes')),h(14));
copyobj(allchild(get(c15,'CurrentAxes')),h(15));
copyobj(allchild(get(c16,'CurrentAxes')),h(16));
copyobj(allchild(get(c17,'CurrentAxes')),h(17));
copyobj(allchild(get(c18,'CurrentAxes')),h(18));
copyobj(allchild(get(c19,'CurrentAxes')),h(19));
copyobj(allchild(get(c20,'CurrentAxes')),h(20));
copyobj(allchild(get(c21,'CurrentAxes')),h(21));
copyobj(allchild(get(c22,'CurrentAxes')),h(22));
copyobj(allchild(get(c23,'CurrentAxes')),h(23));
copyobj(allchild(get(c24,'CurrentAxes')),h(24));
copyobj(allchild(get(c25,'CurrentAxes')),h(25));
copyobj(allchild(get(c26,'CurrentAxes')),h(26));
copyobj(allchild(get(c27,'CurrentAxes')),h(27));
copyobj(allchild(get(c28,'CurrentAxes')),h(28));
copyobj(allchild(get(c29,'CurrentAxes')),h(29));
copyobj(allchild(get(c30,'CurrentAxes')),h(30));
copyobj(allchild(get(c31,'CurrentAxes')),h(31));
copyobj(allchild(get(c32,'CurrentAxes')),h(32));
copyobj(allchild(get(c33,'CurrentAxes')),h(33));
copyobj(allchild(get(c34,'CurrentAxes')),h(34));
copyobj(allchild(get(c35,'CurrentAxes')),h(35));
% Add legends
for i=1:7
    l((i-1)*5+1)=legend(h((i-1)*5+1),'ATM')
    l((i-1)*5+2)=legend(h((i-1)*5+2),'ATR')
    l((i-1)*5+3)=legend(h((i-1)*5+3),'CHK1','CHK1P')
    l((i-1)*5+4)=legend(h((i-1)*5+4),'CHK2','CHK2P')
    l((i-1)*5+5)=legend(h((i-1)*5+5),'CDC25A','CDC25AP')
end