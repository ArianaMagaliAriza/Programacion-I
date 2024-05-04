{Realizar un módulo que reciba dos vectores A y B y un valor I, y que devuelva el vector A en el que
se insertan las componentes del vector B entre las componentes I e I+1 del vector A. Se debe validar
que el parámetro I esté en un rango permitido.}

program p6e3B;
uses crt;
const
  dimF=40;
type
  rango=1..dimF;
  vector=array[rango]of integer;
procedure cargarVectoresyValor(var a,b:vector;var c,dimL1,dimL2:integer);
var
  i:integer;
begin
  writeln('Ingrese la dimension logica para el vector a:');
  readln(dimL1);
  writeln('Ingrese la dimension logica para el vector b:');
  readln(dimL2);
  writeln('Ingrese los valores para el vector a (',dimL1,' numeros enteros):');
  for i:=1 to dimL1 do readln(a[i]);
  writeln('Ingrese los valores para el vector b (',dimL2,' numeros enteros):');
  for i:=1 to dimL2 do readln(b[i]);
  writeln('Ingrese un numero entero:');
  readln(c);
end;
procedure modificarVector(var a:vector;b:vector;c,dimL1,dimL2:integer);
var
  i,j,h,n:integer;
begin
  i:=1;
  while(dimL1<dimF)do begin
    while(i<dimL1)and(a[i]<>c)do i:=i+1;
    if(a[i]=c)then begin
      for j:=1 to dimL2 do begin 
        for h:=dimL1 downto i do a[h+1]:=a[h];
        a[h]:=b[j];
        dimL1:=dimL1+1;
        h:=h+1;
      end;
    end
    else writeln('El numero ',c,'no esta en el vector a');
  end;
end;
var
  a,b:vector;
  c,dimL1,dimL2:integer;
BEGIN
  cargarVectoresyValor(a,b,c,dimL1,dimL2);
  modificarVector(a,b,c,dimL1,dimL2);
  writeln('El vector a quedo asi:');
  for n:=1 to dimL1 do write(a[n],' '); 
  readkey;
END.
