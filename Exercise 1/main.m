phi = pi/6; %initial angle 

R0 =    [1     0         0; 
         0 cos(phi) sin(phi);
         0 -sin(phi) cos(phi)]; %initial condition
     
tspan = [0 1000]; %timespan

y0 = reshape(R0, [9, 1]); %reshaping initial condition

%ODE solver
[T, Y] = ode45(@(y, t) dynamics(y, t), tspan, y0);

%Subplots
subplot(3, 3, 1); plot(T, Y(:,1)); title("(1,1)");
subplot(3, 3, 2); plot(T, Y(:,2)); title("(1,2)");
subplot(3, 3, 3); plot(T, Y(:,3)); title("(1,3)");
subplot(3, 3, 4); plot(T, Y(:,4)); title("(2,1)");
subplot(3, 3, 5); plot(T, Y(:,5)); title("(2,2)");
subplot(3, 3, 6); plot(T, Y(:,6)); title("(2,3)");
subplot(3, 3, 7); plot(T, Y(:,7)); title("(3,1)");
subplot(3, 3, 8); plot(T, Y(:,8)); title("(3,2)");
subplot(3, 3, 9); plot(T, Y(:,9)); title("(3,3)");

Z = reshape(Y, [509353, 3, 3]);
n = linspace(0, 1000, length(Z));

for a = [1 : length(Z)]
    det_arr(a) = det(reshape(Z(a, :, :), [[], 3,3]));
end

figure(2)
plot(n, det_arr);
