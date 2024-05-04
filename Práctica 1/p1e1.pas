{Realizar un programa que lea por teclado valores que representan la cantidad de personas que
ingresaron en cada una de las 24hs del día en un edificio. Se pide:
a) Informar la máxima cantidad de personas que entraron en una hora.
b) Agregar al inciso a) el código necesario para informar la hora en que más personas entraron.}

program p1e1;
var
  CantP,max,max_h,i:integer;
BEGIN
  max:=0;
  For i:= 0 to 23 do
    begin
      writeln('Ingrese la cantidad de personas que entraron al edificio:');
      readln(CantP);
      if(CantP>max)then 
      begin
        max:=CantP;
        max_h:=i;
      end;
    end;
writeln('La maxima cantidad de personas que ingresaron es ',max,' a las ',max_h,' hs');
END.

