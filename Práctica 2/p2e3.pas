{a) Se leen 10 números enteros. Determinar para cada uno de ellos la suma de sus cifras hasta
expresarlas en una sola unidad, e informar.
Ejemplos: 12853 ➔ 19 ➔ 10 ➔ 1
280 ➔ 10 ➔ 1
3005 ➔ 8
b) Modifique a) para imprimir en letras la cifra resultante}

program p2e3;
uses crt;
const
  fin=1;
var
  suma,i,num,dig,original:integer;
BEGIN
  for i:=1 to fin do
  begin
    writeln('Ingrese un numero:');
    read(num);
    original:=num;
    while(num>9)do begin
      suma:=0;
      while(num<>0) do begin 
        dig:=num mod 10;
        suma:=suma+dig;
        num:=num div 10;
      end;
      num:=suma;
    end;
    case suma of
    1:writeln('La suma de las cifras del numero ',original,' da uno');
    2:writeln('La suma de las cifras del numero ',original,' da dos');
    3:writeln('La suma de las cifras del numero ',original,' da tres');
    4:writeln('La suma de las cifras del numero ',original,' da cuatro');
    5:writeln('La suma de las cifras del numero ',original,' da cinco');
    6:writeln('La suma de las cifras del numero ',original,' da seis');
    7:writeln('La suma de las cifras del numero ',original,' da siete');
    8:writeln('La suma de las cifras del numero ',original,' da ocho');
    9:writeln('La suma de las cifras del numero ',original,' da nueve');
    else writeln('Hubo un error');
  end;
  readkey;
END.
