{a) Implemente un módulo que permita imprimir los últimos dígitos de un número en orden inverso.
El módulo debe recibir el numero y la cantidad de dígitos a imprimir.
 b) Escriba un programa que lea números enteros por teclado hasta que llegue el número 0. Utilice
el módulo implementado en a) para imprimir los últimos 3 y 5 dígitos de cada número ingresado.}

program p3e5;
uses crt;
function ultDig(n,cantD:integer):integer;
var
  dig,cant,inv:integer;
begin
  inv:=0;
  cant:=0;
  while(n<>0)and(cant<>cantD)do begin
  dig:=n mod 10;
  inv:=inv*10;
  inv:=inv+dig;
  n:=n div 10;
  cant:=cant+1;
  end;
  ultDig:=inv;
end;
var
  num,cantDig:integer;
BEGIN
  writeln('Ingrese un numero:');
  read(num);
  while(num<>0)do begin
  cantDig:=3;
  writeln('Los ultimos tres digitos del inverso de ',num,' son ',ultDig(num,cantDig));
  cantDig:=5;
  writeln('Los ultimos cinco digitos del inverso de ',num,' son ',ultDig(num,cantDig));
  writeln('Ingrese un numero:');
  read(num);
  end;
  readkey;
END.

