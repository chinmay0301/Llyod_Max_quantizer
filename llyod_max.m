


function [v,m,x,er] = llyod_max(levels,max_l,min_l,mu,sigma)



digits(50);
variance = sigma*sigma;
v = zeros(levels,1);
for i = 1:levels
    v(i) = i/10;   %Can be any initialization 
end 
m = zeros(levels+1,1);
m(1) = min_l;
m(levels+1) = max_l;
%generating pdfs for finding the expectation of the variable
pdf_gaussian = @(x) (1/sqrt(2*pi*variance)).*exp(-(x-mu).^2/(2*variance));
mean_gaussian = @(x) x.*(1/sqrt(2*pi*variance)).*exp(-(x-mu).^2/(2*variance));
 

err = 5; %Random value of error 
num_it = 0;
while(err > 10^(-12))
    num_it = num_it +1;
    v_old = v; 
    
    for i = 2:levels
        m(i) = (v(i-1) + v(i))/2; 
    end
    
    for i = 1:levels
        v(i) = integral(mean_gaussian,m(i),m(i+1))/integral(pdf_gaussian,m(i),m(i+1));
    end
    
    err = sqrt(sum((v-v_old).^2));
    er(num_it) = err; 
    
end

    x = 1:1:num_it;
    
end         
    
    

