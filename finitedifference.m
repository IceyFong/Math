function [ U ] = finitedifference(func1,func2, n,m,h,k,xi,xf )
v = k/(h^2);        
U = zeros(n+1, m+1);    %set up the 2D array
U(1,:) = 0;             %set up the boundary conditions
U(2,:) = 0;
xa = zeros(1,n+1);
xa(1) = xi;             
xa(n+1) = xf;
vec = zeros(1,n+1);
%set up the x-axis
for g = 1:n-1      
    xa(g+1) = xa(g)+h;
end
%calculate and insert initial conditions into array
for g = 1:n+1
    if xa(g)<= 0.5 
        U(g,1) = feval(func1,xa(g));
    else  xa(g)> 0.5  
        U(g,1) = feval(func2,xa(g));
    end  
end
%finite difference algorithm
for i = 1 : m
    for j = 2 : n
        U(j,i+1)= v*U(j+1,i) + (1-2*v)*U(j,i) + v*U(j-1,i);
    end
end
%plot the graph
figure
for i = 1:m+1
    for j = 1:n+1
        vec(j) = U(j, i);
    end
    plot(xa, vec, '.');
    hold on
end

end

