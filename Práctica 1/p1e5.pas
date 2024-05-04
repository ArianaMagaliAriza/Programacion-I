{Un parque natural requiere un programa realice el seguimiento del peso algunos de sus osos
homigueros. De cada animal se debe leer por teclado su edad y peso hasta que se ingrese una edad
negativa. Se requiere informar para aquellos animales menores de 3 años el menor peso y peso
promedio, mientras que para los mayores de 3 se pide informar el peso máximo y el peso promedio.}

program p1e5;
var
  edad,peso,pesoMin,pesoMax,Mayor3,Menor3:integer;
  promMayor,promMenor:real;
BEGIN
  Mayor3:=0;
  Menor3:=0;
  pesoMin:=999;
  pesoMax:=0;
  promMayor:=0;
  promMenor:=0;
  writeln('Ingrese la edad del animal:');
  readln(edad);
  while(edad>=0) do
    begin
    writeln('Ingrese el peso del animal:');
    readln(peso);
    if(edad>3)then
      begin
      promMayor:=promMayor+peso;
      Mayor3:=Mayor3+1;
      if(peso>pesoMax)then pesoMax:=peso;
      end 
    else if(edad<3)then
      begin
      promMenor:=promMenor+peso;
      Menor3:=Menor3+1;
      if(peso<pesoMin)then pesoMin:=peso;
      end;
    writeln('Ingrese la edad del animal:');
    readln(edad); 
    end;
    promMayor:=promMayor/Mayor3;
    promMenor:=promMenor/Menor3;
    writeln('Para los animales menores a 3 años su menor peso es ',pesoMin,' y su peso promedio es ',promMenor,' kg');
    writeln('Para los animales mayores a 3 años su mayor peso es ',pesoMax,' y su peso promedio es ',promMayor,' kg');    
END.
