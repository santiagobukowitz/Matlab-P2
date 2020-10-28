function [array] = MatrixToVector(DataSet,r,c)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
array = reshape(DataSet,[1,(r.*c)]);
output = array(1) + array(2) + array (3) + array(4) + array(5);
end

