{a) Escribir un programa que lea una secuencia de caracteres terminada en punto ‘.’ e informe la
cantidad de caracteres leídos.
b) Ídem a), pero informando la cantidad de letras 'A' leídas.
c) Ídem a), pero informando la cantidad de letras 's' leídas seguidas por una letra 'a'.
Ejemplo: hJytsasv$&m@Tsad.
La cantidad de caracteres leídos es 16
La cantidad de letras A leídas es 0
La cantidad de letras s seguidas de una letra a es 2}

program p2e5;
uses crt;
var
 cantCar,cantA,cant_sa:integer;
 car,ant:char;
BEGIN
  cantCar:=0;
  cantA:=0;
  cant_sa:=0;
  writeln('Ingrese una secuencia de caracteres:');
  read(car);
  while(car<>'.')do begin
   ant:=car;
   cantCar:=cantCar+1;
   If(car='A')then cantA:=cantA+1;
   read(car);
   If(car='a') and (ant='s')then cant_sa:=cant_sa+1;
  end;
  writeln('La cantidad de caracteres leidos es: ',cantCar);
  writeln('La cantidad de letras A leidas es: ',cantA);
  writeln('La cantidad de letras s seguidas de una letra a es: ',cant_sa);
  readkey;
END.

