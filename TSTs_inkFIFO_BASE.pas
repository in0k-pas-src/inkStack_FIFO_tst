unit TSTs_inkFIFO_BASE;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkFIFO,
     inkFIFO;

type

 tTests_inkFIFO_BASE=class(tTSTCTC_CORE_inkFIFO)
  published
    procedure Init_from_NIL;
    procedure Init_from_Self;
  published
    procedure isEmpty_to_NIL;
    procedure isEmpty_to_Self;
  end;

implementation

procedure tTests_inkFIFO_BASE.Init_from_NIL;
begin
    STACK:=nil;
    //---
    inkFIFO_INIT(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_BASE.Init_from_Self;
begin
    STACK:=self;
    //---
    inkFIFO_INIT(STACK);
    //---
    AssertNull(STACK);
    //---
    STACK:=NIL;
end;

procedure tTests_inkFIFO_BASE.isEmpty_to_NIL;
begin
    STACK:=nil;
    //---
    AssertTrue( inkFIFO_isEmpty(STACK) );
end;

procedure tTests_inkFIFO_BASE.isEmpty_to_Self;
begin
    STACK:=self;
    //---
    AssertFALSE( inkFIFO_isEmpty(STACK) );
    //---
    STACK:=NIL;
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_BASE);
end.
