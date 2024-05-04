{Realizar un programa que lea por teclado la cantidad de ciudades de cada uno de los 135 partidos
de la provincia de Buenos Aires. Además, por cada ciudad debe leer la cantidad de habitantes.
Adicionalmente, se pide:
a) Informar la cantidad promedio de habitantes por partido.
b) Modificar el inciso a) agregando las instrucciones necesarias para informar el menor y mayor
número de habitantes promedio de los partidos.
c) Modificar b) para que además se informe el porcentaje de partidos cuyo valor promedio de
habitantes superó los 10.000}

program p1e2;
const
  partido=135;
  limite=10000;
var
  cantC,cantH,P,C:integer;
  porcentaje,promH,promMax,promMin:real;
BEGIN
  porcentaje:=0;
  promH:=0;
  promMax:=0;
  promMin:=99999;
  for P:= 1 to partido do
  begin
    readln(cantC);
    for C:= 1 to cantC do
    begin
      readln(cantH);
      promH:=promH+cantH;
    end;
    promH:=promH/cantC;
    writeln('El promedio de habitantes del partido ',P,' es de ',promH,' habitantes');
    if(promH>promMax)then promMax:=promH;
    if(promH<promMin)then promMin:=promH;
    if(promH>limite)then porcentaje:=porcentaje+1;
    promH:=0;
  end;
  porcentaje:=(porcentaje*100)/partido;
  writeln('El menor promedio de número de habitantes es ',promMin);
  writeln('El mayor promedio de número de habitantes es ',promMax);
  writeln('El porcentaje de partidos cuyo promedio de habitantes supero los 10000 es de ',porcentaje,' %')
END.

