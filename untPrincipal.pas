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

    function ValidarEAN(CodigoEan: String):boolean;
    function ValidarChar(palavra: String):boolean;
    procedure FormCreate(Sender: TObject);
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
end;

procedure TfrmPrincipal.sbtnDuvidaClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrmPrincipal.sbtnSelecionarArquivoClick(Sender: TObject);
begin
  //Abre a tela para selecionar o aqruivo TXT

  FileOpenDialog1.Title := 'Selecionar TXT';

  //Se for selecionado algum arquivo, entrar� no if
  if FileOpenDialog1.Execute then
  begin
    // Coloca o caminho EDIT
     edtCaminhoArquivo.Text:= FileOpenDialog1.FileName;

     //Associa a variavel ARQ ao Arquivo selecionado
     AssignFile(arq, FileOpenDialog1.FileName);

     //Tenta abrir o arquivo, se ele existir, entrar� no IF
     //Assim fechamos o arquivo e disponivilizamos ele para futura manipula��o
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
   { Se no EDIT tiver o :\, sabemos que � um caminho
     Se n�o tiver, ele sabe que n�o foi selecionado
    um arquivo e provavelmente foi colocado um c�digo unitario  }

    if ContainsText(edtCaminhoArquivo.Text, ':\') then
    begin
      //Adiciona todas as linhas do arquivo em uma lista para fazer a manipula��o
      addItemArqNaList;

      //Caminha por todos os itens da lista
      for i := 0 to listEAN.Count - 1 do
      begin
        {Se o c�digo de alguma linha n�o for valido, ele adicionar� no MEMO
        com a posi��o que est� no arquivo e qual o c�digo }

        if ValidarChar(listEAN[i]) then
        begin
           if not ValidarEAN(listEAN[i]) then
            begin
              memoCodigosNaoValidos.Lines.Add('Pos: '+ IntToStr(i+1) + ' - Cod: '+ listEAN[i]);
            end
        end
        else
           memoCodigosNaoValidos.Lines.Add('Pos: '+ IntToStr(i+1) + ' - Cod: '+ listEAN[i]);
      end;
    end
    else
    begin
       //Verifica se o que foi digitado possui 13 digitos
       if Length(edtCaminhoArquivo.Text) = 13 then
       begin
           //Valida para verificar se s� foi digitado n�meros
           if ValidarChar(edtCaminhoArquivo.Text) then
           begin
              //Valida o c�digo de barras digitado
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
  listEAN:= TStringList.Create; // Instancia a Lista
  Reset(arq); { abre o arquivo texto para leitura }

  //Enquanto o arquivo n�o chegar o final, ele continua o la�o
  while (not eof(arq)) do
  begin

    // Le a linha, adiciona na var itemArquivo e logo depois na lista
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
   { Existe um contato que ir� somar mais 1 toda vez que um caracter for valido
    no final, se n�o tiver 13 caracteres validos, se entende que n�o � um c�digo v�lido.
    Futuramente o numeor 13 poder� ser alterado por uma v�riavel,
    dessa forma podemos validar n�o s� com 13 digitos.}

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
