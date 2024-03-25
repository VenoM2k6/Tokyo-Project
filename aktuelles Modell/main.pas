unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  ExtCtrls, Buttons, TAGraph, Math, TASeries, TATransformations, TASources;

type

  { TmainProgram }

  TmainProgram = class(TForm)
    Chart: TChart;
    ChartLineSeries1: TLineSeries;
    ChartLineSeries2: TLineSeries;
    ChartLineSeries3: TLineSeries;
    createTable: TButton;
    Calculate: TButton;
    calculate2: TButton;
    calculate3: TButton;
    collapse2: TButton;
    collapse3: TButton;
    calculate1: TButton;
    deleteTable: TButton;
    damping2: TEdit;
    damping3: TEdit;
    edit1: TButton;
    collapse1: TButton;
    edit2: TButton;
    edit3: TButton;
    func1: TEdit;
    func2: TEdit;
    func3: TEdit;
    elongation2: TEdit;
    elongation3: TEdit;
    featherKonstant2: TEdit;
    featherKonstant3: TEdit;
    function2: TGroupBox;
    function3: TGroupBox;
    functionFilter: TRadioGroup;
    unitinfo: TMenuItem;
    temp2: TImage;
    temp1: TImage;
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
    table: TStringGrid;
    eye1: TImage;
    eye2: TImage;
    eye3: TImage;
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
    procedure calculate2Click(Sender: TObject);
    procedure calculate3Click(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure collapse1Click(Sender: TObject);
    procedure collapse2Click(Sender: TObject);
    procedure collapse3Click(Sender: TObject);
    procedure createNewFunctionClick(Sender: TObject);
    procedure createTableClick(Sender: TObject);
    procedure damping1Click(Sender: TObject);
    procedure damping1Exit(Sender: TObject);
    procedure damping2Click(Sender: TObject);
    procedure damping2Exit(Sender: TObject);
    procedure damping3Click(Sender: TObject);
    procedure damping3Exit(Sender: TObject);
    procedure deleteAllClick(Sender: TObject);
    procedure deleteTableClick(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure edit2Click(Sender: TObject);
    procedure edit3Click(Sender: TObject);
    procedure elongation1Click(Sender: TObject);
    procedure elongation1Exit(Sender: TObject);
    procedure elongation2Click(Sender: TObject);
    procedure elongation2Exit(Sender: TObject);
    procedure elongation3Click(Sender: TObject);
    procedure elongation3Exit(Sender: TObject);
    procedure eye1Click(Sender: TObject);
    procedure eye2Click(Sender: TObject);
    procedure eye3Click(Sender: TObject);
    procedure featherKonstant1Click(Sender: TObject);
    procedure featherKonstant1Exit(Sender: TObject);
    procedure featherKonstant2Click(Sender: TObject);
    procedure featherKonstant2Exit(Sender: TObject);
    procedure featherKonstant3Click(Sender: TObject);
    procedure featherKonstant3Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure functionFilterClick(Sender: TObject);
    procedure length1Click(Sender: TObject);
    procedure length1Exit(Sender: TObject);
    procedure length2Click(Sender: TObject);
    procedure length2Exit(Sender: TObject);
    procedure length3Click(Sender: TObject);
    procedure length3Exit(Sender: TObject);
    procedure locationFactor1Click(Sender: TObject);
    procedure locationFactor1Exit(Sender: TObject);
    procedure locationFactor2Click(Sender: TObject);
    procedure locationFactor2Exit(Sender: TObject);
    procedure locationFactor3Click(Sender: TObject);
    procedure locationFactor3Exit(Sender: TObject);
    procedure mass1Click(Sender: TObject);
    procedure mass1Exit(Sender: TObject);
    procedure mass2Click(Sender: TObject);
    procedure mass2Exit(Sender: TObject);
    procedure mass3Click(Sender: TObject);
    procedure mass3Exit(Sender: TObject);
    procedure unitinfoClick(Sender: TObject);
    procedure nameFunction1Click(Sender: TObject);
    procedure nameFunction1EditingDone(Sender: TObject);
    procedure nameFunction2Click(Sender: TObject);
    procedure nameFunction2EditingDone(Sender: TObject);
    procedure nameFunction3Click(Sender: TObject);
    procedure nameFunction3EditingDone(Sender: TObject);
    procedure setType1Change(Sender: TObject);
    procedure setType2Change(Sender: TObject);
    procedure setType3Change(Sender: TObject);
  private

  public

  end;

var
  //bugfixxing
  nameWasAlreadyOverwritten1 : boolean;
  nameWasAlreadyOverwritten2 : boolean;
  nameWasAlreadyOverwritten3 : boolean;
  mainProgram: TmainProgram;
  //check started
  shown: boolean;
  //eye
  clicked1, clicked2, clicked3: boolean;
  generated1, generated2, generated3: boolean;
  //functions
  functionCreated: array[0..8] of Boolean;
  //arrays for table
  function1table: array[0..4, 1..19999] of double;
  function2table: array[0..4, 1..19999] of double;
  function3table: array[0..4, 1..19999] of double;
  //caches for function stuff
  mass1cache, elongation1cache, length1cache, locationfactor1cache, featherkonstant1cache, damping1cache: real;
  mass2cache, elongation2cache, length2cache, locationfactor2cache, featherkonstant2cache, damping2cache: real;
  mass3cache, elongation3cache, length3cache, locationfactor3cache, featherkonstant3cache, damping3cache: real;
implementation

{$R *.lfm}

{ TmainProgram }

procedure TmainProgram.FormCreate(Sender: TObject);
begin
   //bugfixxing

   WindowState := wsmaximized;
  //eye
  eye1.picture := temp1.picture;
  eye2.picture := temp1.picture;
  eye3.picture := temp1.picture;

  generated1 := false;
  generated2 := false;
  generated3 := false;
  shown := false;
end;
procedure TmainProgram.FormShow(Sender: TObject);
begin
  if shown = false then begin
   mainProgram.hide;
   shown := true;
  end;
end;



//Editfields of function 1
procedure TmainProgram.setType1Change(Sender: TObject);
begin
  if setType1.itemindex = 0 then begin
     mass1.Visible := true;
     elongation1.visible := true;
     featherkonstant1.visible := true;
     length1.visible := false;
     locationfactor1.visible := false;
     damping1.visible := false;
  end;
  if setType1.itemindex = 1 then begin
     mass1.Visible := true;
     elongation1.visible := true;
     featherkonstant1.visible := true;
     length1.visible := false;
     locationfactor1.visible := false;
     damping1.visible := true;
  end;
  if setType1.itemindex = 2 then begin
     mass1.Visible := true;
     elongation1.visible := true;
     featherkonstant1.visible := false;
     length1.visible := true;
     locationfactor1.visible := true;
     damping1.visible := false;
  end;
  if setType1.itemindex = 3 then begin
     mass1.Visible := true;
     elongation1.visible := true;
     featherkonstant1.visible := false;
     length1.visible := true;
     locationfactor1.visible := true;
     damping1.visible := true;
  end;
end;
procedure TmainProgram.nameFunction1Click(Sender: TObject);
begin
  nameFunction1.text := '';
  nameWasAlreadyOverwritten1 := false;
end;
procedure TmainProgram.nameFunction1EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten1 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function1.caption := namefunction1.text;
     func1.text := function1.caption;
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
end;
procedure TmainProgram.mass1Exit(Sender: TObject);
begin
   if not trystrtofloat(mass1.text, mass1cache)
   then begin
      showmessage('Please enter a real number!');
      mass1.text := 'Mass';
   end
   else begin
      mass1.Text := 'Mass: ' + floattostr(mass1cache);
      //fixxes bug
      mass1.Enabled := false;
      mass1.enabled := true;
   end;
end;
procedure TmainProgram.length1Click(Sender: TObject);
begin
  length1.text := '';
end;
procedure TmainProgram.length1Exit(Sender: TObject);
begin
  if not trystrtofloat(length1.text, length1cache)
   then begin
      showmessage('Please enter a real number!');
      length1.text := 'Length';
   end
   else begin
      length1.Text := 'Length: ' + floattostr(length1cache);
      //fixxes bug
      length1.Enabled := false;
      length1.enabled := true;
   end;
end;
procedure TmainProgram.locationFactor1Click(Sender: TObject);
begin
  locationFactor1.text := '';
end;
procedure TmainProgram.locationFactor1Exit(Sender: TObject);
begin
  if not trystrtofloat(locationfactor1.text, locationfactor1cache)
   then begin
      showmessage('Please enter a real number!');
      locationfactor1.text := 'Location Factor';
   end
   else begin
      locationfactor1.Text := 'Locationfactor: ' + floattostr(locationfactor1cache);
      //fixxes bug
      locationfactor1.Enabled := false;
      locationfactor1.enabled := true;
   end;
end;
procedure TmainProgram.featherKonstant1Click(Sender: TObject);
begin
  featherKonstant1.text := '';
end;
procedure TmainProgram.featherKonstant1Exit(Sender: TObject);
begin
  if not trystrtofloat(featherkonstant1.text, featherkonstant1cache)
   then begin
      showmessage('Please enter a real number!');
      featherkonstant1.text := 'Feather Konstant';
   end
   else begin
      featherkonstant1.Text := 'Feather Konstant: ' + floattostr(featherkonstant1cache);
      //fixxes bug
      featherkonstant1.Enabled := false;
      featherkonstant1.enabled := true;
   end;
end;
procedure TmainProgram.elongation1Click(Sender: TObject);
begin
  elongation1.text := '';
end;
procedure TmainProgram.elongation1Exit(Sender: TObject);
begin
   if not trystrtofloat(elongation1.text, elongation1cache)
   then begin
      showmessage('Please enter a real number!');
      elongation1.text := 'Elongation';
   end
   else begin
      elongation1.Text := 'Elongation: ' + floattostr(elongation1cache);
      //fixxes bug
      elongation1.Enabled := false;
      elongation1.enabled := true;
   end;
end;
procedure TmainProgram.damping1Click(Sender: TObject);
begin
  damping1.text := '';
end;
procedure TmainProgram.damping1Exit(Sender: TObject);
begin
   if not trystrtofloat(damping1.text, damping1cache)
   then begin
      showmessage('Please enter a real number!');
      damping1.text := 'Damping';
   end
   else begin
      damping1.Text := 'Damping: ' + floattostr(damping1cache);
      //fixxes bug
      damping1.Enabled := false;
      damping1.enabled := true;
   end;
end;

//Editfields of function 2
procedure TmainProgram.setType2Change(Sender: TObject);
begin
   if setType2.itemindex = 0 then begin
     mass2.Visible := true;
     elongation2.visible := true;
     featherkonstant2.visible := true;
     length2.visible := false;
     locationfactor2.visible := false;
     damping2.visible := false;
  end;
  if setType2.itemindex = 1 then begin
     mass2.Visible := true;
     elongation2.visible := true;
     featherkonstant2.visible := true;
     length2.visible := false;
     locationfactor2.visible := false;
     damping2.visible := true;
  end;
  if setType2.itemindex = 2 then begin
     mass2.Visible := true;
     elongation2.visible := true;
     featherkonstant2.visible := false;
     length2.visible := true;
     locationfactor2.visible := true;
     damping2.visible := false;
  end;
  if setType2.itemindex = 3 then begin
     mass2.Visible := true;
     elongation2.visible := true;
     featherkonstant2.visible := false;
     length2.visible := true;
     locationfactor2.visible := true;
     damping2.visible := true;
  end;
end;
procedure TmainProgram.nameFunction2Click(Sender: TObject);
begin
  nameFunction2.text:='';
  nameWasAlreadyOverwritten2 := false;
end;
procedure TmainProgram.nameFunction2EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten2 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function2.caption := namefunction2.text;
     func2.text := function2.caption;
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
end;
procedure TmainProgram.mass2Exit(Sender: TObject);
begin
   if not trystrtofloat(mass2.text, mass2cache)
   then begin
      showmessage('Please enter a real number!');
      mass2.text := 'Mass';
   end
   else begin
      mass2.Text := 'Mass: ' + floattostr(mass2cache);
      //fixxes bug
      mass2.Enabled := false;
      mass2.enabled := true;
   end;
end;
procedure TmainProgram.length2Click(Sender: TObject);
begin
  length2.text := '';
end;
procedure TmainProgram.length2Exit(Sender: TObject);
begin
   if not trystrtofloat(length2.text, length2cache)
   then begin
      showmessage('Please enter a real number!');
      length2.text := 'Length';
   end
   else begin
      length2.Text := 'Length: ' + floattostr(length2cache);
      //fixxes bug
      length2.Enabled := false;
      length2.enabled := true;
   end;
end;
procedure TmainProgram.featherKonstant2Click(Sender: TObject);
begin
  featherKonstant2.text := '';
end;
procedure TmainProgram.featherKonstant2Exit(Sender: TObject);
begin
   if not trystrtofloat(featherkonstant2.text, featherkonstant2cache)
   then begin
      showmessage('Please enter a real number!');
      featherkonstant2.text := 'Feather Konstant';
   end
   else begin
      featherkonstant2.Text := 'Feather Konstant: ' + floattostr(featherkonstant2cache);
      //fixxes bug
      featherkonstant2.Enabled := false;
      featherkonstant2.enabled := true;
   end;
end;
procedure TmainProgram.elongation2Click(Sender: TObject);
begin
  elongation2.text := '';
end;
procedure TmainProgram.elongation2Exit(Sender: TObject);
begin
   if not trystrtofloat(elongation2.text, elongation2cache)
   then begin
      showmessage('Please enter a real number!');
      elongation2.text := 'Elongation';
   end
   else begin
      elongation2.Text := 'Elongation: ' + floattostr(elongation2cache);
      //fixxes bug
      elongation2.Enabled := false;
      elongation2.enabled := true;
   end;
end;
procedure TmainProgram.locationFactor2Click(Sender: TObject);
begin
  locationFactor2.text := '';
end;
procedure TmainProgram.locationFactor2Exit(Sender: TObject);
begin
   if not trystrtofloat(locationfactor2.text, locationfactor2cache)
   then begin
      showmessage('Please enter a real number!');
      locationfactor2.text := 'Location Factor';
   end
   else begin
      locationfactor2.Text := 'Locationfactor: ' + floattostr(locationfactor2cache);
      //fixxes bug
      locationfactor2.Enabled := false;
      locationfactor2.enabled := true;
   end;
end;
procedure TmainProgram.damping2Click(Sender: TObject);
begin
  damping2.text := '';
end;
procedure TmainProgram.damping2Exit(Sender: TObject);
begin
   if not trystrtofloat(damping2.text, damping2cache)
   then begin
      showmessage('Please enter a real number!');
      damping2.text := 'Damping';
   end
   else begin
      damping2.Text := 'Damping: ' + floattostr(damping2cache);
      //fixxes bug
      damping2.Enabled := false;
      damping2.enabled := true;
   end;
end;


//Editfields of function 3
procedure TmainProgram.setType3Change(Sender: TObject);
begin
  if setType3.itemindex = 0 then begin
     mass3.Visible := true;
     elongation3.visible := true;
     featherkonstant3.visible := true;
     length3.visible := false;
     locationfactor3.visible := false;
     damping3.visible := false;
  end;
  if setType3.itemindex = 1 then begin
     mass3.Visible := true;
     elongation3.visible := true;
     featherkonstant3.visible := true;
     length3.visible := false;
     locationfactor3.visible := false;
     damping3.visible := true;
  end;
  if setType3.itemindex = 2 then begin
     mass3.Visible := true;
     elongation3.visible := true;
     featherkonstant3.visible := false;
     length3.visible := true;
     locationfactor3.visible := true;
     damping3.visible := false;
  end;
  if setType3.itemindex = 3 then begin
     mass3.Visible := true;
     elongation3.visible := true;
     featherkonstant3.visible := false;
     length3.visible := true;
     locationfactor3.visible := true;
     damping3.visible := true;
  end;
end;
procedure TmainProgram.nameFunction3Click(Sender: TObject);
begin
  nameFunction3.text := '';
  nameWasAlreadyOverwritten3 := false;
end;
procedure TmainProgram.nameFunction3EditingDone(Sender: TObject);
begin
  if nameWasAlreadyOverwritten3 = false then begin //This if clause & Variable fixxes the bug of overwriting 'Name' onto the function1.caption
     function3.caption := namefunction3.text;
     func3.text := function3.caption;
  end;
  nameFunction3.text := 'Name';
  nameWasAlreadyOverwritten3 := true;

  //fix selection bug
  nameFunction3.enabled := false;
  nameFunction3.enabled := true;
end;

procedure TmainProgram.mass3Click(Sender: TObject);
begin
  mass3.text := '';
end;
procedure TmainProgram.mass3Exit(Sender: TObject);
begin
   if not trystrtofloat(mass3.text, mass3cache)
   then begin
      showmessage('Please enter a real number!');
      mass3.text := 'Mass';
   end
   else begin
      mass3.Text := 'Mass: ' + floattostr(mass3cache);
      //fixxes bug
      mass3.Enabled := false;
      mass3.enabled := true;
   end;
end;

procedure TmainProgram.unitinfoClick(Sender: TObject);
begin
  showmessage('Every unit input and calculation is based on the SI-Units, e.g. m for lengths, m/s for velocity and m/s^2 for acceleration');
end;

procedure TmainProgram.length3Click(Sender: TObject);
begin
  length3.text := '';
end;
procedure TmainProgram.length3Exit(Sender: TObject);
begin
   if not trystrtofloat(length3.text, length3cache)
   then begin
      showmessage('Please enter a real number!');
      length3.text := 'Length';
   end
   else begin
      length3.Text := 'Length: ' + floattostr(length3cache);
      //fixxes bug
      length3.Enabled := false;
      length3.enabled := true;
   end;
end;
procedure TmainProgram.featherKonstant3Click(Sender: TObject);
begin
  featherKonstant3.text := '';
end;
procedure TmainProgram.featherKonstant3Exit(Sender: TObject);
begin
   if not trystrtofloat(featherkonstant3.text, featherkonstant3cache)
   then begin
      showmessage('Please enter a real number!');
      featherkonstant3.text := 'Feather Konstant';
   end
   else begin
      featherkonstant3.Text := 'Feather Konstant: ' + floattostr(featherkonstant3cache);
      //fixxes bug
      featherkonstant3.Enabled := false;
      featherkonstant3.enabled := true;
   end;
end;
procedure TmainProgram.elongation3Click(Sender: TObject);
begin
  elongation3.text := '';
end;
procedure TmainProgram.elongation3Exit(Sender: TObject);
begin
   if not trystrtofloat(elongation3.text, elongation3cache)
   then begin
      showmessage('Please enter a real number!');
      elongation3.text := 'Elongation';
   end
   else begin
      elongation3.Text := 'Elongation: ' + floattostr(elongation3cache);
      //fixxes bug
      elongation3.Enabled := false;
      elongation3.enabled := true;
   end;
end;
procedure TmainProgram.locationFactor3Click(Sender: TObject);
begin
  locationFactor3.text := '';
end;
procedure TmainProgram.locationFactor3Exit(Sender: TObject);
begin
   if not trystrtofloat(locationfactor3.text, locationfactor3cache)
   then begin
      showmessage('Please enter a real number!');
      locationfactor3.text := 'Location Factor';
   end
   else begin
      locationfactor3.Text := 'Locationfactor: ' + floattostr(locationfactor3cache);
      //fixxes bug
      locationfactor3.Enabled := false;
      locationfactor3.enabled := true;
   end;
end;
procedure TmainProgram.damping3Click(Sender: TObject);
begin
  damping3.text := '';
end;
procedure TmainProgram.damping3Exit(Sender: TObject);
begin
   if not trystrtofloat(damping3.text, damping3cache)
   then begin
      showmessage('Please enter a real number!');
      damping3.text := 'Damping';
   end
   else begin
      damping3.Text := 'Damping: ' + floattostr(damping3cache);
      //fixxes bug
      damping3.Enabled := false;
      damping3.enabled := true;
   end;
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
   ChartLineSeries1.clear;
   ChartLineSeries2.clear;
   ChartLineSeries3.clear;

   func1.visible := false;
   func2.visible := false;
   func3.visible := false;

   eye1.visible := false;
   eye1.picture := temp1.picture;
   eye2.visible := false;
   eye2.picture := temp1.picture;
   eye3.visible := false;
   eye3.picture := temp1.picture;

   generated1 := false;
   generated2 := false;
   generated3 := false;

   //graph.picture := nil;

   function1.visible := false;
   function2.visible := false;
   function3.visible := false;

   setType1.ItemIndex := -1;
   setType2.ItemIndex := -1;
   setType3.ItemIndex := -1;
   setType1.text := 'Choose an oscillationtype';
   setType2.text := 'Choose an oscillationtype';
   setType3.text := 'Choose an oscillationtype';

   mass1.Visible := false;
   elongation1.visible := false;
   featherkonstant1.visible := false;
   length1.visible := false;
   locationfactor1.visible := false;
   damping1.visible := false;

   mass2.Visible := false;
   elongation2.visible := false;
   featherkonstant2.visible := false;
   length2.visible := false;
   locationfactor2.visible := false;
   damping2.visible := false;

   mass3.Visible := false;
   elongation3.visible := false;
   featherkonstant3.visible := false;
   length3.visible := false;
   locationfactor3.visible := false;
   damping3.visible := false;

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


procedure TmainProgram.deleteTableClick(Sender: TObject);
begin
  table.visible := false;
  functionFilter.visible := false;
end;

//maximize / minimze
procedure TmainProgram.edit1Click(Sender: TObject);
begin
   function1.height := 176;
   edit1.visible := false;
   function2.Top := function1.top + function1.height;
   function3.top := function2.top + function2.height;
end;
procedure TmainProgram.edit2Click(Sender: TObject);
begin
   function2.height := 176;
   edit2.visible := false;
   function3.top := function2.top + function2.height;
end;
procedure TmainProgram.edit3Click(Sender: TObject);
begin
   function3.height := 176;
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

//Calculation
procedure TmainProgram.calculate1Click(Sender: TObject);
var
  m, D, y, v, t, a, k, l, g, tsum: real;
  i, j: integer;
begin
  if setType1.ItemIndex = 0 then begin
    ChartLineSeries1.clear;
    m := mass1cache;
    D := featherkonstant1cache;
    y := elongation1cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function1table[0, i] := tsum;
           function1table[1, i] := y;
           function1table[2, i] := v;
           function1table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries1.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType1.ItemIndex = 1 then begin
    ChartLineSeries1.clear;
    m := mass1cache;
    D := featherkonstant1cache;
    y := elongation1cache;
    k := damping1cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function1table[0, i] := tsum;
           function1table[1, i] := y;
           function1table[2, i] := v;
           function1table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries1.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType1.ItemIndex = 2 then begin
    ChartLineSeries1.clear;
    m := mass1cache;
    y := elongation1cache;
    l := length1cache;
    g := locationfactor1cache;
    v := 0;
    D := (m*g)/l;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function1table[0, i] := tsum;
           function1table[1, i] := y;
           function1table[2, i] := v;
           function1table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries1.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType1.ItemIndex = 3 then begin
    ChartLineSeries1.clear;
    m := mass1cache;
    y := elongation1cache;
    k := damping1cache;
    l := length1cache;
    g := locationfactor1cache;
    D := (m*g)/l;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function1table[0, i] := tsum;
           function1table[1, i] := y;
           function1table[2, i] := v;
           function1table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries1.AddXY(i,(y+v*t));
           end;
      end;
  end;

  func1.visible := true;
  eye1.visible := true;
  generated1 := true;
  func1.text := function1.caption;
  createTable.visible :=true;
  chart.visible := true;
  end;
procedure TmainProgram.calculate2Click(Sender: TObject);
var
  m, D, y, v, t, a, k, l, g, tsum: real;
  i, j: integer;
begin
  if setType2.ItemIndex = 0 then begin
    ChartLineSeries2.clear;
    m := mass2cache;
    D := featherkonstant2cache;
    y := elongation2cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function2table[0, i] := tsum;
           function2table[1, i] := y;
           function2table[2, i] := v;
           function2table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries2.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType2.ItemIndex = 1 then begin
    ChartLineSeries2.clear;
    m := mass2cache;
    D := featherkonstant2cache;
    y := elongation2cache;
    k := damping2cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function2table[0, i] := tsum;
           function2table[1, i] := y;
           function2table[2, i] := v;
           function2table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries2.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType2.ItemIndex = 2 then begin
    ChartLineSeries2.clear;
    m := mass2cache;
    y := elongation2cache;
    l := length2cache;
    g := locationfactor2cache;
    v := 0;
    D := (m*g)/l;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function2table[0, i] := tsum;
           function2table[1, i] := y;
           function2table[2, i] := v;
           function2table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries2.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType2.ItemIndex = 3 then begin
    ChartLineSeries2.clear;
    m := mass2cache;
    y := elongation2cache;
    k := damping2cache;
    l := length2cache;
    g := locationfactor2cache;
    D := (m*g)/l;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function2table[0, i] := tsum;
           function2table[1, i] := y;
           function2table[2, i] := v;
           function2table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries2.AddXY(i,(y+v*t));
           end;
      end;
  end;

  func2.visible := true;
  eye2.visible := true;
  generated2 := true;
  func2.text := function2.caption;
  createTable.visible :=true;
  chart.visible := true;
end;
procedure TmainProgram.calculate3Click(Sender: TObject);
var
  m, D, y, v, t, a, k, l, g, tsum: real;
  i, j: integer;
begin
  if setType3.ItemIndex = 0 then begin
    ChartLineSeries3.clear;
    m := mass3cache;
    D := featherkonstant3cache;
    y := elongation3cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function3table[0, i] := tsum;
           function3table[1, i] := y;
           function3table[2, i] := v;
           function3table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries3.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType3.ItemIndex = 1 then begin
    ChartLineSeries3.clear;
    m := mass3cache;
    D := featherkonstant3cache;
    y := elongation3cache;
    k := damping3cache;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function3table[0, i] := tsum;
           function3table[1, i] := y;
           function3table[2, i] := v;
           function3table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries3.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType3.ItemIndex = 2 then begin
    ChartLineSeries3.clear;
    m := mass3cache;
    y := elongation3cache;
    l := length3cache;
    g := locationfactor3cache;
    v := 0;
    D := (m*g)/l;
    tsum := 0;
    for i:=0 to 19999 do begin
           t := 0.005;
           a := -(D/m)*y;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function3table[0, i] := tsum;
           function3table[1, i] := y;
           function3table[2, i] := v;
           function3table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries3.AddXY(i,(y+v*t));
           end;
      end;
  end;
  if setType3.ItemIndex = 3 then begin
    ChartLineSeries3.clear;
    m := mass3cache;
    y := elongation3cache;
    k := damping3cache;
    l := length3cache;
    g := locationfactor3cache;
    D := (m*g)/l;
    v := 0;
    tsum := 0;
    for i:=0 to 19998 do begin
           t := 0.005;
           a := -(D*y+k*v)/m;
           v := v+a*t;
           y := y+v*t;
           tsum := tsum + t;
           function3table[0, i] := tsum;
           function3table[1, i] := y;
           function3table[2, i] := v;
           function3table[3, i] := a;
           if i <= Chart.width then begin
             ChartLineSeries3.AddXY(i,(y+v*t));
           end;
      end;
  end;

  func3.visible := true;
  eye3.visible := true;
  generated3 := true;
  func3.text := function3.caption;
  createTable.visible :=true;
  chart.visible := true;
end;

//Visualization
procedure TmainProgram.eye1Click(Sender: TObject);
var
  j:integer;
begin
   if clicked1 = true then begin
    eye1.Picture := temp1.picture;
    clicked1 := false;
    if generated1 then begin
       ChartLineSeries1.Transparency := 0;
    end;
   end
   else begin
    eye1.Picture := temp2.picture;
    ChartLineSeries1.Transparency := 255;
    clicked1 := true;
    end;
   end;
procedure TmainProgram.eye2Click(Sender: TObject);
var
  j:integer;
begin
   if clicked2 = true then begin
    eye2.Picture := temp1.picture;
    clicked2 := false;
    if generated2 then begin
       ChartLineSeries2.Transparency := 0;
    end;
   end
   else begin
    eye2.Picture := temp2.picture;
    clicked2 := true;
    if generated2 then begin
       eye2.Picture := temp2.picture;
       ChartLineSeries2.Transparency := 255;
       clicked2 := true;
    end;
   end;
end;
procedure TmainProgram.eye3Click(Sender: TObject);
var
  j:integer;
begin
   if clicked3 = true then begin
    eye3.Picture := temp1.picture;
    clicked3 := false;
    if generated3 then begin
       ChartLineSeries3.Transparency := 0;
    end;
   end
   else begin
    eye3.Picture := temp2.picture;
    clicked3 := true;
    ChartLineSeries3.Transparency := 255;
   end;
end;
procedure TmainProgram.createTableClick(Sender: TObject);
begin
   functionFilter.visible := true;
   table.visible := true;
end;

//table
procedure TmainProgram.functionFilterClick(Sender: TObject);
var
  j:integer;
begin
    if functionFilter.itemindex = 0 then begin
       for j:=0 to 19999 do begin
         table.cells[0, j+2] := inttostr(j);
         table.cells[1, j+1] := floattostr(function1table[0, j]);
         table.cells[2, j+1] := floattostr(function1table[1, j]);
         table.cells[3, j+1] := floattostr(function1table[2, j]);
         table.cells[4, j+1] := floattostr(function1table[3, j]);
         end;
       end;
    if functionFilter.itemindex = 1 then begin
       for j:=0 to 19999 do begin
        table.cells[0, j+2] := inttostr(j);
         table.cells[1, j+1] := floattostr(function2table[0, j]);
         table.cells[2, j+1] := floattostr(function2table[1, j]);
         table.cells[3, j+1] := floattostr(function2table[2, j]);
         table.cells[4, j+1] := floattostr(function2table[3, j]);
         end;
       end;
    if functionFilter.itemindex = 2 then begin
       for j:=0 to 19999 do begin
        table.cells[0, j+2] := inttostr(j);
         table.cells[1, j+1] := floattostr(function3table[0, j]);
         table.cells[2, j+1] := floattostr(function3table[1, j]);
         table.cells[3, j+1] := floattostr(function3table[2, j]);
         table.cells[4, j+1] := floattostr(function3table[3, j]);
         end;
       end;
    if (functionFilter.itemindex = 0) AND (generated1 = false) then begin
       showmessage('You have not created the red function so far');
    end;
    if (functionFilter.itemindex = 1) AND (generated2 = false) then begin
       showmessage('You have not created the blue function so far');
    end;
    if (functionFilter.itemindex = 2) AND (generated3 = false) then begin
       showmessage('You have not created the green function so far');
    end;
end;


end.

