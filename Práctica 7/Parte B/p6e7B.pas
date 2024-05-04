{Dada una secuencia de 1000 tuits correspondientes al mes pasado que fueron seleccionados para
calcular algunas estadísticas. Sabiendo que cada tuit contiene información de la fecha y del texto (de
un máximo 140 caracteres) en que fue publicado se pide calcular e informar:
a) La cantidad de hashtags (palabras que empiezan con el carácter ‘#’) y usuarios (palabras que
empiezan con carácter ‘@’).
b) La cantidad de tuits publicados cada día.
c) La cantidad promedio de palabras de un tuit.}

program p6e7B;
uses crt;
const
  fin=1000;
  dimF=140;
type
  palabras=array[1..dimF]of char;
  fecha=array[1..31]of integer;
  tweet=record
        dia:integer;
        texto:palabras;
        end;
procedure leerTweet(var t:tweet;var dimL:integer);
var
  i:integer;
  letra:char;
begin
  dimL:=0;
  i:=1;
  writeln('Ingrese el dia de publicacion del tweet:');
  readln(t.dia);
  writeln('Ingrese el texto del tweet:');
  read(letra);
  while(letra<>'.')and(dimL<dimF)do begin
    t.texto[i]:=letra;
    dimL:=dimL+1;
    i:=i+1;
    read(letra);
  end;
end;
procedure procesarTweet(t:tweet;dimL:integer;var cantHash,cantUsu:integer;var promPalabra:real);
var
  i:integer;
begin
  i:=1;
  while(i<dimL)do begin
    while(t.texto[i]=' ')do i:=i+1;
    promPalabra:=promPalabra+1;
    if(t.texto[i]='#')then cantHash:=cantHash+1
    else if(t.texto[i]='@') then cantUsu:=cantUsu+1;
    while(t.texto[i]<>' ')do i:=i+1;
    end;
end;
procedure InicializarVectorFecha(var f:fecha);
var
  i: integer;
begin
	for i:= 1 to 31 do begin
		f[i]:= 0;
	end;
end;      
var
  f:fecha;
  t:tweet;
  i,dimL,cantHash,cantUsu:integer;
  promPalabra:real;
BEGIN
  cantHash:=0;
  cantUsu:=0;
  promPalabra:=0;
  InicializarVectorFecha(f);
  for i:=1 to fin do begin
    leerTweet(t,dimL);
    procesarTweet(t,dimL,cantHash,cantUsu,promPalabra);
  end;
  promPalabra:=promPalabra/fin;
  writeln('La cantidad de # es ',cantHash,' y la cantidad de usuarios es ',cantUsu);
  for i:=1 to 31 do writeln('La cantidad de tweets publicados en el dia ',i,' es ',f[i],' tweets');
  writeln('El promedio de palabras por tweet es ',promPalabra,' palabras');
  readkey;
END.

