clc;
clear;
close all;

x = [1;1;1];

fun1 = @(x1)(x1.^3 + 2*x1*x2 - cos(x3));
fun2 = @(x2)(sin(x1)+x2^2-x3-6);
fun3 = @(x3)(x1^2-2*x2 + x3);

F = {fun1,fun2,fun3};

myjacobian(F,x,0.001);

