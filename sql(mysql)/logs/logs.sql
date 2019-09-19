-- show File : mysql-bin 
show binary logs;

-- show event logs details(master)
show binary event in 'mysql-bin.00000x';

-- show relaylog (salve)
show relaylog events;

