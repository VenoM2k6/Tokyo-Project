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
    calculate2: TButton;
    calculate3: TButton;
    collapse2: TButton;
    collapse3: TButton;
    calculate1: TButton;
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
    procedure calculate1Click(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure collapse1Click(Sender: TObject);
    procedure collapse2Click(Sender: TObject);
    procedure collapse3Click(Sender: TObject);
    procedure createNewFunctionClick(Sender: TObject);
    procedure damping1Click(Sender: TObject);
    procedure damping1EditingDone(Sender: TObject);
    procedure damping2Click(Sender: TObject);
    procedure damping2EditingDone(Sender: TObject);
    procedure damping3Click(Sender: TObject);
    procedure damping3EditingDone(Sender: TObject);
    procedure deleteAllClick(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure edit2Click(Sender: TObject);
    procedure edit3Click(Sender: TObject);
    procedure elongation1Click(Sender: TObject);
    procedure elongation1EditingDone(Sender: TObject);
    procedure elongation2Click(Sender: TObject);
    procedure elongation2EditingDone(Sender: TObject);
    procedure elongation3Click(Sender: TObject);
    procedure elongation3EditingDone(Sender: TObject);
    procedure featherKonstant1Click(Sender: TObject);
    procedure featherKonstant1EditingDone(Sender: TObject);
    procedure featherKonstant2Click(Sender: TObject);
    procedure featherKonstant2EditingDone(Sender: TObject);
    procedure featherKonstant3Click(Sender: TObject);
    procedure featherKonstant3EditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure length1Click(Sender: TObject);
    procedure length1EditingDone(Sender: TObject);
    procedure length2Click(Sender: TObject);
    procedure length2EditingDone(Sender: TObject);
    procedure length3Click(Sender: TObject);
    procedure length3EditingDone(Sender: TObject);
    procedure locationFactor1Click(Sender: TObject);
    procedure locationFactor1EditingDone(Sender: TObject);
    procedure locationFactor2Click(Sender: TObject);
    procedure locationFactor2EditingDone(Sender: TObject);
    procedure locationFactor3Click(Sender: TObject);
    procedure locationFactor3EditingDone(Sender: TObject);
    procedure mass1Click(Sender: TObject);
    procedure mass1EditingDone(Sender: TObject);
    procedure mass2Click(Sender: TObject);
    procedure mass2EditingDone(Sender: TObject);
    procedure mass3Click(Sender: TObject);
    procedure mass3EditingDone(Sender: TObject);
    procedure nameFunction1Click(Sender: TObject);
    procedure nameFunction1EditingDone(Sender: TObject);
    procedure nameFunction2Click(Sender: TObject);
    procedure nameFunction2EditingDone(Sender: TObject);
    procedure nameFunction3Click(Sender: TObject);
    procedure nameFunction3EditingDone(Sender: TObject);
    procedure setType1Change(Sender: TObject);
  private

  public

  end;

var
  mainProgram: TmainProgram;
  //functions
  functionCreated: array[0..8] of Boolean;
  //arrays for table
  function1table: array[1..4, 1..3999] of real;
  function2table: array[1..4, 1..3999] of real;
  function3table: array[1..4, 1..3999] of real;
  function4table: array[1..4, 1..3999] of real;

  mass1cache, elongation1cache, length1cache, locationfactor1cache, featherkonstant1cache, damping1cache: real;
  mass2cache, elongation2cache, length2cache, locationfactor2cache, featherkonstant2cache, damping2cache: real;
  mass3cache, elongation3cache, length3cache, locationfactor3cache, featherkonstant3cache, damping3cache: real;

  //variables to fix bugs
  nameWasAlreadyOverwritten1,nameWasAlreadyOverwritten2,nameWasAlreadyOverwritten3: boolean;
  dampingWasAlreadyOverwritten1,dampingWasAlreadyOverwritten2,dampingWasAlreadyOverwritten3: boolean;
  locationfactorWasAlreadyOverwritten1,locationfactorWasAlreadyOverwritten2,locationfactorWasAlreadyOverwritten3: boolean;
  elongationWasAlreadyOverwritten1,elongationWasAlreadyOverwritten2,elongationWasAlreadyOverwritten3: boolean;
  featherkonstantWasAlreadyOverwritten1,featherkonstantWasAlreadyOverwritten2,featherkonstantWasAlreadyOverwritten3: boolean;
  lengthWasAlreadyOverwritten1,lengthWasAlreadyOverwritten2,lengthWasAlreadyOverwritten3: boolean;
  massWasAlreadyOverwritten1,massWasAlreadyOverwritten2,massWasAlreadyOverwritten3: boolean;
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
procedure TmainProgram.mass1Click(Sender: TObject);
begin
  mass1.text := '';
  massWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.mass1EditingDone(Sender: TObject);
begin
   if massWasAlreadyOverwritten1 = false then begin
      mass1cache := strtofloat(mass1.text);
      mass1.text := 'Mass: ' + mass1.text;
   end;
   massWasAlreadyOverwritten1 := true;
   mass1.enabled := false;
   mass1.enabled := true;
end;
procedure TmainProgram.length1Click(Sender: TObject);
begin
  length1.text := '';
  lengthWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.length1EditingDone(Sender: TObject);
begin
  if lengthWasAlreadyOverwritten1 = false then begin
      length1cache := strtofloat(length1.text);
      length1.text := 'Length: ' + length1.text;
   end;
   lengthWasAlreadyOverwritten1 := true;
   length1.enabled := false;
   length1.enabled := true;
end;
procedure TmainProgram.locationFactor1Click(Sender: TObject);
begin
  locationFactor1.text := '';
  locationFactorWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.locationFactor1EditingDone(Sender: TObject);
begin
   if locationfactorWasAlreadyOverwritten1 = false then begin
      locationfactor1cache := strtofloat(locationfactor1.text);
      locationfactor1.text := 'Location Factor: ' + locationfactor1.text;
   end;
   locationfactorWasAlreadyOverwritten1 := true;
   locationfactor1.enabled := false;
   locationfactor1.enabled := true;
end;
procedure TmainProgram.featherKonstant1Click(Sender: TObject);
begin
  featherKonstant1.text := '';
  featherkonstantWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.featherKonstant1EditingDone(Sender: TObject);
begin
  if featherkonstantWasAlreadyOverwritten1 = false then begin
     featherkonstant1cache := strtofloat(featherkonstant1.text);
     featherkonstant1.text := 'Feather Konstant: ' + featherkonstant1.text;
   end;
   featherkonstantWasAlreadyOverwritten1 := true;
   featherkonstant1.enabled := false;
   featherkonstant1.enabled := true;
end;
procedure TmainProgram.elongation1Click(Sender: TObject);
begin
  elongation1.text := '';
  elongationWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.elongation1EditingDone(Sender: TObject);
begin
   if elongationWasAlreadyOverwritten1 = false then begin
      elongation1cache := strtofloat(elongation1.text);
      elongation1.text := 'Elongation: ' + elongation1.text;
   end;
   elongationWasAlreadyOverwritten1 := true;
   elongation1.enabled := false;
   elongation1.enabled := true;
end;
procedure TmainProgram.damping1Click(Sender: TObject);
begin
  damping1.text := '';
  dampingWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.damping1EditingDone(Sender: TObject);
begin
   if dampingWasAlreadyOverwritten1 = false then begin
      damping1cache := strtofloat(damping1.text);
      damping1.text := 'Damping: ' + damping1.text;
   end;
   dampingWasAlreadyOverwritten1 := true;
   damping1.enabled := false;
   damping1.enabled := true;
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
procedure TmainProgram.mass2Click(Sender: TObject);
begin
  mass2.text := '';
  massWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.mass2EditingDone(Sender: TObject);
begin
   if massWasAlreadyOverwritten2 = false then begin
      mass2cache := strtofloat(mass2.text);
      mass2.text := 'Mass: ' + mass2.text;
   end;
   massWasAlreadyOverwritten2 := true;
   mass2.enabled := false;
   mass2.enabled := true;
end;
procedure TmainProgram.length2Click(Sender: TObject);
begin
  length2.text := '';
  lengthWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.length2EditingDone(Sender: TObject);
begin
   if lengthWasAlreadyOverwritten2 = false then begin
      length2cache := strtofloat(length2.text);
      length2.text := 'Length: ' + length2.text;
   end;
   lengthWasAlreadyOverwritten2 := true;
   length2.enabled := false;
   length2.enabled := true;
end;
procedure TmainProgram.featherKonstant2Click(Sender: TObject);
begin
  featherKonstant2.text := '';
  featherkonstantWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.featherKonstant2EditingDone(Sender: TObject);
begin
   if featherkonstantWasAlreadyOverwritten2 = false then begin
      featherkonstant2cache := strtofloat(featherkonstant2.text);
      featherkonstant2.text := 'Feather Konstant: ' + featherkonstant2.text;
   end;
   featherkonstantWasAlreadyOverwritten2 := true;
   featherkonstant2.enabled := false;
   featherkonstant2.enabled := true;
end;
procedure TmainProgram.elongation2Click(Sender: TObject);
begin
  elongation2.text := '';
  elongationWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.elongation2EditingDone(Sender: TObject);
begin
   if elongationWasAlreadyOverwritten2 = false then begin
      elongation2cache := strtofloat(elongation2.text);
      elongation2.text := 'Elongation: ' + elongation2.text;
   end;
   elongationWasAlreadyOverwritten2 := true;
   elongation2.enabled := false;
   elongation2.enabled := true;
end;
procedure TmainProgram.locationFactor2Click(Sender: TObject);
begin
  locationFactor2.text := '';
  locationFactorWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.locationFactor2EditingDone(Sender: TObject);
begin
   if locationfactorWasAlreadyOverwritten2 = false then begin
      locationfactor2cache := strtofloat(locationfactor2.text);
      locationfactor2.text := 'Location Factor: ' + locationfactor2.text;
   end;
   locationfactorWasAlreadyOverwritten2 := true;
   locationfactor2.enabled := false;
   locationfactor2.enabled := true;
end;
procedure TmainProgram.damping2Click(Sender: TObject);
begin
  damping2.text := '';
  dampingWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.damping2EditingDone(Sender: TObject);
begin
   if dampingWasAlreadyOverwritten2 = false then begin
      damping2cache := strtofloat(damping2.text);
      damping2.text := 'Damping: ' + damping2.text;
   end;
   dampingWasAlreadyOverwritten2 := true;
   damping2.enabled := false;
   damping2.enabled := true;
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

procedure TmainProgram.setType1Change(Sender: TObject);
begin
  if setType1.itemindex = 0 then begin
     mass1.Visible := true;
  end;
  if setType1.itemindex = 1 then begin

  end;
  if setType1.itemindex = 2 then begin

  end;
  if setType1.itemindex = 3 then begin

  end;
end;

procedure TmainProgram.mass3Click(Sender: TObject);
begin
  mass3.text := '';
  massWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.mass3EditingDone(Sender: TObject);
begin
   if massWasAlreadyOverwritten3 = false then begin
      mass3cache := strtofloat(mass3.text);
      mass3.text := 'Mass: ' + mass3.text;
   end;
   massWasAlreadyOverwritten3 := true;
   mass3.enabled := false;
   mass3.enabled := true;
end;
procedure TmainProgram.length3Click(Sender: TObject);
begin
   length3.text := '';
  lengthWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.length3EditingDone(Sender: TObject);
begin
   if lengthWasAlreadyOverwritten3 = false then begin
      length3cache := strtofloat(length3.text);
      length3.text := 'Length: ' + length3.text;
   end;
   lengthWasAlreadyOverwritten3 := true;
   length3.enabled := false;
   length3.enabled := true;
end;
procedure TmainProgram.featherKonstant3Click(Sender: TObject);
begin
  featherKonstant3.text := '';
  featherkonstantWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.featherKonstant3EditingDone(Sender: TObject);
begin
   if featherkonstantWasAlreadyOverwritten3 = false then begin
      featherkonstant3cache := strtofloat(featherkonstant3.text);
      featherkonstant3.text := 'Feather Konstant: ' + featherkonstant3.text;
   end;
   featherkonstantWasAlreadyOverwritten3 := true;
   featherkonstant3.enabled := false;
   featherkonstant3.enabled := true;
end;
procedure TmainProgram.elongation3Click(Sender: TObject);
begin
  elongation3.text := '';
  elongationWasAlreadyOverwritten3:= false;
end;
procedure TmainProgram.elongation3EditingDone(Sender: TObject);
begin
   if elongationWasAlreadyOverwritten3 = false then begin
      elongation3cache := strtofloat(elongation3.text);
      elongation3.text := 'Elongation: ' + elongation3.text;
   end;
   elongationWasAlreadyOverwritten3 := true;
   elongation3.enabled := false;
   elongation3.enabled := true;
end;
procedure TmainProgram.locationFactor3Click(Sender: TObject);
begin
  locationFactor3.text := '';
  locationFactorWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.locationFactor3EditingDone(Sender: TObject);
begin
   if locationfactorWasAlreadyOverwritten3 = false then begin
      locationfactor3cache := strtofloat(locationfactor3.text);
      locationfactor3.text := 'Location Factor: ' + locationfactor3.text;
   end;
   locationfactorWasAlreadyOverwritten3 := true;
   locationfactor3.enabled := false;
   locationfactor3.enabled := true;
end;
procedure TmainProgram.damping3Click(Sender: TObject);
begin
  damping3.text := '';
  dampingWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.damping3EditingDone(Sender: TObject);
begin
   if dampingWasAlreadyOverwritten3 = false then begin
      damping3cache := strtofloat(damping3.text);
      damping3.text := 'Damping: ' + damping3.text;
   end;
   dampingWasAlreadyOverwritten3 := true;
   damping3.enabled := false;
   damping3.enabled := true;
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
   mass1.text := 'Mass';
   length1.text := 'Length';
   featherkonstant1.text := 'Feather Konstant';
   elongation1.text := 'Elongation';
   locationfactor1.text := 'Location Factor';
   damping1.text := 'Damping';
   mass2.text := 'Mass';
   length2.text := 'Length';
   featherkonstant2.text := 'Feather Konstant';
   elongation2.text := 'Elongation';
   locationfactor2.text := 'Location Factor';
   damping2.text := 'Damping';
   mass3.text := 'Mass';
   length3.text := 'Length';
   featherkonstant3.text := 'Feather Konstant';
   elongation3.text := 'Elongation';
   locationfactor3.text := 'Location Factor';
   damping3.text := 'Damping';
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

//calculationarea
procedure TmainProgram.calculate1Click(Sender: TObject);
var
  m, D, y, v, t, a, tsum: real;
  i: integer;
begin
   if setType1.ItemIndex = 0 then begin
    m := mass1cache;
    D := featherkonstant1cache;
    y := elongation1cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function1table[1, i] := tsum;
           function1table[2, i] := y;
           function1table[3, i] := v;
           function1table[4, i] := a;
      end;
  end;
end;






end.

