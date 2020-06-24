program project_text_files;

uses
  SysUtils;

type
  FileRecord = record
     C1, C2, C3: Integer;
     FD: TextFile;
     Active : Boolean;
  end;

var
  FileName: String;
  F: array[1..10] of FileRecord;
  FResult: TextFile;
  N, I, IMax, C1, C2, C3: Integer;
  ReadingEnd: Boolean; // True -- если нет активных файлов, False иначе
begin
  Write('Input files count: ');
  ReadLn(N);

  for I := 1 to N do
  begin
    Write('File name :', I, ': ');
    ReadLn(FileName);

    Assign(F[I].FD, FileName);
    ReSet(F[I].FD);

    F[I].Active := not EOF(F[I].FD);
    if F[I].Active then
    begin
      ReadLn(F[I].FD, F[I].C1, F[I].C2, F[I].C3);
    end;
  end;

  
  Assign(FResult, 'FResult.txt');
  ReWrite(FResult);

  while True do
  begin
    ReadingEnd := True;
    IMax := -1;
    for I := 1 to N do
      if F[I].Active then
      begin
        if (IMax = -1) or (F[I].C3 > F[Imax].C3) then
          IMax := I;
        ReadingEnd := False;
      end;

    if ReadingEnd then
      break;

    F[Imax].Active := not EOF(F[IMax].FD);
    if F[Imax].Active then
    begin
      ReadLn(F[IMax].FD, F[I].C1, F[I].C2, F[I].C3);
      F[Imax].C3 := F[I].C3;
    end;

    Write  (FResult, F[IMax].C1, ' ');
    Write  (FResult, F[IMax].C2, ' ');
    WriteLn(FResult, F[IMax].C3, ' ');
  end;

  for I := 1 to N do
    CloseFile(F[I].FD);

  Close(FResult);

  WriteLn('Finished');
  ReadLn;
end.

