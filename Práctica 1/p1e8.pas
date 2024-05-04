{Realizar un programa que procese la información de los alumnos que cursan el 2do año de la
carrera Ingeniería en Computación. Para ello se ingresa desde teclado la información de cada
alumno, hasta leer el número de alumno 756, el cual debe procesarse. De cada alumno se conoce
el número de alumno, y la cantidad de materias aprobadas. Para cada materia aprobada se ingresa
la nota obtenida. Informar la máxima nota obtenida por cada alumno y el número de alumno de quien
haya obtenido el máximo promedio en la carrera.}

program p1e8;
var
  i,alumno,materias,nota,max,aluMax:integer;
  promMax,promedio:real;
BEGIN
  max:=0;
  promedio:=0;
  promMax:=0;
  repeat
  writeln('Ingrese el numero de alumno:');
  read(alumno);
  writeln('ingrese la cantidad de materias aprobadas:');
  read(materias);
  for i:= 1 to materias do
    begin
    readln(nota);
    if (nota>max)then max:=nota;
    promedio:=promedio+nota;
    end;
  promedio:=promedio/materias;
  writeln('La mayor nota obtenida por el alumno ',alumno,' es de ',max);
  if (promedio>promMax)then
    begin 
    promMax:=promedio;
    aluMax:=alumno;
    promedio:=0;
    max:=0;
    end;
  until(alumno=756); 
  writeln('El alumno con mayor promedio del anio es el alumno ',aluMax);
END.

