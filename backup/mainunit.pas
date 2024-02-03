unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    closeButton: TButton;
    graph: TImage;
    values: TStringGrid;
    procedure closeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
//Anfang Button Procedures
procedure TForm1.closeButtonClick(Sender: TObject);
begin
  close;
end;


end.

