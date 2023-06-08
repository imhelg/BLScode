function K = Kernel(X,Y,theta)
 
nx	= size(X,2);
ny	= size(Y,2);
K = zeros(nx,ny);
for i = 1:nx
for j = 1:ny
 K(i,j) = exp(-theta*(X(i)-Y(j))^2);
end
end




