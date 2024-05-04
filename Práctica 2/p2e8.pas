{8.- a) Se lee una secuencia de caracteres que termina cuando se procesa el carácter número 500
o se ingresa el carácter 'z', el cual debe procesarse. Determinar la cantidad de palabras que
componen la secuencia.
b) Ídem a), pero calculando la cantidad de palabras que comienzan con ‘R’.
c) Ídem a) y b), pero calculando la cantidad de palabras que terminan con ‘T’.
d) Ídem a) a c), pero calculando la cantidad de palabras que comienzan con ‘R’ y terminan con
‘N’.
e) Ídem a) a d), pero calculando la cantidad de palabras que tienen menos de 6 caracteres y
exactamente dos ‘p‘.}

program p2e8;
uses crt;
const
  fin=5;
var
  cantCar,cantP:integer;
  car:char;
BEGIN
  cantCar:=0;
  cantP:=0;
  writeln('Ingrese una secuencia de caracteres:');
  read(car);
  repeat
   while(car=' ')do read(car);
   while(car<>' ')do read(car);
   cantP:=cantP+1;
  until(cantCar>=fin)or(car='z');
  writeln('La cantidad de palabras que componen la secuencia es ',cantP);
  readkey;
END.

