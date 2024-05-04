{Una fábrica de alfajores y mermeladas maneja información sobre los diferentes productos
que tiene para la venta. Para ello se lee la información de cada producto hasta que llega el
producto con código 9999. De cada producto se lee: código, tipo (alfajor o mermeladas),
cantidad de unidades fabricados para el mes, y precio. Se desea informar:
a) Cantidad de alfajores fabricados para el mes.
b) Precio promedio de las mermeladas.
c) Los códigos de los dos productos con mayor cantidad de unidades de fabricación.}

program p4e4;
uses crt;
const
  fin=9999;
type
producto=record
         codigo:integer;
         tipo:string[14];
         cantFabMes:integer;
         precio:integer;
         end;
procedure leer_producto(var p:producto);
begin
  writeln('Ingrese el tipo de producto:');
  readln(p.tipo);
  writeln('Ingrese la cantidad de unidades fabricadas para el mes del producto:');
  readln(p.cantFabMes);
  writeln('Ingrese el precio del producto:');
  readln(p.precio);
  writeln('Ingrese el codigo del producto:');
  readln(p.codigo);
end;
procedure alfajor_fabr_mes(p:producto;var alfajor:integer);
begin
  if (p.tipo='alfajor')then alfajor:=alfajor+p.cantFabMes;
end;
procedure suma_mermelada(p:producto;var cant_m:integer;var suma:integer);
begin
  if (p.tipo='mermelada')then begin
    cant_m:=cant_m+1;
    suma:= suma+p.precio;
  end;
end;
procedure maximos(p:producto;var max:integer;var max2:integer;var c_max:integer;var c_max2:integer);
begin
  if (p.cantFabMes>max)then begin
    max2:=max;
    c_max2:=c_max;
    max:=p.cantFabMes;
    c_max:=p.codigo;
  end
  else if(p.cantFabMes>max2)then begin
    max2:=p.cantFabMes;
    c_max2:=p.codigo;
  end;
end;
var
  p:producto;
  alfajor_fab_mes,cant_mer,suma_mer,max,c_max,max2,c_max2:integer;
  prom_mer:real;
BEGIN
  max:=-1;
  max2:=-1;
  alfajor_fab_mes:=0;
  cant_mer:=0;
  suma_mer:=0;
  prom_mer:=0;
  writeln('Ingrese el codigo del producto:');
  readln(p.codigo);
  while(p.codigo<>fin)do begin
   leer_producto(p);
   alfajor_fabr_mes(p,alfajor_fab_mes);
   suma_mermelada(p,cant_mer,suma_mer);
   maximos(p,max,max2,c_max,c_max2);
   writeln('Ingrese el codigo del producto:');
   readln(p.codigo);
  end;
  if(cant_mer<>0) then prom_mer:=suma_mer/cant_mer;
  writeln('La cantidad de alfajores fabricados para el mes es ',alfajor_fab_mes,' alfajores');
  writeln('El precio promedio de las mermeladas es de ',prom_mer,' pesos');
  writeln('Los productos con mayor cantidad de unidades de fabricacion son ',c_max,' y ',c_max2);
  readkey;
END.

