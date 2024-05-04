{Escriba un programa que lea una secuencia de caracteres terminada en ‘#’ e informe aquellas
letras entre la “a” y la “z” que no fueron ingresadas. Implemente un módulo que contabilice las letras y
otro que imprima el resultado.}

program p3e4B;
uses crt;
type
  letras=set of char;
const
  fin='#';
procedure contarLetras(var NOing:letras); 
var
  ing, total:letras;
  c:char;
begin
  ing:=[];
  total:=['a'..'z'];
  writeln('Ingrese una secuencia de caracteres:');
  readln(c);
  while(c<>fin)do begin
    if(c in total)and(not(c in ing))then ing:=ing+[c];
    readln(c);
  end;
  NOing:=total-ing;
end;
procedure informarLetras(NOing:letras);
var
 i:char;
begin
  writeln('Las letras no ingresadas son:');
  for i:= 'a' to 'z' do begin
    if(i in NOing)then write(i,' '); 
  end;
end;
var
  NOing:letras;
BEGIN
  contarLetras(NOing);
  informarLetras(NOing);
  readkey;	
END.
