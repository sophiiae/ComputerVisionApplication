clear all
clc
close all
 
% L = [1 3 6 4 3; 2 -1 4 -1 -10; 5 10 -4 20 -11];
%  L = [1 3 6 ; 2 -1 4 ; 5 10 -20];
% L = randi([-20, 20], 3, 5);

%  L = [-1 0 0; 0 1 -1; 0 -1 0];
L = [-1 2 3; 1 1 -1; 4 -1 5];
[r,n] = size(L);
% 
x = -5 : 5;

a = L(1,:);
b = L(2,:);
c = L(3,:);

%plot lines
for l = 1:n
    y = - (a(1,l) * x + c(1,l)) / b(1,l);
    plot(x,y);axis equal;
    axis([-5 10 -5 10]);
    hold on
end

dn = L(3,:);        %ci
un = sqrt(sum(L(1:2,:) .^ 2));  %sqrt(ai^2 + bi^2) 
di = abs(dn ./ un);

ni = L(1:2,:);

% for nd = 1: n
%     if L(3,nd) * L(2,nd) > 0
%         ni(:,nd) = ni(:,nd) * -1;
%     end
% end

for k = 1: n
    if L(3,k) > 0
        ni(:,k) = ni(:,k) * -1;
    end
end

for nl = 1:n
    plot([0 ni(1,nl)], [0 ni(2,nl)], 'k');
    axis equal; grid on;
end

A = ni * ni';      % 2 x 2 matrix
part1 = inv(A);       % A inverse

M = zeros(2,n);
for k = 1:n
    M(:,k) = di(1,k) * ni(:,k); 
end
part2 = sum(M,2);
    % sum of d and normal (2 x 1)
x = part1 * part2;

scatter(x(1,1),x(2,1));
