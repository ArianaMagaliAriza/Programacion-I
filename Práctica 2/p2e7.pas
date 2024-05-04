{7.- Se lee una secuencia de caracteres hasta encontrar un carácter punto '.'. Contar e informar la
cantidad de palabras y la longitud de la palabra más larga que comienza con 't'.
Ejemplo: A Tomás le encanta tomar té de tilo
Cantidad de Palabras = 8
La Longitud de la palabra más larga que comienza con t es 5.}

program p2e7;
uses crt;
var
  car:char;
  cantP,largoP,maxT: integer;
BEGIN
  cantP:= 0;
  maxT := -1;
  writeln('Ingrese la secuencia de caracteres:');
  read(car);
  while(car<>'.')do begin 
    while(car=' ')do 
    read(car);
    if(car='t')then
    begin
      largoP:= 0;
      while(car<>' ')and(car<>'.')do begin
        largoP:= largoP+1;
        read(car);
        end;
      if(largoP>maxT)then maxT := largoP;
    end
    else
      while(car<>' ')and (car<>'.')do read(car);
    cantP:= cantP+1;
  end;
  writeln('La cantidad de palabras es ', cantP);
  writeln('La longitud de la palabra mas larga que comienza con t es ',maxT,' caracteres');
  readkey;
END.
