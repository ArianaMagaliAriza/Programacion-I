{Realizar un programa que lea desde el teclado el ancho, alto
y profundidad de un prisma rectangular (cuerpo geométrico de
6 caras rectangulares, como una caja) e informe su volumen y
área de la superficie formada por sus caras. Elija una estructura
de datos adecuada y modularice la solución. Modularice la
solución}

program p4e1;
uses crt;
type
prisma=record
       ancho:integer;
       alto:integer;
       prof:integer;
       end;
procedure LeerPrisma(var p:prisma);
begin
  with p do begin
    writeln('Ingrese el ancho del prisma:');
    readln(ancho);
    writeln('Ingrese el alto del prisma:');
    readln(alto);
    writeln('Ingrese la profundidad del prisma:');
    readln(prof);
  end;
end;
function volumen(p:prisma):integer;
begin
  with p do begin
    volumen:=ancho*alto*prof;
  end;
end;
function area(p:prisma):integer;
begin
  with p do begin
    area:=(2*ancho*alto)+(2*ancho*prof)+(2*alto*prof);
  end;
end;
var
  p:prisma;
BEGIN
  LeerPrisma(p);
  writeln('El volumen del prisma es de ',volumen(p),' cm^3');
  writeln('El area del prisma es de ',area(p),' cm^2');
  readkey;
END.

