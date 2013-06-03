unit TSTs_inkFIFO_20x2_Enumerate;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkFIFO,
     inkFIFO;

type

 tTests_inkFIFO_20x2_Enumerate= class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _enumData_CLR(const DATA:pointer);
  protected
    function _Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
  published
    procedure Enumerate_Nil;
    procedure Enumerate_One;
    procedure Enumerate_Two;
    procedure Enumerate_SiX;
  end;

implementation

type
 rTests_EnumDATA=record
    owner  :tTSTCTC_CORE_inkFIFO;
    counter:NativeInt;
  end;
 pTests_EnumDATA=^rTests_EnumDATA;

function tTests_inkFIFO_20x2_Enumerate._Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
begin
    result:=true;
    //---
    with pTests_EnumDATA(DATA)^ do begin
      owner.AssertEquals('wrong enumerate Sequence', counter,owner.TST_DATA_Nmbr(NODE));
      counter:=counter+1;
    end;
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_20x2_Enumerate._enumData_CLR(const DATA:pointer);
begin
    with pTests_EnumDATA(DATA)^ do begin
      owner  :=SELF;
      counter:=0;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTests_inkFIFO_20x2_Enumerate.Enumerate_Nil;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(0);
   _enumData_CLR(@ddd);
    //--
    lst:=inkFIFO_Enumerate(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkFIFO_20x2_Enumerate.Enumerate_One;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(1);
   _enumData_CLR(@ddd);
    //--
    lst:=inkFIFO_Enumerate(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkFIFO_20x2_Enumerate.Enumerate_Two;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(2);
   _enumData_CLR(@ddd);
    //--
    lst:=inkFIFO_Enumerate(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkFIFO_20x2_Enumerate.Enumerate_SiX;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(6);
   _enumData_CLR(@ddd);
    //--
    lst:=inkFIFO_Enumerate(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_20x2_Enumerate);
end.

