{Simular el funcionamiento de un conjunto de caracteres de la ‘a’ a la ‘z’ utilizando un arreglo. Defina
un tipo de datos adecuado e implemente módulos que realicen las operaciones de unión y diferencia
de dos conjuntos y una función que permite determinar si una letra pertenece al conjunto.
Nota: realice los chequeos correspondientes en cada módulo para procesar solo letras.}

program p6e7;
uses crt;
const
  fin='z';
type
  cadena=string[10];
  conjunto=array['a'..fin]of boolean;
procedure cargarConjunto(var c:conjunto);
var
  i:char;
  x:cadena;
begin
  for i:='a' to fin do begin
   writeln('Esta el caracter ',i,' en el conjunto?');
   readln(x);
   if(x='si')then c[i]:=true
   else if (x='no')then c[i]:=false;
 end;
end;
procedure union(c1,c2:conjunto);
var
  i:char;
  c3:conjunto;  
begin
  for i:='a' to fin do begin
    if(c1[i]=true)or(c2[i]=true)then c3[i]:=true
    else c3[i]:=false;
  end;
  writeln('La union de los conjuntos es:');
  for i:='a' to fin do if(c3[i]=true)then write(i);
  writeln(' ');
end;
procedure diferencia(c1,c2:conjunto);
var
  i:char;
  c3:conjunto;
begin
  for i:='a' to fin do begin
    if(c2[i]=true)then c3[i]:=false
    else c3[i]:=true;
  end;
  writeln('La diferencia de los conjuntos es:');
  for i:='a' to fin do if(c3[i]=true)then write(i);
  writeln(' ');
end;
var
  c1,c2:conjunto;
BEGIN
  cargarConjunto(c1);
  cargarConjunto(c2);	
  union(c1,c2);
  diferencia(c1,c2);
  readkey;
END.
