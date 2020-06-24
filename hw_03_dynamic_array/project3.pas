program project3;

var
 Mat : array of array of Integer;
 i,j,m,n,ei,ej,p,c,t,si,sj: Integer;
 q: Boolean;

 procedure Matrix();
 begin
    if t=1 then
    q:= True;
    if t=9 then
    q:= False;
    if q = True then
    t+=1 else
      t-=1;
 end;

begin
   Writeln('Enter height :');
   Readln(m);
   Writeln('Enter width :');
   Readln(n);

   SetLength(Mat,M,N);

   i:= 0;
   j:= 0;
   t:= 1;
   ei:= m;
   ej:= n;
   p:= 0;
   c:= 1;
   si:= 0;
   sj:= 0;

   while (p < (m*n))  do
   begin
     if c=1 then
     begin
        for j:= sj to ej-1 do
        begin
          Mat[i,j]:= t ;
          Matrix();
          p+=1;
        end;
        si+=1;
        c:=2;
     end

     else if c=2 then
     begin
        for i:= si to ei-1 do
        begin
          Mat[i,j]:= t ;
          Matrix();
          p+=1;
        end;
        ej-=1;
        c:=3;
     end

     else if c=3 then
     begin
        for j:= ej-1 downto sj do
        begin
          Mat[i,j]:= t;
          Matrix();
          p+=1;
        end;
        ei-=1;
        c:=4;
     end

     else if c=4 then
     begin
        for i:= ei-1 downto si do
        begin
          Mat[i,j]:= t;
          Matrix();
          p+=1;
        end;
        sj+=1;
        c:=1;
     end;
   end;

   for i:= 0 to m-1 do
   begin
      for j:= 0 to n-1 do
      Write(Mat[i,j], ' ');
      Writeln();
   end;

   Readln();
end.
