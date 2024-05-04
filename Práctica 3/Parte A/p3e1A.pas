{Escriba un módulo que reciba un número entero y devuelva el dígito más grande que contiene
dicho número. Elija un nombre significativo para dicho módulo. Analice con sus compañeros y
justifiquen cuándo es conveniente utilizar una función o un procedimiento.}

program p3e1;
uses crt;
function digMax(n:integer):integer;
var
  dig,max:integer;
begin
  max:=-1;
  while(n<>0)do begin
  dig:=n mod 10;
  if (dig>max)then max:=dig;
  n:=n div 10;
  end;
  digMax:=max;
end;
var
  num:integer;
BEGIN
  writeln('Ingrese un numero:');
  read(num);
  writeln('El digito mas grande de ',num,' es ',digMax(num));
  readkey;
END.         
