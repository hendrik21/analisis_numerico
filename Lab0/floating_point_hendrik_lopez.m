%Programa para determinar el formato de coma flotante de un número decimal
%con 16 bits de precisión.
%Hendrik López     2170129
clc; clear;
%Se le pide al usuario que ponga un número
mensaje = 'Inserte el número decimal: ';
base_10 = input(mensaje);

%PASO 2: calcular el signo

signo_base_10 = sign(base_10);

if signo_base_10 == 1
    signo_base_2 = 0;
elseif signo_base_10 == -1
    signo_base_2 = 1;
elseif signo_base_10 == 0
    disp('El número en base 2 es igual a 0');
    pause;
end

if base_10 < 0 %para arreglar el error de que no detecta negativos
    base_10 = abs(base_10);
end

%PASO 1: Calcular el número en base 2

%Paso 1.1: Calcular la parte entera:

parte_entera_base_10 = fix(base_10);
parte_entera_base_2 = dec2base(parte_entera_base_10,2);
parte_entera_base_2= [str2num(parte_entera_base_2(:))];
parte_entera_base_2 = transpose(parte_entera_base_2);

%Paso 1.2: Calcular la parte decimal:

parte_decimal_base_10 = base_10 - parte_entera_base_10;
conversor = parte_decimal_base_10;

if conversor ~= 0 %Hace la conversión de la parte decimal, si la hay
    i = 1;
    parte_decimal_base_2 = zeros(1,1);
    while (conversor ~= 1)
        conversor = conversor*2;
        cifra = fix(conversor);
        parte_decimal_base_2(1,i) = cifra;
        if conversor > 1
            conversor = conversor - fix(conversor);
        end
        i = i+1;
    end
end

base_2 = horzcat(parte_entera_base_2, parte_decimal_base_2);

disp('La parte entera del número en base 2 es:');
disp(parte_entera_base_2);
disp('La parte decimal del número en base 2 es:');
disp(parte_decimal_base_2);
disp('El número convertido a base 2 es:');
disp(base_2);

disp('FORMATO DE PUNTO FLOTANTE:');

disp('El signo es:');
disp(signo_base_2);

%PASO 3: Calcular el exponente
 
%Paso 3.1: Calcular el bias

bits_exponente = 7;
bias = 2^(bits_exponente-1)-1;

%Hacer la suma y convertir el resultado a base 2

 i = length(parte_entera_base_2);
 exponente = 0;
 
 while i > 1
     i = i - 1;
     exponente = exponente +1;
 end
 
 exponente_base_10 = exponente + bias;
 exponente_base_2 = dec2base(exponente_base_10,2);
 exponente_base_2 = [str2num(exponente_base_2(:))];
 exponente_base_2 = transpose(exponente_base_2);
 
 disp('El exponente es:');
 disp(exponente_base_2);

%PASO 4: Calcular la mantisa en formato de coma flotante

mantisa = zeros(1,8);

%Paso 3.2: Hallar la mantisa

i = 1;
 while i < 9
     mantisa(1,i)= base_2(1,i+1);
     i=i+1;
 end
 
 disp('La mantisa es:');
 disp(mantisa);
 
 %PASO 5: Calcular error absoluto y relativo
 
 %Paso 5.1: Hallar el valor real almacenado
 
 parte_entera_base_2_conversion = num2str(parte_entera_base_2);
 parte_decimal_base_2_conversion = num2str(parte_decimal_base_2);
 
 parte_entera_base_10_conversion = bin2dec(parte_entera_base_2_conversion);
 parte_decimal_base_10_conversion = bin2dec(parte_decimal_base_2_conversion);
 
 while parte_decimal_base_10_conversion > 1
     parte_decimal_base_10_conversion = parte_decimal_base_10_conversion/10;
 end

 valor_real = parte_entera_base_10_conversion + parte_decimal_base_10_conversion;
 
disp('El valor real almacenado (en valor absoluto) es:');
disp(valor_real);
disp('El signo del valor real almacenado es:');
disp(signo_base_10);

%Paso 5.2: Calcular el error absoluto

error_absoluto = abs(base_10-valor_real);
disp('El error absoluto es:')
disp(error_absoluto);

%Paso 5.3: Calcular el error relativo

error_relativo = error_absoluto/abs(base_10);
disp('El error relativo es:');
disp(error_relativo);

