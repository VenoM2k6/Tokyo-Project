unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  height, width: integer;

implementation

{$R *.lfm}



{ TForm1 }
//Anfang Form Procedures
procedure TForm1.FormCreate(Sender: TObject);
begin
  height := screen.height;
  width := screen.width;
  CloseButton.Width := screen.width div 15;
  CloseButton.Height := screen.height div 15;
  CloseButton.Left := screen.width - CloseButton.width;
  CloseButton.Top := screen.height - 4* CloseButton.height;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;
//Anfang Button Procedures
procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  close;
end;


end.

