program project2_verification;
uses
SysUtils;

type
  Track = record
     Player,TrackName: String;
     Duration: Integer;
end;

  Artist = record
     Player: String;
     Fool: Integer;
     Count: Integer;
  end;

var
   FileName: String;
   Playlist : array [1..30] of Track;
   Albom : array [1..30] of Artist;
   F : TextFile;
   s,t : String;
   i,w,Fool,a,j,fe : Integer;
begin
   Write('File name of the playlist: ');
   Readln(FileName);

   assign(f, FileName);
   reset(f);

   w:= 1;
   Fool:= 0;
   while not EOF(f) do begin
     Readln(f, s);
     i:= 1;
     Playlist[w].Player := '';
     while not (s[i] = ';') do begin
        Playlist[w].Player += s[i];
        i+=1;
     end;
     i+=1;
     Playlist[w].TrackName := '';
     while not (s[i] = ';') do begin
        Playlist[w].TrackName += s[i];
        i+=1;
     end;
     i+=1;
     t:= '';
     while not (s[i] = ':') do begin
       t+=s[i];
       i+=1;
     end;
     Playlist[w].Duration := StrToInt(t)*60;
     i+=1;
     t:= '';
     while i <= Length(s) do begin
       t+=s[i];
       i+=1;
     end;
     Playlist[w].Duration += StrToInt(t);

     Fool+=Playlist[w].Duration;

     w+=1;
   end;

   Writeln('Fool duration of the playlist: ', Fool div 3600,':',Fool div 60,':',Fool mod 60);

   a:= 0;
   for i:= 1 to w-1 do begin
     fe:= 0;
     for j:=1 to a do begin
       if (AnsiCompareStr(Playlist[i].Player, Albom[j].Player) = 0) then begin
         Albom[j].Fool+= Playlist[i].Duration;
         fe:= j;
         Albom[j].Count+= 1;
         break;
       end;
     end;
     if (fe = 0) then begin
       a+=1;
       Albom[a].Fool:= Playlist[i].Duration;
       Albom[a].Player:= Playlist[i].Player;
       Albom[a].Count:= 1;
     end;

   end;

    for j:=1 to a do begin
        Writeln('Artist : ', Albom[j].Player, '; Count of tracks: ', Albom[j].Count, '; Duration of tracks: ',Albom[j].Fool div 3600,':',Albom[j].Fool div 60,':',Albom[j].Fool mod 60);

    end;

   Readln();
end.
