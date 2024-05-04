{Una empresa de videojuegos está organizando su producción y requiere hacer algunas
estadísticas. Un videojuego tiene un nombre, una categoría (educativo, acción, arcade, etc.),
idioma en que se los comercializa (español, inglés, francés, etc.) y cantidad de votos
positivos recibidos por sus usuarios. Se pide:
a) Calcular e informar la categoría que tiene más juegos y la que tiene más votos.
b) Calcular e informar el promedio de votos recibidos para los juegos educativos por
cada idioma en que se lo comercializa.
c) Calcular e informar el nombre y el idioma del videojuego más votado.
Nota: cada temática se lee en forma consecutiva, y dentro de la temática cada idioma
también es consecutiva. El procesamiento finaliza al ingresar “fin” como categoría.}

program p5e4;
uses crt;
const
  corte='fin';
type
  texto=string[25];
  videojuego=record
             nombre:texto;
             categoria:texto;
             idioma:texto;
             votos:integer;
             end;
procedure MaxJcategoria(v:videojuego;var maxJ:integer;var maxJcat:texto;var cantJ:integer);
begin
  with v do begin
  cantJ:=cantJ+1;
  if(cantJ>maxJ)then begin
    maxJ:=cantJ;
    maxJcat:=categoria;
  end;
  end;
end;
procedure MaxVcategoria(v:videojuego;var maxV:integer;var maxVcat:texto;var cantV:integer);
begin
  with v do begin
  cantV:=cantV+votos;
  if(cantV>maxV)then begin
    maxV:=cantV;
    maxVcat:=categoria;
  end;
  end;
end;
procedure promVotoEdu(v:videojuego;var sumaEduV:integer;var cantEdu:integer);
begin
  with v do begin
  if(categoria='educativo')then begin
    sumaEduV:=sumaEduV+votos;
    cantEdu:=cantEdu+1;
  end;
  end;
end;
procedure juegoMaxVotos(v:videojuego;var JuegoMaxV:integer;var JuegoMaxNom:texto;var JuegoMaxIdiom:texto);
begin
  with v do begin
  if(votos>JuegoMaxV)then begin
  JuegoMaxV:=votos;
  JuegoMaxNom:=nombre;
  JuegoMaxIdiom:=idioma;
  end;
  end;
end;
var
  v:videojuego;
  catActual,idiomaActual,maxVcat,maxJcat,JuegoMaxNom,JuegoMaxIdiom:texto;
  cantV,cantJ,maxV,maxJ,sumaEduV,cantEdu,JuegoMaxV:integer;
  promEduV:real;
BEGIN 
  JuegoMaxV:=-1;
  maxV:=-1;
  maxJ:=-1;
  writeln('Ingrese la categoria:');
  readln(v.categoria);
  catActual:=v.categoria;
  with v do begin
    while(categoria<>corte)do begin
      cantV:=0;
      cantJ:=0;
      while(categoria=catActual)do begin
        writeln('Ingrese el idioma:');
        readln(idioma);
        idiomaActual:=idioma;
        sumaEduV:=0;
        cantEdu:=0;
        promEduV:=0;
        while(idioma=idiomaActual)do begin
          writeln('Ingrese el nombre del Videojuego:');
          readln(nombre);
          writeln('Ingrese la cantidad de votos:');
          readln(votos);
          MaxJcategoria(v,maxJ,maxJcat,cantJ);
          MaxVcategoria(v,maxV,maxVcat,cantV);
          promVotoEdu(v,sumaEduV,cantEdu);
          juegoMaxVotos(v,JuegoMaxV,JuegoMaxNom,JuegoMaxIdiom);
          writeln('Ingrese el idioma:');
          readln(idioma);
        end;
        if (categoria='educativo')then begin
          promEduV:=sumaEduV/cantEdu;
          writeln('El promedio de votos de videojuegos educativos en ',idioma,' es de ',promEduV,' votos');
        end;
        writeln('Ingrese la categoria:');
        readln(categoria);
      end;
      catActual:=categoria;
    end;
    writeln('La categoria con mas Juegos es: ',maxJcat);
    writeln('La categoria con mas votos es: ',maxVcat);
    writeln('El juego mas votado es ',JuegoMaxNom,' en ',JuegoMaxIdiom);
  end;
  readkey;
END.

             
