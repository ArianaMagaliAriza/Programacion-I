{ Se desea procesar la información de alumnos de diez carreras universitarias. Por cada carrera se
ingresa su código y cantidad de años de duración. Para cada año correspondiente a la duración de
la carrera, se ingresa la cantidad de alumnos que cursa. Realizar un programa que lea por teclado e
informe la carrera que tiene el menor promedio de alumnos de sus años.}

program p1e3;
const
  carrera=10;
var
  c,a,codigo,anios,alumnos,CMin:integer;
  promedio,promMIn:real;
BEGIN
  promMin:=9999;
  promedio:=0;
  for c:= 1 to carrera do
  begin
    writeln('Ingrese el codigo de la carrera ',c,':');
    read(codigo);
    writeln('Ingrese la cantidad de anios:');
    read(anios);
    for a:= 1 to anios do
    begin
      writeln('Ingrese la cantidad de alumnos del ',a,' anio:');
      read(alumnos);
      promedio:=promedio+alumnos;
    end;
    promedio:=promedio/anios;
    if (promedio<promMin)then
    begin
      promMin:=promedio;
      CMin:=codigo;
    end;
    promedio:=0;
  end;
  writeln('La carrera con menor promedio es: ',CMin);
END.

