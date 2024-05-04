{En la ciudad de La Plata se llevó a cabo un importante concurso de Informática, en el cual
se presentaron participantes europeos, asiáticos y americanos. Una vez finalizado el
concurso, se evaluaron los exámenes. De cada examen se conoce el nombre de la persona
que lo realizó, su continente de origen y puntaje (de 0 a 100). Defina la estructura de datos
más adecuada para almacenar la información descripta. Obtener e informar:
a) Participante que obtuvo la mejor calificación.
b) Por cada continente, cantidad de participantes que aprobaron (a partir de 70 puntos)
y cantidad que promocionaron (a partir de 90).
c) Puntaje promedio de los europeos.
Nota: La información de los participantes de un continente se lee en forma consecutiva. Se
procesarán exámenes hasta que llegue el examen con nombre de la persona igual a ‘zzz’.}

program p4e8;
uses crt;
const
  fin='zzz';
  continentes=3;
type
  palabra=string[25];
  examen=record
           nombre:palabra;
           continente:palabra;
           puntaje:0..100;
         end;
procedure leer(var e:examen);
begin
  writeln('Ingrese el continente de origen:');
  readln(e.continente);
  writeln('Ingrese el puntaje del examen:');
  readln(e.puntaje);
end;
procedure maxNota(e:examen;var max:integer;var maxNom:palabra);
begin
  if(e.puntaje>max)then begin
    max:=e.puntaje;
    maxNom:=e.nombre;
  end;
end;
procedure cantAproPromo(e:examen;var cantA:integer;var cantP:integer);
begin
  if(e.puntaje>=70)then cantA:=cantA+1;
  if(e.puntaje>=90)then cantP:=cantP+1;
end;
procedure sumaE(e:examen;var sumaEuropa:integer;var cantEuropa:integer);
begin
  if(e.continente='europa')then begin
    sumaEuropa:=sumaEuropa+e.puntaje;
    cantEuropa:=cantEuropa+1;
  end;
end;
var
  e:examen;
  maxNom:palabra;
  c,cantA,cantP,sumaEuropa,cantEuropa,max:integer;
  promEuropa:real;
BEGIN
  cantEuropa:=0;
  sumaEuropa:=0;
  max:=0;
  promEuropa:=0;
  for c:=1 to continentes do begin
    cantA:=0;
    cantP:=0;
    writeln('Ingrese el nombre del participante:');
    readln(e.nombre);
    while(e.nombre<>fin)do begin
      leer(e);
      maxNota(e,max,maxNom);
      cantAproPromo(e,cantA,cantP);
      sumaE(e,sumaEuropa,cantEuropa);
      writeln('Ingrese el nombre del participante:');
      readln(e.nombre);
    end;
    writeln('La cantidad de participantes de ',e.continente,' que aprobaron es ',cantA);
    writeln('La cantidad de participantes de ',e.continente,' que promocionaron es ',cantP);
  end;
  if(cantEuropa<>0)then promEuropa:=sumaEuropa/cantEuropa;
  writeln('El participante con la mejor calificacion es ',maxNom);
  writeln('El puntaje promedio de los europeos es ',promEuropa);
  readkey;
END.

       
