function [angleAB] = SAM(A,B)

angleAB=acosd(dot(A,B)/(norm(A)*norm(B)));

end

