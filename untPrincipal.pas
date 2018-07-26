unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtDlgs, StrUtils, about;

type
  TfrmPrincipal = class(TForm)
    sbtnSelecionarArquivo: TSpeedButton;
    edtCaminhoArquivo: TEdit;
    memoCodigosNaoValidos: TMemo;
    sbtnValidar: TSpeedButton;
    FileOpenDialog1: TFileOpenDialog;
    sbtnDuvida: TSpeedButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    function ValidarEAN(CodigoEan: String):boolean;
    function ValidarChar(palavra: String):boolean;
    procedure sbtnValidarClick(Sender: TObject);
    procedure sbtnSelecionarArquivoClick(Sender: TObject);
    procedure addItemArqNaList;
    procedure sbtnDuvidaClick(Sender: TObject);
  private
    listEAN: TStringList;
    arq: TextFile;
    {Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  memoCodigosNaoValidos.Clear;
  edtCaminhoArquivo.Clear;
  listEAN:= nil;
end;

procedure TfrmPrincipal.sbtnDuvidaClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrmPrincipal.sbtnSelecionarArquivoClick(Sender: TObject);
begin
  FileOpenDialog1.Title := 'Selecionar TXT';

  if FileOpenDialog1.Execute then
  begin
     edtCaminhoArquivo.Text:= FileOpenDialog1.FileName;
     AssignFile(arq, FileOpenDialog1.FileName);
     Reset(arq);
     if (IOResult = 0) then
     begin
        CloseFile(arq);
        Append(arq);
     end;
  end;
end;

procedure TfrmPrincipal.sbtnValidarClick(Sender: TObject);
var
  codEnviado: string;
  i: integer;
begin
  memoCodigosNaoValidos.Clear;

  if edtCaminhoArquivo.Text <> '' then
  begin
    if ContainsText(edtCaminhoArquivo.Text, ':\') then
    begin
      addItemArqNaList;
      for i := 0 to listEAN.Count - 1 do
      begin
        if not ValidarEAN(listEAN[i]) then
        begin
          memoCodigosNaoValidos.Lines.Add('Pos: '+ IntToStr(i+1) + ' - Cod: '+ listEAN[i]);
        end
      end;
    end
    else
    begin
       if Length(edtCaminhoArquivo.Text) = 13 then
       begin
           if ValidarChar(edtCaminhoArquivo.Text) then
           begin
              if ValidarEAN(edtCaminhoArquivo.Text) then
              begin
                ShowMessage('O C�digo EAN: ' + edtCaminhoArquivo.Text + ' � v�lido!');
              end
              else
              begin
                 memoCodigosNaoValidos.Lines.Add('Cod: '+ edtCaminhoArquivo.Text);
              end;
           end
           else
           begin
             ShowMessage('Conteudo Invalido');
           end;
       end
       else
       begin
         ShowMessage('Conteudo Invalido');
       end;
    end;
  end
  else
  begin
    ShowMessage('Escolha um arquivo!');
  end;
end;

function TfrmPrincipal.ValidarEAN(CodigoEan: String):boolean;
var
  DV, somaImparPar, somaPar, somaImpar,codigoEANInteger, i, DVCalc: integer;

begin
    somaPar:= 0;
    somaImpar:= 0;
    somaImparPar:= 0;
    DVCalc:= 0;

    if Length(CodigoEan) <> 13 then
    begin
      Result:= false;
    end
    else
    begin
      DV:=StrToInt(CodigoEan[13]);

      for i := 1 to 12 do
      begin
        codigoEANInteger:= StrToInt(CodigoEan[i]);
        if i mod 2 > 0 then
          somaImpar:= somaImpar+ codigoEANInteger;
        if i mod 2 = 0 then
          somaPar:= somaPar + codigoEANInteger;
      end;
      somaImpar:= somaImpar * 3;
      somaImparPar:= somaImpar + somaPar;

      for i := 0 to 9 do
      begin
         if (somaImparPar + i) mod 10 = 0 then
         begin
           DVCalc := i;
         end;
      end;

      if DVCalc = dv then
      begin
        Result:= true;
      end
      else
      begin
        Result:= false;
      end;
    end;
end;

procedure TfrmPrincipal.addItemArqNaList;
var
  i: integer;
  itemArquivo: String;
begin
  listEAN:= TStringList.Create;
  Reset(arq); { abre o arquivo texto para leitura }

  while (not eof(arq)) do
  begin
    Readln(arq, itemArquivo);
    listEAN.Add(itemArquivo);
  end;
  CloseFile(arq);
  Append(arq);
end;

function TfrmPrincipal.ValidarChar(palavra: String):boolean;
var
  i, count: integer;
begin
  count:= 0;

   for i := 1 to 13 do
   begin
      try
         StrToInt(palavra[i]);
         count:= count +1;
      except
         count:= count +0;
      end;
   end;
   if count = 13 then
   begin
      Result:= true;
   end
   else
   begin
       Result:= false;
   end;

end;

end.
