{2.- Se lee una sucesión de números enteros que termina en 9999. Obtener e informar la suma de
todas las unidades y los dos dígitos mayores en cada número.
Ejemplo: si se lee 2 32 4201 372 23025 9999 (no se procesa)
Los dígitos mayores de cada número a informar son 2 3-2 4-2 7-3 5-3 respectivamente
La suma de las unidades a informar es 12}

program p2e2;
uses crt;
const
  fin=9999;
var
  n,suma,max,max2,dig,original:integer;
BEGIN
  suma:=0;
  writeln('Ingrese un numero:');
  readln(n);
  while(n<>fin)do begin
   max:=-1;
   max2:=-1;
   original:=n;
   while(n<>0)do begin
     dig:=n mod 10;
     if (n=original)then suma:=suma+dig;
     if(dig>max)then begin
       max2:=max;
       max:=dig;
     end
     else if(dig>max2)then max2:=dig;
     n:=n div 10;
     end;
   writeln('Los dos mayores digitos del numero ',original,' son ',max,' y ',max2);
   writeln('Ingrese un numero:');
   read(n);
   end;
  writeln('La suma de las unidades a informar es ',suma);
  readkey;	
END.
