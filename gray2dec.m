function dec = gray2dec(g)
bin(1) = g(1);
for i = 2 : length(g);
    x = xor(str2num(bin(i-1)), str2num(g(i)));
    bin(i) = num2str(x);
    base = 2.^(length(bin)-1:-1:0);
    dec = sum(base.*(bin-'0'));
 
end
