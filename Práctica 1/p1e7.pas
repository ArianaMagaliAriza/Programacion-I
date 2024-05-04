{Se lee información relativa a la cantidad de páginas de 500 libros de una biblioteca. Informar los
códigos de los 2 libros que tienen menor cantidad de páginas. Además, para el libro con mayor
cantidad de páginas de la biblioteca, se debe informar la cantidad de páginas que tiene}

program p1e7;
const
  fin=500;
var
  i,codigo,pag,maxP,min,min2,minC,minC2:integer;
BEGIN
  maxP:=0;
  min:=9999;
  min2:=9999;
  for i:= 1 to fin do
  begin
    writeln('Ingrse el codigo del libro:');
    read(codigo);
    writeln('Ingrese la cantidad de paginas:');
    read(pag);
    if(pag>maxP)then maxP:=pag
    else if(pag<min)then
    begin
      min2:=min;
      minC2:=minC;
      min:=pag;
      minC:=codigo;
    end
    else if(pag<min2)then
    begin
      min2:=pag;
      minC2:=codigo;    
    end;
  end;
  writeln('Los libros con menor cantidad de paginas son ',minC,' y ',minC2);
  writeln('El libro can mayor cantidad de paginas tiene ',maxP,' paginas');	
END.
