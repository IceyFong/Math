clear;
func1 = @(x) 2*x;
func2 = @(x) 2-2*x;

n = 20;
h = 1/n;
k = (0.5)*(h^2);
xi = 0;
xf = 1;
m = 15;
U = finitedifference(func1,func2,n,m,h,k,xi,xf);

        
