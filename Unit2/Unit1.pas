unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit5: TEdit;
    Label5: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  strl: TStringList;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i, k, y: integer;
  f: string;
begin
  y := Memo1.CaretPos.Y;
  for i:= 1 to Memo1.Lines.Count-1 do
  if (i = y) then
    begin
      f:= Memo1.Lines[i];
      k:= Pos(' ', f);
      Edit1.Text:= Copy(f, 1, k-1);
      delete(f, 1, k);
      k:= Pos(' ', f);
      Edit2.Text:= Copy(f, 1, k-1);
      delete(f, 1, k);
      k:= Pos(' ', f);
      Edit3.Text:= Copy(f, 1, k-1);
      delete(f, 1, k-1);
      Edit4.Text:= Copy(f, 2, 10);
      delete(f, 1, 10);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines[0] := '�������, ���, ��������, ���.';
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Add(Edit1.Text+' '+Edit2.Text+' '+Edit3.Text+' '+Edit4.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i: integer;
  f, s, k, m: string;
begin
  k:= copy(Edit5.Text, Length(Edit5.Text)-8,4); //
  m:= copy(Edit5.Text, Length(Edit5.Text)-3,4);

  for i:= 1 to Memo1.Lines.Count-1 do
  begin
    f:= Memo1.Lines[i];
    s:= copy(Memo1.Lines[i],Length(Memo1.Lines[i])-3,4);
    if (StrToInt(s)>=StrToInt(k)) and (StrToInt(s)<=StrToInt(m)) then
    begin
      ShowMessage(f);
    end;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to Memo1.Lines.Count-1 do
    strl.Add(Memo1.Lines[i]);
    strl.SaveToFile('D:\nariman.txt');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  strl:= TStringList.Create;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('D:\nariman.txt');
end;

end.
