unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  ExtCtrls;

type

  { TmainProgram }

  TmainProgram = class(TForm)
    Calculate: TButton;
    collapse2: TButton;
    collapse3: TButton;
    damping2: TEdit;
    damping3: TEdit;
    edit1: TButton;
    collapse1: TButton;
    edit2: TButton;
    edit3: TButton;
    elongation2: TEdit;
    elongation3: TEdit;
    featherKonstant2: TEdit;
    featherKonstant3: TEdit;
    function2: TGroupBox;
    function3: TGroupBox;
    Graph: TImage;
    RecommendationMasse: TLabel;
    RecommandationLength: TLabel;
    RecommandationFetherkonstant: TLabel;
    RecommandationElongation: TLabel;
    RecommandationLocationFactor: TLabel;
    RecommandationDamping: TLabel;
    length2: TEdit;
    length3: TEdit;
    locationFactor2: TEdit;
    locationFactor3: TEdit;
    MainMenu1: TMainMenu;
    mass2: TEdit;
    mass3: TEdit;
    RefreshMenu: TMenuItem;
    StringGrid1: TStringGrid;
    Tutorial: TMenuItem;
    Settings: TMenuItem;
    CloseMenu: TMenuItem;
    Programcontrol: TMenuItem;
    nameFunction1: TEdit;
    nameFunction2: TEdit;
    nameFunction3: TEdit;
    setType1: TComboBox;
    deleteAll: TButton;
    createNewFunction: TButton;
    mass1: TEdit;
    length1: TEdit;
    featherKonstant1: TEdit;
    elongation1: TEdit;
    locationFactor1: TEdit;
    damping1: TEdit;
    function1: TGroupBox;
    setType2: TComboBox;
    setType3: TComboBox;
    procedure CalculateClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure collapse1Click(Sender: TObject);
    procedure collapse2Click(Sender: TObject);
    procedure collapse3Click(Sender: TObject);
    procedure createNewFunctionClick(Sender: TObject);
    procedure deleteAllClick(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure edit2Click(Sender: TObject);
    procedure edit3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nameFunction1Click(Sender: TObject);
    procedure nameFunction1EditingDone(Sender: TObject);
    procedure nameFunction2Click(Sender: TObject);
    procedure nameFunction2EditingDone(Sender: TObject);
    procedure nameFunction3Click(Sender: TObject);
    procedure nameFunction3EditingDone(Sender: TObject);
    procedure RefreshMenuClick(Sender: TObject);
  private

  public

  end;

var
  mainProgram: TmainProgram;
  functionCreated: array[0..8] of Boolean;

  //variables to fix bugs
  nameWasAlreadyOverwritten1,nameWasAlreadyOverwritten2,nameWasAlreadyOverwritten3: boolean;

implementation

{$R *.lfm}

{ TmainProgram }

procedure TmainProgram.FormCreate(Sender: TObject);
begin
  WindowState := wsmaximized;
end;

//Editfields of function 1
procedure TmainProgram.nameFunction1Click(Sender: TObject);
begin
  nameFunction1.text := '';
  nameWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.nameFunction1EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten1 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function1.caption := namefunction1.text;
  end;
  nameFunction1.text := 'Name';
  nameWasAlreadyOverwritten1 := true;

  //fix selection bug
  nameFunction1.enabled := false;
  nameFunction1.enabled := true;
end;

//Editfields of function 2
procedure TmainProgram.nameFunction2Click(Sender: TObject);
begin
  nameFunction2.text:='';
  nameWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.nameFunction2EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten2 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function2.caption := namefunction2.text;
  end;
  nameFunction2.text := 'Name';
  nameWasAlreadyOverwritten2 := true;

  //fix selection bug
  nameFunction2.enabled := false;
  nameFunction2.enabled := true;
end;

//Editfields of function 3
procedure TmainProgram.nameFunction3Click(Sender: TObject);
begin
  nameFunction3.text := '';
  nameWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.nameFunction3EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten3 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function3.caption := namefunction3.text;
  end;
  nameFunction3.text := 'Name';
  nameWasAlreadyOverwritten3 := true;

  //fix selection bug
  nameFunction3.enabled := false;
  nameFunction3.enabled := true;
end;



procedure TmainProgram.RefreshMenuClick(Sender: TObject);
begin
  ShowMessage ('Folgt demnächst');
end;

//Create / Delete Functions
procedure TmainProgram.createNewFunctionClick(Sender: TObject);
var
  i: integer;
begin
  //prüft und legt fest, ob eine Group Box schon benutzt wurde und zeigt die gewünschte an
  for i:=0 to 2 do begin
    if functionCreated[i] = false then begin
       functionCreated[i] := true;
       if i = 0 then begin
          function1.visible := true;
       end;
       if i = 1 then begin
          function2.visible := true;
       end;
       if i = 2 then begin
          function3.visible := true;
       end;
       exit;
    end;
    if functionCreated[2] = true then begin
       showmessage('You have reached the maximum of functions! You can either delete all by pressing "Delete All" or you press the delete Button on a specific function');
       exit;
    end;
  end;
end;
procedure TmainProgram.deleteAllClick(Sender: TObject);
var
  i: integer;
begin
   for i:=0 to 12do begin
     functionCreated[i] := false;
   end;
   function1.visible := false;
   function2.visible := false;
   function3.visible := false;
end;

//maximize / minimze
procedure TmainProgram.edit1Click(Sender: TObject);
begin
   function1.height := 184;
   edit1.visible := false;
   function2.Top := function1.top + function1.height;
   function3.top := function2.top + function2.height;
end;
procedure TmainProgram.edit2Click(Sender: TObject);
begin
   function2.height := 184;
   edit2.visible := false;
   function3.top := function2.top + function2.height;

end;
procedure TmainProgram.edit3Click(Sender: TObject);
begin
   function3.height := 184;
   edit3.visible := false;
end;
procedure TmainProgram.collapse1Click(Sender: TObject);
begin
   function1.height := edit1.height;
   edit1.visible := true;
   function2.Top := function1.top + function1.height;
   function3.top := function2.top + function2.height;
end;
procedure TmainProgram.collapse2Click(Sender: TObject);
begin
   function2.height := edit2.height;
   edit2.visible := true;
   function3.top := function2.top + function2.height;
end;
procedure TmainProgram.collapse3Click(Sender: TObject);
begin
   function3.height := edit3.height;
   edit3.visible := true;
end;


procedure TmainProgram.CloseMenuClick(Sender: TObject);
begin
  close;
end;

procedure TmainProgram.CalculateClick(Sender: TObject);
var count: integer;
begin
  with StringGrid1 do begin
    for count := 1 to 199 do begin
      cells [0, count] := floattostr (count);
    end;

  end;
end;



end.

