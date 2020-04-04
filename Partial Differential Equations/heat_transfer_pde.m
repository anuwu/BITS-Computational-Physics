

% using an explicit forward Euler method for the heat equation U_t = beta*U_xx
x1=0;
a = 1; % length of bar in x-direction
x2=a;

T = 12000; % length of time for solution

n = 39;   % no of grid points Xn. Basically x0 and x40 are the boundary points. Column vector has terms from x1 to x39.
m = 600;

dx = a/(n+1); % grid spacing in x direction

dt = T/m;

t=0; % initial time = 0

beta = 10^-5; % thermal diffusivity constant

s = beta*dt/(dx^2);  % gain parameter 

A = conv2(eye(n),[s (1-2*s) s],'same'); % creation of triadiagonal matrix A
% specify boundary conditions through vector b and by changing any rows in A matrix needed - for Neumann boundary conditions
 
% for Neumann boundary conditions at x = a:
A(n,n) = 1-s;

b= zeros(n,1);

% for Dirichlet boundary conditions at x=0: b[1] = s*g1(t_k)
% U(x=0, t) = 1.
b(1) = s*1;
% for Neumann boundary conditions at x = a: b[n] = s*dx*g2(t_k)
% U_x(x=a,t) = 2.
b(n) =  2*s*dx;
% b % check b is right too!

% set up mesh in x-direction:
x = linspace(x1+dx,x2-dx, n)';
% Set up vector U^0 at time tk=0: U(x,0) = f(x)
% using U(x,0) = 2*x + sin(2*pi*x) + 1
 
U_tk = 2*x + sin(2*pi*x) + 1 ;

figure(1)
plot (x,U_tk,'-')
title ('Initial condition for Temperature distribution')
xlabel ('x')
ylabel ('U')

% store solution for each time in matrix U(nxm):

U=zeros(n,m+1);
tvec=zeros(m+1,1);

U(:,1) = U_tk;
tvec(1) = t;

% now march solution forward in time using U_tk+1 = A*U_tk + b:

for k = 2:m+1
    t = t+dt;
    % if boundary conditions vary with time you need to update b here
    U_tk_1 = A*U_tk + b;    

    U(:,k) = U_tk_1;
 
    % for next time step:
    U_tk = U_tk_1;
    tvec(k) = t;
    
    plot(x , U_tk, '-') ;
    xlabel(['X and time = ' , num2str((k-1)*dt)]) ;
    ylabel('Temperature');
    xlim([0,1]);
    ylim([1,3]);
    drawnow ;

end

%{
figure(2)
mesh (tvec,x,U)
title ('Variation of Temperature distribution with time')
xlabel ('t')
ylabel ('x')
zlabel ('U')
%}
