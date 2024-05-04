{1.- a) Realizar un programa que lea desde teclado un número entero e imprima los dígitos
múltiplos de 3.
b) Modificar a) para informar el dígito más grande encontrado en el número.
c) Modificar a) para leer desde teclado 80 números enteros a los que se les deberá informar sus
dígitos pares.
d) Modificar a) para leer desde teclado números enteros hasta que se ingrese el número -1, el
cual no debe procesarse; para cada número debe informar sus dígitos pares.
e) Modificar a) para leer desde teclado números enteros hasta que se hayan procesado al
menos 100 dígitos (tenga en cuenta que el último número ingresado debe procesarse completo).}

program p2e1;
uses crt;
const
 finNum=80;
 finDig=100;
var
  n,original,mul3,dig,digMax,testA,testC,cantN,cantPar,cantDig:integer;
BEGIN
  digMax:=-1; 
  mul3:=0;
  cantN:=0;
  cantPar:=0;
  cantDig:=0;
  writeln('Ingrese un numero:');
  read(n);
  while(cantN<finNum)and(n<>-1)do begin
    repeat
    cantN:=cantN+1;
    original:=n;
    while(n<>0)do begin
      dig:=n mod 10;
      cantDig:=cantDig+1;
      testA:= dig mod 3;
      if(testA=0)then mul3:=mul3+1;
      if(dig>digMax)then digMax:=dig;
      testC:=dig mod 2;
      if(testC=0)then cantPar:=cantPar+1;
      n:=n div 10;
    end;
    writeln('La cantidad de digitos multiplos de 3 de ',original,' es ',mul3);
    writeln('El digito mas grande de ',original,' es ',digMax);
    writeln('La cantidad de digitos pares de ',original,' es ',cantPar);
    digMax:=-1; 
    mul3:=0;
    cantPar:=0;
    writeln('Ingrese un numero:');
    read(n);
    until(cantDig=finDig); 
  end;
  readkey;
END.  
