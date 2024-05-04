{Escriba un programa que lea una secuencia de caracteres terminada en punto, y que a través de
un procedimiento evalúe si cada una de sus palabras tiene la 'p' seguida de la ‘a’. El programa debe
informar cuántas palabras cumplen con esa condición.}

program p3e9;
uses crt;
procedure pa(ant,car:char;var cant:integer);
begin
  if(ant='p')and(car='a')then cant:=cant+1;
end;
var
  car,ant:char;
  cant:integer;
BEGIN
  writeln('Ingrese una secuencia:');
  read(car);
  while(car<>'.')do begin
    while(car=' ')do read(car);
    ant:=car;
    read(car);
    while(car<>'.')and(car<>' ') do begin
    pa(ant,car,cant);
    ant:=car;
    read(car);
    end;
  end;
  writeln('Hay ',cant,' palabras que cumplen con la condicion');
END.
