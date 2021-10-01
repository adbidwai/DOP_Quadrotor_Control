clc;
clear all;

phi = pi/6;

R0 =    [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)]; %initial condition
     
t_min = 0; t_max = 10; % minimum and maximum time limits

T(1) = t_min;

num_of_iterations = 100000

delta_t = (t_max - t_min)/num_of_iterations

Omega = [10; 0; 0];
    
O_hat = [   0       -Omega(3)    Omega(2); 
         Omega(3)       0       -Omega(1);
        -Omega(2)    Omega(1)       0    ;];
     
Y(1, :) = reshape(R0, [9, 1]);

for a=[2:num_of_iterations]
    R_k = reshape(Y(a-1, :), [3,3]);
    R_kp = R_k*expm(O_hat*delta_t);
    Y(a, :) = reshape(R_kp, [9,1]);
    T(a) = T(a-1) + delta_t;
end

subplot(3, 3, 1); plot(T, Y(:,1)); title("(1,1)");
subplot(3, 3, 2); plot(T, Y(:,2)); title("(1,2)");
subplot(3, 3, 3); plot(T, Y(:,3)); title("(1,3)");
subplot(3, 3, 4); plot(T, Y(:,4)); title("(2,1)");
subplot(3, 3, 5); plot(T, Y(:,5)); title("(2,2)");
subplot(3, 3, 6); plot(T, Y(:,6)); title("(2,3)");
subplot(3, 3, 7); plot(T, Y(:,7)); title("(3,1)");
subplot(3, 3, 8); plot(T, Y(:,8)); title("(3,2)");
subplot(3, 3, 9); plot(T, Y(:,9)); title("(3,3)");


Z = reshape(Y, [100000, 3, 3]);
n = linspace(0, 1000, length(Z));
% 
for a = [1 : length(Z)]
    det_arr(a) = det(reshape(Z(a, :, :), [[], 3,3]));
end

figure(2)
plot(n, det_arr);
xlim([0 2])
