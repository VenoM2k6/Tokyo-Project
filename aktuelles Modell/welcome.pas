unit welcome;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  main;

type

  { Twelcomescreen }

  Twelcomescreen = class(TForm)
    exitButton: TButton;
    continueButton: TButton;
    sign1: TEdit;
    sign2: TEdit;
    procedure continueButton2Click(Sender: TObject);
    procedure exitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tutorialClick(Sender: TObject);
    procedure continueButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  welcomescreen: Twelcomescreen;

implementation

{$R *.lfm}

{ Twelcomescreen }

procedure Twelcomescreen.FormCreate(Sender: TObject);
begin
   welcomescreen.Show;
   mainProgram.hide;
   WindowState := wsmaximized;

   //objects are presented in the middle of the screen
   sign1.left := screen.width div 2 - sign1.width div 2;
   continueButton.left := screen.width div 2 - continueButton.width div 2;
   exitButton.left := continueButton.left;
   sign2.left := screen.width div 2 - sign2.width div 2;
end;

procedure Twelcomescreen.continueButtonClick(Sender: TObject);
begin
   mainProgram.show;
end;

procedure Twelcomescreen.tutorialClick(Sender: TObject);
begin
   continuebutton.visible := true;
end;

procedure Twelcomescreen.FormShow(Sender: TObject);
begin
end;

procedure Twelcomescreen.continueButton2Click(Sender: TObject);
begin

   continuebutton.visible := false;
end;

procedure Twelcomescreen.exitButtonClick(Sender: TObject);
begin
  close;
end;

end.

