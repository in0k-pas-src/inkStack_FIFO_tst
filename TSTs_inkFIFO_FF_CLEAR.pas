unit TSTs_inkFIFO_FF_CLEAR;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkFIFO,
     inkFIFO;

type

 tTests_inkFIFO_FF_CLEAR=class(tTSTCTC_CORE_inkFIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure tTests_inkFIFO_FF_CLEAR.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FF_CLEAR.Clear_One;
begin
    STACK:=TST_stack_Create(1);
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FF_CLEAR.Clear_Two;
begin
    STACK:=TST_stack_Create(2);
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FF_CLEAR.Clear_Six;
begin
    STACK:=TST_stack_Create(6);
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_FF_CLEAR);
end.
