{ a) Escriba un módulo que reciba 2 números enteros i y n, y calcule la potencia enésima de i ( i n ).
b) Escriba un programa que invoque el módulo de a) para que calcule el cuadrado de un número i
( i^2 ), e l cubo de un número i ( i^3 ) y l a potencia enésima de 2 ( 2 ^n ).}

program p3e1B;
uses crt;
function potencia(n,i:integer):integer;
var
 p,pot:integer;
begin
 pot:=1;
 if(n<>0)then begin
 for p:= 1 to n do pot:=pot*i;
 end;
 potencia:=pot;
end;
var
  exp,base:integer;
BEGIN
  exp:=2;
  writeln('Ingrese una base de potencia:');
  read(base);
  writeln('La potencia cuadrada de ',base,' da ',potencia(exp,base));
  exp:=3;
  writeln('Ingrese una base de potencia:');
  read(base);
  writeln('La potencia cubica de ',base,' da ',potencia(exp,base));
  writeln('Ingrese un exponente:');
  read(exp);
  base:=2;
  writeln('La potencia de 2 elevado a la ',exp,' da ',potencia(exp,base));
  readkey;
END.

