{6-Escribir un programa que lea una secuencia de caracteres terminada en punto ‘.’ y determine la
cantidad de veces que aparece una ‘a’ seguida de una ‘e’ o viceversa.}

program p2e6;
uses crt;
const
  fin='.';
var
  cant_ae,cant_ea:integer;
  car,ant:char;
BEGIN
  cant_ae:=0;
  cant_ea:=0;
  writeln('Ingrese una secuencia de caracteres:');
  readln(car);
  while(car<>fin)do begin 
    ant:=car;
    readln(car);
    if(ant='a')and(car='e')then cant_ae:=cant_ae+1;
    if(ant='e')and(car='a')then cant_ea:=cant_ea+1;
	end;
  writeln('La cantidad de letras a seguidas de la letra e es ',cant_ae);
  writeln('La cantidad de letras e seguidas de la letra a es ',cant_ea);
  readkey;
END.

