unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Berechnen: TButton;
    GraphErstellen: TButton;
    closeButton: TButton;
    Masse: TEdit;
    Federkonstante: TEdit;
    Elongation: TEdit;
    graph: TImage;
    Daempfung: TEdit;
    Topper: TPanel;
    selectType: TRadioGroup;
    values: TStringGrid;
    procedure BerechnenClick(Sender: TObject);
    procedure closeButtonClick(Sender: TObject);
    procedure DaempfungClick(Sender: TObject);
    procedure ElongationClick(Sender: TObject);
    procedure FederkonstanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphErstellenClick(Sender: TObject);
    procedure MasseClick(Sender: TObject);
    procedure selectTypeClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i, j, height, width: integer;

implementation

{$R *.lfm}



{ TForm1 }
//Anfang Form Procedures
procedure TForm1.FormCreate(Sender: TObject);
begin
  height := screen.height;
  width := screen.width;

  graph.width := Round(screen.width*0.4);
  graph.height := screen.height div 2;
  graph.top := screen.height div 2 - graph.height div 2;
  graph.left := screen.width div 2 - graph.width div 2;
  closeButton.Width := screen.width div 15;
  closeButton.Height := screen.height div 15;
  closeButton.Left := screen.width div 2 - closeButton.width div 2;
  closeButton.Top := Round((graph.top + graph.height)*1.05);

  values.width := Round((screen.width - (graph.left+graph.width))) + screen.width div 20;
  values.height := (screen.height div 3)*2;
  values.left := Round((graph.width+graph.left));
  values.top := screen.height div 2 - values.height div 2;
  values.DefaultColWidth := values.DefaultColWidth * 2;

  Topper.Width := screen.width;
  Topper.Height := values.top div 2;
  Topper.top := 0;
  Topper.left := 0;

  selectType.height := screen.height div 8;
  selectType.Top := screen.height div 2 - selectType.height;
  selectType.width :=  screen.width div 7;
  selectType.Left := screen.width div 55;

  Masse.Height := screen.height div 28;
  Masse.Width := screen.width div 14;
  Masse.Top := selectType.top + Masse.height div 2;
  Masse.left := selectType.left + selectType.width + Masse.width div 6;

  Federkonstante.Height := screen.height div 28;
  Federkonstante.Width := screen.width div 14;
  Federkonstante.Top := Masse.top + Federkonstante.height;
  Federkonstante.left := Masse.left;

  Elongation.Height := screen.height div 28;
  Elongation.Width := screen.width div 14;
  Elongation.Top := Federkonstante.top + Elongation.height;
  Elongation.left := Masse.left;

  Daempfung.Height := screen.height div 28;
  Daempfung.Width := screen.width div 14;
  Daempfung.Top := Elongation.top + Elongation.height;
  Daempfung.left := Masse.left;

  Berechnen.height := Masse.height;
  Berechnen.width := selectType.width;
  Berechnen.left := selectType.Left;
  Berechnen.top := selectType.top + selectType.height + Berechnen.height div 2;

  GraphErstellen.height := Berechnen.height;
  GraphErstellen.left := Berechnen.left;
  GraphErstellen.width := Berechnen.width;
  GraphErstellen.top := Berechnen.top + Berechnen.height;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  values.rowcount:=19999;
  values.colcount:=4;
end;

procedure TForm1.GraphErstellenClick(Sender: TObject);
var j: integer;
begin
   for j:=0 to 19998 do begin
       with graph do begin
          if selectType.itemindex = 0 then begin
             canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*10000)] := clred;
          end;
          if selectType.itemindex = 1 then begin
             canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*10000)] := clblue;
          end;
       end;
   end;
end;
procedure TForm1.BerechnenClick(Sender: TObject);

var i: integer;
    m,D,y,k,v,a,t, tsum: real;
begin

if selectType.ItemIndex = 0 then begin
  m := strtofloat(Masse.Text);
  D := strtofloat(Federkonstante.Text);
  y := strtofloat(Elongation.Text);
  v := 0;
  tsum := 0;
  for i:=0 to 19998 do begin
         t := 0.0005;
         a := -(D/m)*y;
         v := v+a*t;
         y := y+v*t;
         tsum := tsum + t;
         with values do begin
            cells[0, i] := floattostr(tsum);
            cells[1, i] := floattostr(y);
            cells[2, i] := floattostr(v);
            cells[3, i] := floattostr(a);
         end;
    end;
end;
if selectType.ItemIndex = 1 then begin

  m := strtofloat(Masse.Text);
  D := strtofloat(Federkonstante.Text);
  y := strtofloat(Elongation.Text);
  k := strtofloat(Daempfung.text);
  v := 0;
  tsum := 0;
  for i:=0 to 19998 do begin
         t := 0.0005;
         a := -(D*y+k*v)/m;
         v := v+a*t;
         y := y+v*t;
         tsum := tsum + t;
         with values do begin
            cells[0, i] := floattostr(tsum);
            cells[1, i] := floattostr(y);
            cells[2, i] := floattostr(v);
            cells[3, i] := floattostr(a);
         end;
    end;
end;

Elongation.text := 'Elongation';
Masse.text := 'Masse';
Federkonstante.text := 'Federkonstante';
Daempfung.text := 'Dämpfung';
end;
procedure TForm1.selectTypeClick(Sender: TObject);
begin
  if selectType.ItemIndex = 0 then begin
     Elongation.visible := true;
     Masse.visible := true;
     Federkonstante.visible := true;
     Berechnen.visible := true;
     GraphErstellen.visible := true;
     Daempfung.visible := false;
  end;
  if selectType.ItemIndex = 1 then begin
     Elongation.visible := true;
     Masse.visible := true;
     Federkonstante.visible := true;
     Daempfung.visible := true;
     Berechnen.visible := true;
     GraphErstellen.visible := true;
  end;
  Elongation.text := 'Elongation';
  Masse.text := 'Masse';
  Federkonstante.text := 'Federkonstante';
  Daempfung.text := 'Dämpfung';
end;

//Anfang Button Procedures

procedure TForm1.MasseClick(Sender: TObject);
begin
  Masse.text := '';
end;

procedure TForm1.closeButtonClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.DaempfungClick(Sender: TObject);
begin
   Daempfung.text := '';
end;

procedure TForm1.ElongationClick(Sender: TObject);
begin
  Elongation.text := '';
end;

procedure TForm1.FederkonstanteClick(Sender: TObject);
begin
  Federkonstante.text := '';
end;

end.

