{a) Escriba un procedimiento que lea el peso de una cantidad de personas y devuelva el promedio
de estos. La cantidad de personas se recibe como parámetro.
b) Escriba un programa que procese el peso de 25 personas utilizando el módulo desarrollado en a)
e informe el resultado.}

program p3e7;
uses crt;
procedure promedio(cantP:integer;var prom:real);
var
  i:integer;
  peso,suma:real;
begin
  suma:=0;
  for i:= 1 to cantP do begin
    writeln('Ingrese el peso:');
	read(peso);
    suma:=suma+peso;
	end;
  prom:=suma/cantP;
end;
var
  cantP:integer;
  prom:real;
BEGIN
  prom:=0;  
  writeln('Ingrese la cantidad de personas:');
  read(cantP);
  promedio(cantP,prom);
  writeln('El peso promedio es de ',prom,' kg');
  readkey;
END.

