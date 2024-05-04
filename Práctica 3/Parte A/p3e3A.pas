{Escriba un módulo Max4 que reciba cuatro enteros y retorne el mayor:
a) Implemente con una función.
b) Implemente la función Max, que recibe 2 enteros y retorna el mayor, y re-implemente la
función de a) utilizando Max.
c) Compare y reflexione acerca de las implementaciones de a) y b). Piense en la modularidad,
la expresividad y la legibilidad.}

program p3e3;
uses crt;
function Max2(n,m:integer):integer;
var
  max:integer;
begin
  if(n>m)then max:=n
  else if (m>=n)then max:=m;
  Max2:=max;
end;
function Max4(a,b,c,d:integer):integer;
var
 z,x:integer;
begin
  z:=Max2(a,b);
  x:=Max2(c,d);
  Max4:=Max2(z,x);
end;

var
  a,b,c,d:integer;
BEGIN
  writeln('Ingrese un numero:');
  readln(a);
  writeln('Ingrese un numero:');
  readln(b);
  writeln('Ingrese un numero:');
  readln(c);
  writeln('Ingrese un numero:');
  readln(d);
  writeln('El maximo entre ',a,', ',b,', ',c,' y ',d,' es ',Max4(a,b,c,d));
END.

