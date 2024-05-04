{Escriba un módulo que reciba un entero y retorne si es capicúa (mismo número de izquierda a
derecha que de derecha a izquierda).}

program p3e4;
uses crt;
function capicua(n:integer):boolean;
var
  orig,dig,inv:integer;
begin
  inv:=0;
  orig:=n;
  while(n<>0)do begin
    dig:=n mod 10;
    inv:=inv+dig;
    n:= n div 10;
    if(n<>0)then inv:=inv*10;
  end;
  writeln(inv);
  if(inv=orig)then capicua:=true
  else capicua:=false;
end;
var
  n:integer;
BEGIN
  writeln('Ingrese un numero:');
  readln(n);
  if(capicua(n))then writeln('El numero es capicua')
  else writeln('El numero no es capicua');
  readkey;	
END.
