%Programa para calcular las raices cuadradas de una ecuación de la forma
%ax^2+bx+x=0, donde a != 0 y b^2-4ac > 0
%Hendrik López     2170129
clc; clear;
%Se le pide al usuario que ingrese los valores de a,b y c
mensaje_a = 'Ingrese el valor de a:';
a = input(mensaje_a);
mensaje_b = 'Ingrese el valor de b:';
b = input(mensaje_b);
mensaje_c = 'Ingrese el valor de c:';
c = input(mensaje_c);

excluyente = b^(2)-4*a*c;

%El algoritmo se detendrá si a = 0 o si b^2-4ac <= 0

if a == 0
    disp('No es una ecuación cuadrática.');
    pause;
end

if excluyente < 0
    disp('x no pertenece a los reales');
elseif excluyente == 0
    x = (-2*c)/b;
    disp('x1 y x2 son iguales y su valor es:');
    disp(x);
elseif excluyente > 0
    raiz = sqrt(excluyente);
    x1 = (-2*c)/(b+raiz);
    x2 = (-2*c)/(b-raiz);
    disp('El valor de x1 es:');
    disp(x1);
    disp('El valor de x2 es:');
    disp(x2);
end
   
