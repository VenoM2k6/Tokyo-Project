unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TmainProgram }

  TmainProgram = class(TForm)
    collapse1: TButton;
    collapse2: TButton;
    collapse3: TButton;
    collapse4: TButton;
    collapse5: TButton;
    collapse6: TButton;
    collapse7: TButton;
    collapse8: TButton;
    damping2: TEdit;
    damping3: TEdit;
    damping4: TEdit;
    damping5: TEdit;
    damping6: TEdit;
    damping7: TEdit;
    damping8: TEdit;
    damping9: TEdit;
    edit: TButton;
    collapse: TButton;
    edit1: TButton;
    edit2: TButton;
    edit3: TButton;
    edit4: TButton;
    edit5: TButton;
    edit6: TButton;
    edit7: TButton;
    edit8: TButton;
    elongation2: TEdit;
    elongation3: TEdit;
    elongation4: TEdit;
    elongation5: TEdit;
    elongation6: TEdit;
    elongation7: TEdit;
    elongation8: TEdit;
    elongation9: TEdit;
    featherKonstant2: TEdit;
    featherKonstant3: TEdit;
    featherKonstant4: TEdit;
    featherKonstant5: TEdit;
    featherKonstant6: TEdit;
    featherKonstant7: TEdit;
    featherKonstant8: TEdit;
    featherKonstant9: TEdit;
    function2: TGroupBox;
    function3: TGroupBox;
    function4: TGroupBox;
    function5: TGroupBox;
    function6: TGroupBox;
    function7: TGroupBox;
    function8: TGroupBox;
    function9: TGroupBox;
    length2: TEdit;
    length3: TEdit;
    length4: TEdit;
    length5: TEdit;
    length6: TEdit;
    length7: TEdit;
    length8: TEdit;
    length9: TEdit;
    locationFactor2: TEdit;
    locationFactor3: TEdit;
    locationFactor4: TEdit;
    locationFactor5: TEdit;
    locationFactor6: TEdit;
    locationFactor7: TEdit;
    locationFactor8: TEdit;
    locationFactor9: TEdit;
    mass1: TEdit;
    mass2: TEdit;
    mass3: TEdit;
    mass4: TEdit;
    mass5: TEdit;
    mass6: TEdit;
    mass7: TEdit;
    mass8: TEdit;
    nameFunction1: TEdit;
    nameFunction2: TEdit;
    nameFunction3: TEdit;
    nameFunction4: TEdit;
    nameFunction5: TEdit;
    nameFunction6: TEdit;
    nameFunction7: TEdit;
    nameFunction8: TEdit;
    nameFunction9: TEdit;
    setType: TComboBox;
    deleteAll: TButton;
    createNewFunction: TButton;
    mass: TEdit;
    length1: TEdit;
    featherKonstant1: TEdit;
    elongation1: TEdit;
    locationFactor1: TEdit;
    damping1: TEdit;
    function1: TGroupBox;
    setType1: TComboBox;
    setType2: TComboBox;
    setType3: TComboBox;
    setType4: TComboBox;
    setType5: TComboBox;
    setType6: TComboBox;
    setType7: TComboBox;
    setType8: TComboBox;
    procedure collapseClick(Sender: TObject);
    procedure createNewFunctionClick(Sender: TObject);
    procedure deleteAllClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private

  public

  end;

var
  mainProgram: TmainProgram;
  functionCreated: array[0..8] of Boolean;

implementation

{$R *.lfm}

{ TmainProgram }

procedure TmainProgram.FormCreate(Sender: TObject);
begin
  WindowState := wsmaximized;
end;

procedure TmainProgram.ListBox1Click(Sender: TObject);
begin

end;

procedure TmainProgram.createNewFunctionClick(Sender: TObject);
var
  i: integer;
begin
  //prüft und legt fest, ob eine Group Box schon benutzt wurde und zeigt die gewünschte an
  for i:=0 to 8 do begin
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
       if i = 3 then begin
          function4.visible := true;
       end;
       if i = 4 then begin
          function5.visible := true;
       end;
       if i = 5 then begin
          function6.visible := true;
       end;
       if i = 6 then begin
          function7.visible := true;
       end;
       if i = 7 then begin
          function8.visible := true;
       end;
       if i = 8 then begin
          function9.visible := true;
       end;
       exit;
    end;
    if functionCreated[8] = true then begin
       showmessage('You have reached the maximum of functions! You can either delete all by pressing "Delete All" or you press the delete Button on a specific function');
       exit;
    end;
  end;
end;
procedure TmainProgram.deleteAllClick(Sender: TObject);
var
  i: integer;
begin
   for i:=0 to 8 do begin
     functionCreated[i] := false;
   end;
   function1.visible := false;
   function2.visible := false;
   function3.visible := false;
   function4.visible := false;
   function5.visible := false;
   function6.visible := false;
   function7.visible := false;
   function8.visible := false;
   function9.visible := false;
end;

procedure TmainProgram.editClick(Sender: TObject);
begin
   function1.height := 184;
   edit.visible := false;
end;
procedure TmainProgram.collapseClick(Sender: TObject);
begin
   function1.height := 31;
   edit.visible := true;
end;



end.

