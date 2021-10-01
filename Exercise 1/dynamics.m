function [dRdt] = dynamics(t, y)

    R_temp = reshape(y, [3,3]);

    Omega = [100; 0; 0];
    
    O_hat = [   0    -Omega(3)   Omega(2); 
         Omega(3)   0        -Omega(1);
        -Omega(2) Omega(1)      0;];
    
    dRdt = reshape(R_temp*O_hat, [9,1]);
end
