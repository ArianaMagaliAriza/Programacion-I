{a) El factorial de un número n se expresa como n! y se define como el producto de todos los
números desde 1 hasta n. Por ejemplo, el factorial de 6 o 6! equivale a 6*5! que a 1*2*3*4*5*6 que
equivale a 720. Escriba una función que reciba un número n y retorne su factorial.
b) Un número combinatorio (m,n) expresa todas las combinaciones de m elementos agrupados de a
n grupos. La expresión numérica de un número combinatorio es la siguiente:
( m n ) =    m! / (m − n)! ∗ n!
Utilizando la función factorial, escriba una función que calcule el número combinatorio (m, n).}

program p3e2B;
uses crt;
function combinatoria(m,n:integer):integer;
function factorial(n:integer):integer;
var
  fac:integer;
begin
  fac:=1;
  while(n<>1)do begin
  fac:=fac*n;
  n:=n-1;
  end;
  factorial:=fac;
end;
var
  i:integer;
  com:integer;
begin
  i:=m-n;
  com:=factorial(m)div(factorial(i)*factorial(n));
  combinatoria:=com;
end;
var
  m,n:integer;
BEGIN
  writeln('Ingrese un valor para "m":');
  read(m); 
  writeln('Ingrese un valor para "n":');
  read(n);
  writeln('El numero combinatorio (',m,',',n,') da ',combinatoria(m,n));
  readkey;
END.

