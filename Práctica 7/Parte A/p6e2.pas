{Un banco cuenta con 6 cajas. Implementar un programa que lea monto de los depósitos y nº de caja
hasta que se ingresa la caja con número 0. Acumule, para cada caja, el monto total. Finalizada la
carga informar el nº de caja que más recaudó y el promedio de caja.}

program p2e2;
uses crt;
const
  fin=0;
  dimF=6;
type
  vector=array[1..dimF]of real; 
procedure cargarVector(var v:vector);
var
  i:integer;
  monto:real;
begin
  readln(i);
  while(i<>fin)do begin
    readln(monto);
    v[i]:=v[i]+monto;
  end;
end;
procedure maxProm(v:vector;var cajaMax:integer;var prom:real);
var
  i:integer;
  max,suma:real;
begin
  suma:=0;
  max:=-1;
  for i:=1 to dimF do begin
    if(v[i]>max)then begin
      max:=v[i];
      cajaMax:=i;
    end;
    suma:=suma+v[i];
  end;
  prom:=suma/dimF;
end;
var
  v:vector;
  cajaMax:integer;
  prom:real;
BEGIN
  cargarVector(v);
  maxProm(v,cajaMax,prom);
  writeln('La caja con mayor monto es la n°',cajaMax);
  writeln('El promedio de caja es ',prom);
  readkey;	
END.
