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
    values: TStringGrid;
    procedure BerechnenClick(Sender: TObject);
    procedure closeButtonClick(Sender: TObject);
    procedure ElongationClick(Sender: TObject);
    procedure FederkonstanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphErstellenClick(Sender: TObject);
    procedure MasseClick(Sender: TObject);
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

  values.width := Round((screen.width - (graph.left+graph.width))*0.76);
  values.height := (screen.height div 3)*2;
  values.left := Round((graph.width+graph.left)*1.05);
  values.top := screen.height div 2 - values.height div 2;

  with graph do begin
     for i:=1 to graph.width do begin
        for j:=1 to graph.Height do begin
           canvas.pixels[i, j]:=clwhite;
        end;
     end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TForm1.GraphErstellenClick(Sender: TObject);
var j: integer;
begin
   for j:=0 to 399 do begin
       with graph do begin
          canvas.Pixels[j+1, graph.height div 2 + round(strtofloat(values.cells[1, j])*100000)] := clred;
       end;
   end;
end;
procedure TForm1.BerechnenClick(Sender: TObject);

var i: integer;
    m,D,y,v,a,t: real;
begin
m := strtofloat(Masse.Text);
D := strtofloat(Federkonstante.Text);
y := strtofloat(Elongation.Text);

for i:=0 to 399 do begin
         t := 0.01;
         a := -(D/m)*y;
         v := a*t;
         y := y+v*t;
         with values do begin
            cells[1, i] := floattostr(y);
            cells[2, i] := floattostr(v);
            cells[3, i] := floattostr(a);
         end;
    end;

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

procedure TForm1.ElongationClick(Sender: TObject);
begin
  Elongation.text := '';
end;

procedure TForm1.FederkonstanteClick(Sender: TObject);
begin
  Federkonstante.text := '';
end;

end.

