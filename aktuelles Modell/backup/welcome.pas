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
    continueButton2: TButton;
    tutorialPanel: TPanel;
    tutorial: TButton;
    continueButton: TButton;
    sign1: TEdit;
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
   tutorialpanel.bringtofront;
   WindowState := wsmaximized;
   sign1.enabled := false;
   sign1.enabled := true;
end;

procedure Twelcomescreen.continueButtonClick(Sender: TObject);
begin
   mainProgram.show;
end;

procedure Twelcomescreen.tutorialClick(Sender: TObject);
begin
   tutorialpanel.visible := true;
   continuebutton2.visible := true;
end;

procedure Twelcomescreen.FormShow(Sender: TObject);
begin
  tutorial.enabled := false;
  tutorial.enabled := true;
end;

procedure Twelcomescreen.continueButton2Click(Sender: TObject);
begin
   tutorialpanel.visible := false;
   continuebutton2.visible := false;
end;

procedure Twelcomescreen.exitButtonClick(Sender: TObject);
begin
  close;
end;

end.

