{Defina un tipo de dato que permita almacenar una secuencia de 64 valores binarios e implemente
módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de operaciones lógicas),
junto con dos operandos o uno, según corresponda.}

program p6e6;
uses crt;
const
  fin=64;
type
  vector=array[1..fin]of boolean;
procedure cargarVector(var v:vector);
var
  i,valor:integer;
begin
 for i:=1 to fin do begin
   writeln('Ingrese un valor para la posicion ',i,' del vector:');
   readln(valor);
   if(valor=1)then v[i]:=true
   else if (valor=0)then v[i]:=false;
 end;
end;
procedure operacionAND(v:vector);
var
  i:integer;
  a,b,opAND:boolean;
begin
  writeln('Ingrese una posicion del vector:');
  readln(i);
  a:=v[i];
  writeln('Ingrese una posicion del vector:');
  readln(i);
  b:=v[i];
  opAND:=a and b;
  if(opAND=true)then writeln('El resultado de la operacion AND es 1')
  else writeln('El resultado de la operacion AND es 0');
end;
procedure operacionOR(v:vector);
var
  i:integer;
  a,b,opOR:boolean;
begin
  writeln('Ingrese una posicion del vector:');
  readln(i);
  a:=v[i];
  writeln('Ingrese una posicion del vector:');
  readln(i);
  b:=v[i];
  opOR:=a or b;
  if(opOR=true)then writeln('El resultado de la operacion OR es 1')
  else writeln('El resultado de la operacion OR es 0');
end;
procedure operacionNOT(v:vector);
var
  i:integer;
  a,opNOT:boolean;
begin
  writeln('Ingrese una posicision del vector:');
  readln(i);
  a:=v[i];
  opNOT:=not a;
  if(opNOT=true)then writeln('El resultado de la operacion NOT es 1')
  else writeln('El resultado de la operacion NOT es 0');
end;
var
  v:vector;
BEGIN
  cargarVector(v);
  operacionAND(v);
  operacionOR(v);
  operacionNOT(v);
  readkey;	
END.
