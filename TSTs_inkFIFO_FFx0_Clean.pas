unit TSTs_inkFIFO_FFx0_Clean;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkFIFO,
     inkStack_node, inkFIFO;

type

 tTests_inkFIFO_FFx0_Clean=class(tTSTCTC_CORE_inkFIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

type
  tTest_class=class
  public
    destructor DESTROY; override;
  end;

destructor tTest_class.DESTROY;
begin
    inherited;
end;

//=============================================================================

procedure tTests_inkFIFO_FFx0_Clean.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkFIFO_Clean(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FFx0_Clean.Clear_One;
begin
    STACK:=TST_node_Create(nil,nil);
    pInkStack(STACK)^.next:=STACK;
    //---
    inkFIFO_Clean(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FFx0_Clean.Clear_Two;
var last:pointer;
begin
    last :=TST_node_Create(nil,nil);
    STACK:=TST_node_Create(nil,last);
    pInkStack(last)^.next:=STACK;
    //---
    inkFIFO_Clean(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FFx0_Clean.Clear_Six;
var last:pointer;
begin
    last :=TST_node_Create(nil,nil);
    STACK:=TST_node_Create(nil,last);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    pInkStack(last)^.next:=STACK;
    //---
    inkFIFO_Clean(STACK);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_FFx0_Clean);
end.
