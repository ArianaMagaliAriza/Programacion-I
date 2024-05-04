{a) Escriba un módulo que reciba un carácter que debe ser un operador matemático ('*', '+', '-', '/') y
dos números enteros, y devuelva el resultado de realizar la operación matemática entre los dos
números recibidos. En caso de que el carácter no sea uno de los operadores matemáticos
indicados, el módulo debe devolver el valor -1.
b) Utilizando el módulo implementado en a), implemente un programa que lea el operador y los dos
operandos, e imprima el resultado de dicha operación.}

program p3e8;
uses crt;
function operacion(o1,o2:integer;op:char):real;
var
  res:real;
begin
  case op of
  '*':res:=o1*o2;
  '+':res:=o1+o2;
  '-':res:=o1-o2;
  '/':if (o2<>0)then res:=o1/o2
  else res:=-1;
  end;
  operacion:=res;
end;
var
 operador:char;
 op1,op2:integer;
BEGIN
  writeln('Ingrese un operador:');
  read(operador);
  writeln('Ingrese un operando:');
  read(op1);
  writeln('Ingrese un operando:');
  read(op2);
  writeln('El resultado es ',operacion(op1,op2,operador));
  readkey;
END.

