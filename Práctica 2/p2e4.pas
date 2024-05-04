{ 4.- Escriba un programa que lea de teclado un número entero e imprima el número resultante de
invertir la posición de todos sus dígitos. Por ejemplo, si se lee el número 1234 deberá imprimirse en
pantalla el número 4321.}

program p2e4;
uses crt;
var
  num,res,dig:integer; 
BEGIN
  writeln('Ingrese numero:');
  read(num);
  res:=0;
  while(num<>0)do begin
    dig:=num mod 10;
    res:=res*10;
    res:=res+dig;
    num:=num div 10;
    end;
	writeln('el numero revertido es:',res);
END.

